---
layout: single
title: "Projects"
permalink: /projects/
---


<style>
.page__content p {
  font-family: "Georgia", serif;
  font-size: 17px;
  line-height: 1.7;
  color: #2a2a2a;
}
</style>



### 🔬 Research Projects

- **GraphonTrans: Transfer Learning with Graphon Models for Network Estimation**

  *GraphonTrans* is a transfer learning framework designed to improve the estimation of small networks by leveraging structural knowledge from larger, related graphs. Graphon models provide a flexible nonparametric approach for estimating latent edge probability matrices, and are foundational for tasks such as **link prediction** and **graph data augmentation**. However, high-quality graphon estimation usually requires large graphs—posing a challenge when only a small target graph is available. *GraphonTrans* addresses this limitation by aligning the target graph to a related large **source graph** via **Gromov-Wasserstein optimal transport**, and then transferring structural information using **neighborhood smoothing** techniques. To safeguard against **negative transfer**, we introduce a **debiasing mechanism** that adapts to target-specific discrepancies by applying residual smoothing corrections. This adaptive component ensures that only compatible structural information is transferred.

  ![GraphonTrans Workflow](/assets/images/graphontrans_workflow.jpg)


- **MKDnet: Multi-level Knowledge Distillation for Spatiotemporal Graph Forecasting**

*MKDnet* is a multi-scale knowledge distillation framework designed to enhance spatiotemporal forecasting in traffic and mobility networks. While existing models often struggle to generalize under sparse data or domain shifts, *MKDnet* introduces a hierarchical student-teacher architecture to transfer useful representations across time, space, and task levels. The teacher model operates at a high-capacity level, capturing long-term spatial-temporal dependencies with rich graph signals. Meanwhile, the student model is lightweight and fast, trained under the guidance of the teacher through **representation-level** and **prediction-level** distillation losses.

The framework further integrates **graph convolutional networks (GCNs)** and **temporal modeling modules** (such as GRUs or attention mechanisms) to capture dynamic topological changes. A key innovation is the use of **multi-level supervision**—including feature, hidden, and output states—allowing the student to learn not just final predictions but also intermediate behaviors. This ensures better adaptation to new regions or unseen traffic patterns.

![MKDnet Workflow](/assets/images/mkdnet_workflow.jpg)



- **NetPag**  
  A bagging-style graphon estimation framework using network perturbations for stable GNN classification.

- **Adaptive Source Selection**  
  Lepski’s method-based estimator for covariate shift with minimax-optimal risk bounds.



👉 More at [GitHub](https://github.com/olivia3395)
