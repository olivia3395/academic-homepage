---
layout: single
title: "Projects"
permalink: /projects/
author_profile: true
---



<!-- Custom font styling for homepage -->
<style>
.splash .page__content p,
.page__content p,
.archive__item-excerpt,
.archive__item-body {
  font-family: "Georgia", serif;
  font-size: 16px;
  line-height: 1.7;
  color: #2a2a2a;
  margin-bottom: 1.2em;
}

.page__title {
  font-family: "Georgia", serif;
  font-size: 28px;
  font-weight: 500;
}
</style>




### 🔬 Research Projects

- **GraphonTrans: Transfer Learning with Graphon Models for Network Estimation**

  *GraphonTrans* is a transfer learning framework designed to improve the estimation of small networks by leveraging structural knowledge from larger, related graphs. Graphon models provide a flexible nonparametric approach for estimating latent edge probability matrices, and are foundational for tasks such as **link prediction** and **graph data augmentation**. However, high-quality graphon estimation usually requires large graphs—posing a challenge when only a small target graph is available. *GraphonTrans* addresses this limitation by aligning the target graph to a related large **source graph** via **Gromov-Wasserstein optimal transport**, and then transferring structural information using **neighborhood smoothing** techniques. To safeguard against **negative transfer**, we introduce a **debiasing mechanism** that adapts to target-specific discrepancies by applying residual smoothing corrections. This adaptive component ensures that only compatible structural information is transferred.

  ![GraphonTrans Workflow](/assets/images/graphontrans_workflow.jpg)

  - **Phase Transition in Nonparametric Minimax Rates for Covariate Shifts on Approximate Manifolds**

  *PhaseShift* studies **nonparametric regression under covariate shift** when small labeled target data are supported by a large labeled source dataset, and the target covariates lie near a **low-dimensional manifold** within the source domain. Standard transfer methods often fail as density ratios may not exist or behave poorly in this setting. We establish **new minimax rates** for estimating Hölder class regression functions, revealing a **phase transition** governed by the target’s distance to the manifold, function smoothness, intrinsic and ambient dimensions, and source–target sample sizes. We propose a **local polynomial estimator** that attains the optimal rate across regimes, along with a **fully adaptive procedure** that adjusts to unknown smoothness and intrinsic dimension. Our results unify covariate shift, manifold learning, and adaptive nonparametric inference, providing sharp theoretical guarantees for structured, high-dimensional data.

  ![PhaseShift Workflow](/assets/images/phaseshift_workflow.jpg)




- **MKDnet: Multi-level Knowledge Distillation for Spatiotemporal Graph Forecasting**

  *MKDnet* is a multi-scale knowledge distillation framework for improving spatiotemporal forecasting in traffic and mobility networks. To address challenges like sparse data and domain shifts, it employs a hierarchical student–teacher architecture that transfers informative representations across spatial, temporal, and task levels. The high-capacity teacher captures long-range spatiotemporal patterns, while the lightweight student learns through both **representation-level** and **prediction-level** distillation. By integrating **graph convolutional networks (GCNs)** and **temporal modules** (e.g., GRUs or attention), *MKDnet* effectively models dynamic graph structures. Its **multi-level supervision**—from features to outputs—enhances generalization to unseen regions and patterns.
  
  ![MKDnet Workflow](/assets/images/mkdnet_workflow.jpg)



- **AMGCN: Attentive Multi-Scale Graph Convolution for Urban Forecasting**

  *AMGCN* is a graph-based framework for spatiotemporal prediction in urban systems like traffic and air quality. It introduces an adaptive **multi-scale graph construction** mechanism that captures spatial heterogeneity by dynamically selecting neighborhood ranges per node. The model’s core is an **attentive multi-scale GCN layer**, which fuses information across different spatial scales with learned attention weights. Temporally, it integrates **GRUs** to track evolving patterns. Lightweight **node-level gating** and **feature fusion** further enhance its flexibility and robustness. *AMGCN* achieves strong performance under sparse or noisy conditions, offering a scalable and interpretable solution for dynamic urban forecasting.

  ![AMGCN Workflow](/assets/images/amgcn_workflow.jpg)


### 🚧 Ongoing Projects

- **Transfer Learning for Community Detection**

  This project focuses on developing a principled framework for transferring community detection knowledge from well-studied, high-resource graphs to structurally similar but data-scarce networks. By leveraging the latent modular structure and aligning key topological patterns, we aim to enhance interpretability and detection accuracy in low-sample regimes—such as marginalized communities or under-observed social systems. The work also explores connections to stochastic block models and robust optimization, with potential applications in areas like misinformation tracking and subgroup discovery.

- **Hypergraph-Augmented Knowledge Graph Embedding**

  Real-world knowledge often involves complex, higher-order interactions that are difficult to capture using pairwise relationships alone. This project introduces a hybrid embedding framework that combines knowledge graph link structures with hypergraph-based co-occurrence signals to better capture multi-entity semantics. The approach integrates hypergraph encodings into graph neural network architectures (e.g., GCN, HyperGCN), supporting more robust and expressive link prediction, especially in sparse and noisy biomedical datasets. Applications include drug discovery, disease treatment, and multi-relational reasoning under limited supervision.

- **Network Varying Coefficient Models under Distribution Shift**
  
  Motivated by dynamic systems such as urban traffic and information diffusion, this project proposes a functional regression framework tailored for time-evolving networks. By modeling how node-level responses vary across both temporal and spatial dimensions, the method adapts to shifting domain structures through cross-network transfer learning. A key focus is on measuring structural similarity between source and target graphs to guide reliable information borrowing, ensuring improved generalization and adaptability in non-stationary environments.


👉 More at [GitHub](https://github.com/olivia3395)
