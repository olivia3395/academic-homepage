

# ----------------------------------------------------
# Intrinsic Dimension Estimation (Levina-Bickel Method)
# ----------------------------------------------------

estimate_intrinsic_dimension_manifold <- function(X, k = 10) {
  # Compute k-nearest neighbor distances
  nn_distances <- FNN::get.knn(X, k = k)$nn.dist
  r_k <- nn_distances[, k]
  r_half_k <- nn_distances[, ceiling(k / 2)]
  
  # Local dimension estimate
  local_d <- log(2) / log(r_k / r_half_k)
  local_d <- local_d[is.finite(local_d) & local_d > 0]
  
  # Average-based estimator
  d_avg <- round(mean(pmin(local_d, D)))
  
  # Voting-based estimator
  d_freq_table <- table(round(local_d))
  d_vote <- as.numeric(names(d_freq_table)[which.max(d_freq_table)])
  
  return(as.numeric(d_avg))  # or return both d_avg and d_vote if needed
}



# --- Fixed Source Size on Manifold with Lepskii's Adaptive Procedure ---

# This function performs a simulation study to compare adaptive bandwidth selection using Lepskii's method
# for both combined and target-only estimators, against oracle choices, under manifold setting.
# The function returns MSEs and selected smoothness levels (beta) for each estimator.




# ------------------------------------------------------------------------
# Function: calculate_mse_fixed_nP_lepski_oracle_split
# Purpose:  Compare the MSE performance of local polynomial estimators
#           under covariate shift using (1) Lepskii-adaptive bandwidth 
#           and (2) Oracle bandwidth, for both Combined and Target-only data.
#           This function simulates data under a manifold setting.
#
# Inputs:
#   - target_sample_sizes: vector of target domain sample sizes
#   - n_s: fixed number of source domain samples
#   - x0_interior: evaluation point on the manifold
#   - alpha_true: true smoothness of the regression function
#   - num_simulations: number of repetitions per setting
#   - degree: polynomial degree for local regression
#   - kernel_type: kernel type for local polynomial regression
#
# Outputs:
#   - results_df: data.frame with MSEs, SEs, and estimator labels
#   - beta_df_combined: selected beta values for Combined estimator
#   - beta_df_target: selected beta values for Target-only estimator
# ------------------------------------------------------------------------

