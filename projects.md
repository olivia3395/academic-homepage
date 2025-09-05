---
layout: single
title: "Projects"
permalink: /projects/
author_profile: true
---


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
  font-size: 22px;     /* 原来 28px，缩小一些 */
  font-weight: 400;    /* 更轻一点，避免过于粗重 */
  color: #333333;      /* 略柔和，避免刺眼 */
  margin-bottom: 0.8em;/* 和正文间距协调 */
}
</style>





### Research Projects


  - **Phase Transition in Nonparametric Minimax Rates for Covariate Shifts on Approximate Manifolds**

We study **nonparametric regression under covariate shift** with scarce target data near a **low-dimensional manifold** and abundant high-dimensional source data. We establish **new minimax rates** showing a **phase transition** driven by smoothness, intrinsic vs. ambient dimension, and sample sizes. Our **local polynomial estimator** (with an adaptive version for unknown smoothness/dimension) achieves the optimal rate. This unifies covariate shift, manifold learning, and adaptive inference, with sharp guarantees. *Under review at JASA* [arXiv:2507.00889](https://arxiv.org/abs/2507.00889).


  ![PhaseShift Workflow](/assets/images/phaseshift_workflow.jpg)


- **MKDnet: Multi-level Knowledge Distillation for Spatiotemporal Graph Forecasting**

*MKDnet* is a **multi-scale knowledge distillation** framework for spatiotemporal forecasting in traffic and mobility networks. It uses a **hierarchical student–teacher architecture** to transfer knowledge across spatial, temporal, and task levels. The teacher captures **long-range patterns**, while the lightweight student learns via **representation- and prediction-level distillation**. By combining **GCNs** with temporal modules (GRUs/attention), and applying **multi-level supervision**, *MKDnet* generalizes well to unseen regions and patterns.


  ![MKDnet Workflow](/assets/images/mkdnet_workflow.jpg)



- **AMGCN: Attentive Multi-Scale Graph Convolution for Urban Forecasting**

*AMGCN* is a **graph-based framework** for urban spatiotemporal prediction (traffic, air quality). It uses **adaptive multi-scale graph construction** to capture spatial heterogeneity and an **attentive multi-scale GCN** to fuse information across scales. With **GRUs** for temporal dynamics and **node-level gating** for robustness, *AMGCN* delivers scalable, interpretable forecasting under sparse or noisy conditions.

  ![AMGCN Workflow](/assets/images/amgcn_workflow.jpg)


### Ongoing Projects




- **Hypergraph-Augmented Knowledge Graph Embedding**

We develop a **hybrid embedding framework** that fuses **knowledge graphs** with **hypergraph co-occurrence signals** to capture higher-order semantics. By integrating **hypergraph encodings into GNNs** (GCN/HyperGCN), it improves **link prediction** in sparse biomedical data for **drug discovery and disease treatment**.


- **Network Varying Coefficient Models under Distribution Shift**

We build a **functional regression framework for time-evolving networks**, capturing node responses across temporal and spatial dimensions. It leverages **cross-network transfer learning** guided by **structural similarity**, improving generalization in **non-stationary environments**.

- **Transfer Learning for Community Detection**

We develop a framework for **transferring community detection** from high-resource to data-scarce networks by aligning latent modular structures. It improves **interpretability and accuracy** in low-sample regimes, with links to **SBMs** and applications in **misinformation tracking** and **subgroup discovery**.


👉 More at [GitHub](https://github.com/olivia3395)
