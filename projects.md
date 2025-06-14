---
layout: splash
title: "Projects"
permalink: /projects/
---



<!-- Custom font styling for homepage -->
<style>
.splash .page__content p,
.page__content p,
.archive__item-excerpt,
.archive__item-body {
  font-family: "Georgia", serif;
  font-size: 18px;
  line-height: 1.7;
  color: #2a2a2a;
  margin-bottom: 1.2em;
}

.page__title {
  font-family: "Georgia", serif;
  font-size: 32px;
  font-weight: 500;
}
</style>




### 🔬 Research Projects

- **GraphonTrans: Transfer Learning with Graphon Models for Network Estimation**

  *GraphonTrans* is a transfer learning framework designed to improve the estimation of small networks by leveraging structural knowledge from larger, related graphs. Graphon models provide a flexible nonparametric approach for estimating latent edge probability matrices, and are foundational for tasks such as **link prediction** and **graph data augmentation**. However, high-quality graphon estimation usually requires large graphs—posing a challenge when only a small target graph is available. *GraphonTrans* addresses this limitation by aligning the target graph to a related large **source graph** via **Gromov-Wasserstein optimal transport**, and then transferring structural information using **neighborhood smoothing** techniques. To safeguard against **negative transfer**, we introduce a **debiasing mechanism** that adapts to target-specific discrepancies by applying residual smoothing corrections. This adaptive component ensures that only compatible structural information is transferred.

  ![GraphonTrans Workflow](/assets/images/graphontrans_workflow.jpg)


- **MKDnet: Multi-level Knowledge Distillation for Spatiotemporal Graph Forecasting**
  *MKDnet* is a multi-scale knowledge distillation framework for improving spatiotemporal forecasting in traffic and mobility networks. To address challenges like sparse data and domain shifts, it employs a hierarchical student–teacher architecture that transfers informative representations across spatial, temporal, and task levels. The high-capacity teacher captures long-range spatiotemporal patterns, while the lightweight student learns through both **representation-level** and **prediction-level** distillation. By integrating **graph convolutional networks (GCNs)** and **temporal modules** (e.g., GRUs or attention), *MKDnet* effectively models dynamic graph structures. Its **multi-level supervision**—from features to outputs—enhances generalization to unseen regions and patterns.
  
  ![MKDnet Workflow](/assets/images/mkdnet_workflow.jpg)


- **NetPag**  
  A bagging-style graphon estimation framework using network perturbations for stable GNN classification.

- **Adaptive Source Selection**  
  Lepski’s method-based estimator for covariate shift with minimax-optimal risk bounds.



👉 More at [GitHub](https://github.com/olivia3395)
