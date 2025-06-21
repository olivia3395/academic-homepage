# --- Required Libraries ---
library(dplyr)
library(tidyr)
library(ggplot2)
library(FNN)

# --- Run Simulation with Adaptive Procedure ---
source("functions_adaptive.R")
# --- Settings ---
n_s <- 10000  # Source sample size
target_sample_sizes <- c(1000, 2000, 3000, 4000, 5000, 10000, 15000, 20000, 25000, 30000)
num_simulations <- 100
degree <- 2
D <- 5  # Ambient dimension
alpha <- 2.5
set.seed(123)

# --- Define Mapping Function φ and Target Point ---
phi <- function(z) {
  cbind(
    (z + 1) / 2,
    z[, 1]^2,
    z[, 2]^2,
    (z[, 1] + 1) * (z[, 2] + 1) / 4
  )
}

# --- Define Regression Function f ---
f <- function(x, x0, alpha) {
  rowSums(abs(x - matrix(x0, nrow = nrow(x), ncol = ncol(x), byrow = TRUE))^alpha)
}

# --- Sample Target Point on Manifold ---
d_true <- 2
z_manifold <- runif(d_true, -0.5, 0.5)
x0_manifold <- phi(matrix(z_manifold, nrow = 1))


# --- Simulate Random Manifold Data for Estimating d ---
z_dummy <- matrix(runif(5000 * d_true, -1, 1), ncol = d_true)
X_dummy <- phi(z_dummy)
d_est <- estimate_intrinsic_dimension_manifold(X_dummy)
cat(sprintf("Estimated intrinsic dimension d = %d\n", d_est))



results_list <- calculate_mse_fixed_nP_lepski_oracle_split(
  target_sample_sizes = target_sample_sizes,
  n_s = n_s,
  x0_interior = x0_manifold,
  alpha_true = alpha,
  num_simulations = num_simulations,
  degree = degree,
  kernel_type = "gaussian"
)

results <- results_list$results_df
beta_df_combined <- results_list$beta_df_combined
beta_df_target <- results_list$beta_df_target
