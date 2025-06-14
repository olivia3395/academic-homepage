---
layout: single
title: "Projects"
permalink: /projects/
---

### 🔬 Research Projects

- **GraphonTrans: Structure-Aware Transfer Learning for Graph Link Prediction**

  *GraphonTrans* is a theoretically grounded transfer learning method designed for **link prediction under graph distribution shift**. In many real-world scenarios—such as social networks, biomedical graphs, or recommender systems—graphs collected from different domains may differ in density, connectivity, or latent topology, making standard link prediction methods unreliable when transferred.

  Our method leverages **graphon estimation** to recover latent edge probability structures and applies **cross-graph thresholding** to effectively align the structural differences between source and target graphs. We introduce a novel selection mechanism for the optimal transfer threshold via edge-level cross-validation, allowing **adaptive transfer** based on structural similarity.

  ✅ Key contributions include:
  - A formalization of **transfer learning on graphs** via latent graphon models  
  - A new **graphon thresholding strategy** that bridges source-target structure gaps  
  - Edge-level **cross-validation** to select transfer parameters without target supervision  
  - Theoretical guarantees on link prediction error under structure shift

  Our experiments demonstrate state-of-the-art performance on benchmark datasets including **IMDB-BINARY**, **REDDIT-BINARY**, and **COLLAB**, especially when target graphs are small or noisy.

  ![GraphonTrans Workflow](/assets/images/graphontrans_workflow.jpg)


- **NetPag**  
  A bagging-style graphon estimation framework using network perturbations for stable GNN classification.

- **Adaptive Source Selection**  
  Lepski’s method-based estimator for covariate shift with minimax-optimal risk bounds.

- **Urban Growth Modeling**  
  SAR, SLM, and Conv-LSTM models for spatial land-use forecasting.

👉 More at [GitHub](https://github.com/olivia3395)
