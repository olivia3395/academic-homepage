---
layout: single
title: "Projects"
permalink: /projects/
---

### 🔬 Research Projects

- **GraphonTrans: Transfer Learning with Graphon Models for Network Estimation**

  *GraphonTrans* is a transfer learning framework designed to improve the estimation of small networks by leveraging structural knowledge from larger, related graphs. Graphon models provide a flexible nonparametric approach for estimating latent edge probability matrices, and are foundational for tasks such as **link prediction** and **graph data augmentation**. However, high-quality graphon estimation usually requires large graphs—posing a challenge when only a small target graph is available. *GraphonTrans* addresses this limitation by aligning the target graph to a related large **source graph** via **Gromov-Wasserstein optimal transport**, and then transferring structural information using **neighborhood smoothing** techniques. To safeguard against **negative transfer**, we introduce a **debiasing mechanism** that adapts to target-specific discrepancies by applying residual smoothing corrections. This adaptive component ensures that only compatible structural information is transferred.

  ![GraphonTrans Workflow](/assets/images/graphontrans_workflow.jpg)


- **NetPag**  
  A bagging-style graphon estimation framework using network perturbations for stable GNN classification.

- **Adaptive Source Selection**  
  Lepski’s method-based estimator for covariate shift with minimax-optimal risk bounds.

- **Urban Growth Modeling**  
  SAR, SLM, and Conv-LSTM models for spatial land-use forecasting.

👉 More at [GitHub](https://github.com/olivia3395)