calculate_mse_fixed_nP_lepski_oracle_split <- function(
    target_sample_sizes, n_s, x0_interior, alpha_true, 
    num_simulations, degree, kernel_type = "gaussian"
) {
  simulation_results <- list()
  beta_record_combined <- list()
  beta_record_target <- list()
  
  for (i in seq_along(target_sample_sizes)) {
    n_t <- target_sample_sizes[i]
    
    # Storage for simulations
    beta_values_combined <- numeric(num_simulations)
    beta_values_target <- numeric(num_simulations)
    h_combined_record <- numeric(num_simulations)
    h_target_record <- numeric(num_simulations)
    mse_c_sim <- mse_t_sim <- oracle_c_sim <- oracle_t_sim <- numeric(num_simulations)
    
    for (j in 1:num_simulations) {
      # Generate data
      x_s <- matrix(runif(n_s * D, 0, 1), ncol = D)
      y_s <- f(x_s, x0_interior, alpha_true) + rnorm(n_s)
      
      z_t <- matrix(runif(n_t * d, -1, 1), ncol = d)
      x_t <- phi(z_t)
      y_t <- f(x_t, x0_interior, alpha_true) + rnorm(n_t)
      
      x_combined <- rbind(x_s, x_t)
      y_combined <- c(y_s, y_t)
      
      # -----------------------------
      # Lepskii Bandwidth: Combined
      # -----------------------------
      n_eff <- n_t + n_s
      beta_candidates <- seq(1, 4, by = 1 / log(n_eff))
      C_combined <- 0.4
      best_beta_c <- NULL
      
      for (beta in beta_candidates) {
        h_beta <- (n_t + n_s^((2 * beta + d) / (2 * beta + D)))^(-1 / (2 * beta + d))
        stable <- TRUE
        for (eta in beta_candidates) {
          if (eta <= beta) {
            h_eta <- (n_t + n_s^((2 * eta + d) / (2 * eta + D)))^(-1 / (2 * eta + d))
            diff <- abs(local_polynomial_estimator(x_combined, y_combined, x0_interior, degree, h_beta, kernel_type) -
                          local_polynomial_estimator(x_combined, y_combined, x0_interior, degree, h_eta, kernel_type))
            if (diff > C_combined * h_eta^eta) {
              stable <- FALSE
              break
            }
          }
        }
        if (stable) best_beta_c <- beta
      }
      
      if (is.null(best_beta_c)) best_beta_c <- min(beta_candidates)
      beta_values_combined[j] <- best_beta_c
      h_combined <- 2 * (n_t + n_s^((2 * best_beta_c + d) / (2 * best_beta_c + D)))^(-1 / (2 * best_beta_c + d))
      h_combined_record[j] <- h_combined
      
      # -----------------------------
      # Lepskii Bandwidth: Target-only
      # -----------------------------
      beta_candidates <- seq(1, 4, by = 1 / log(n_t))
      C_targetonly <- 0.4
      best_beta_t <- NULL
      
      for (beta in beta_candidates) {
        h_beta <- n_t^(-1 / (2 * beta + d))
        stable <- TRUE
        for (eta in beta_candidates) {
          if (eta <= beta) {
            h_eta <- n_t^(-1 / (2 * eta + d))
            diff <- abs(local_polynomial_estimator(x_t, y_t, x0_interior, degree, h_beta, kernel_type) -
                          local_polynomial_estimator(x_t, y_t, x0_interior, degree, h_eta, kernel_type))
            if (diff > C_targetonly * h_eta^eta) {
              stable <- FALSE
              break
            }
          }
        }
        if (stable) best_beta_t <- beta
      }
      
      if (is.null(best_beta_t)) best_beta_t <- min(beta_candidates)
      beta_values_target[j] <- best_beta_t
      h_target <- 1 * n_t^(-1 / (2 * best_beta_t + d))
      h_target_record[j] <- h_target
      
      # -----------------------------
      # Oracle Bandwidth
      # -----------------------------
      oracle_bandwidth_combined <- 2 * (n_t + n_s^((2 * alpha_true + d) / (2 * alpha_true + D)))^(-1 / (2 * alpha_true + d))
      oracle_bandwidth_target <- 1 * n_t^(-1 / (2 * alpha_true + d))
      
      # Estimation
      m_hat_c <- local_polynomial_estimator(x_combined, y_combined, x0_interior, degree, h_combined, kernel_type)
      m_hat_t <- local_polynomial_estimator(x_t, y_t, x0_interior, degree, h_target, kernel_type)
      m_hat_c_oracle <- local_polynomial_estimator(x_combined, y_combined, x0_interior, degree, oracle_bandwidth_combined, kernel_type)
      m_hat_t_oracle <- local_polynomial_estimator(x_t, y_t, x0_interior, degree, oracle_bandwidth_target, kernel_type)
      
      # MSE
      truth <- f(matrix(x0_interior, ncol = d, byrow = TRUE), x0_interior, alpha_true)
      mse_c_sim[j] <- (m_hat_c - truth)^2
      mse_t_sim[j] <- (m_hat_t - truth)^2
      oracle_c_sim[j] <- (m_hat_c_oracle - truth)^2
      oracle_t_sim[j] <- (m_hat_t_oracle - truth)^2
    }
    
    cat(sprintf("Target Size: %d | Mean β_combined: %.4f (SD: %.4f) | Mean h_comb: %.6f | Mean MSE_c: %.6f\n",
                n_t, mean(beta_values_combined), sd(beta_values_combined), mean(h_combined_record), mean(mse_c_sim)))
    cat(sprintf("              | Mean β_target: %.4f (SD: %.4f) | Mean h_target: %.6f | Mean MSE_t: %.6f\n",
                mean(beta_values_target), sd(beta_values_target), mean(h_target_record), mean(mse_t_sim)))
    
    beta_record_combined[[i]] <- data.frame(target_sample_size = n_t, beta_selected = beta_values_combined)
    beta_record_target[[i]] <- data.frame(target_sample_size = n_t, beta_selected = beta_values_target)
    
    simulation_results[[i]] <- data.frame(
      target_sample_size = n_t,
      mse_combined = mean(mse_c_sim),
      mse_target = mean(mse_t_sim),
      se_combined = sd(mse_c_sim) / sqrt(num_simulations),
      se_target = sd(mse_t_sim) / sqrt(num_simulations),
      oracle_mse_combined = mean(oracle_c_sim),
      oracle_mse_target = mean(oracle_t_sim),
      oracle_se_combined = sd(oracle_c_sim) / sqrt(num_simulations),
      oracle_se_target = sd(oracle_t_sim) / sqrt(num_simulations)
    )
  }
  
  # Format results for plotting
  combined_results <- bind_rows(simulation_results) %>%
    pivot_longer(
      cols = c(mse_combined, mse_target, oracle_mse_combined, oracle_mse_target),
      names_to = "estimator", values_to = "mse"
    ) %>%
    mutate(
      se = case_when(
        estimator == "mse_combined" ~ se_combined,
        estimator == "mse_target" ~ se_target,
        estimator == "oracle_mse_combined" ~ oracle_se_combined,
        estimator == "oracle_mse_target" ~ oracle_se_target
      ),
      estimator = case_when(
        estimator == "mse_combined" ~ "Lepskii-Combined",
        estimator == "mse_target" ~ "Lepskii-TargetOnly",
        estimator == "oracle_mse_combined" ~ "Oracle-Combined",
        estimator == "oracle_mse_target" ~ "Oracle-TargetOnly"
      ),
      upper_bound = mse + 1.96 * se,
      lower_bound = mse - 1.96 * se
    )
  
  beta_df_combined <- do.call(rbind, beta_record_combined)
  beta_df_target <- do.call(rbind, beta_record_target)
  
  return(list(
    results_df = combined_results,
    beta_df_combined = beta_df_combined,
    beta_df_target = beta_df_target
  ))
}



