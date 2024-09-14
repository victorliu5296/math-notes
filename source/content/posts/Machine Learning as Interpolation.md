---
title: 'Machine Learning as Interpolation'
date: 2024-09-13T21:51:58-04:00
math: katex
description: ""
categories: []
tags: []
weight: 100
---

This is a post on the interpretation of machine learning models as interpolating between training points. It is inspired by the recent [video](https://www.youtube.com/watch?v=5eqRuVp65eY) "AI can't cross this line and we don't know why" by Welch Labs, containing great visualizations. The bulk of the mathematical details are taken from the paper *"A Neural Scaling Law from the Dimension of the Data Manifold"* by Utkarsh Sharma and Jared Kaplan.

### 1. **Formalizing the Problem: Learning and Generalization as Interpolation**

We are interested in understanding how overparameterized machine learning models (like neural networks) generalize when trained on data that lies on a lower-dimensional manifold embedded in a high-dimensional input space. The central idea is that models interpolate between training points on this manifold rather than memorizing individual points or approximating functions across the entire high-dimensional input space.

Let’s define some key quantities and introduce the scaling law that relates the generalization error to the model size and data manifold properties.

### 2. **Key Definitions**

- **Input Space**: The data points \(\mathbf{x}_i \in \mathbb{R}^D\) lie in a high-dimensional space of dimension \(D\). For example, an image in a dataset like CIFAR-10 might have \(D = 32 \times 32 \times 3 = 3072\).
  
- **Data Manifold**: Despite the data living in a high-dimensional space, it is assumed that the data resides on or near a lower-dimensional manifold \(\mathcal{M}\), embedded in \(\mathbb{R}^D\), where the **intrinsic dimension** of this manifold is \(d\). For natural images, for example, \(d \ll D\), because the space of meaningful images is much smaller than the space of arbitrary pixel configurations.

- **Generalization Error**: Denoted as \( \epsilon_{\text{gen}}(N, P) \), where \(N\) is the number of training samples and \(P\) is the number of parameters in the model. This error quantifies how well the model performs on unseen data (from the same distribution as the training data).

- **Capacity of the Model**: The number of parameters \(P\) in the model. In overparameterized regimes, \(P > N\).

- **Scaling Law**: The relationship between generalization error, model size, and data dimensionality.

### 3. **Scaling Law for Generalization Error**

The key insight from the paper is that the generalization error scales predictably as a function of \(N\), \(P\), and the intrinsic dimension \(d\) of the data manifold. The scaling law they propose is:

\[
\epsilon_{\text{gen}}(N, P) \sim \left(\frac{N}{P}\right)^{\alpha(d)}
\]

Where:
- \(\alpha(d)\) is a function of the intrinsic dimension \(d\). Specifically, \(\alpha(d)\) depends on the structure of the data manifold and the model architecture.

#### **Derivation of the Scaling Law**

To derive this scaling law, the authors rely on assumptions from statistical learning theory and empirical observations of deep neural networks:

1. **Effective Number of Parameters**: In practice, not all \(P\) parameters are independent because the model is constrained by the data manifold. This means that the effective number of parameters is smaller than \(P\), especially for smaller data manifolds. The effective capacity of the model scales with \(d\), the dimension of the manifold, rather than \(D\), the ambient dimension.

   The effective number of parameters is approximately:

   \[
   P_{\text{eff}} \sim P^{\frac{d}{D}}
   \]

2. **Generalization Bound**: The generalization error for neural networks, when trained with \(N\) samples, typically scales as:

   \[
   \epsilon_{\text{gen}} \sim \left(\frac{N}{P_{\text{eff}}}\right)^{\frac{2}{d}}
   \]

   This is derived by considering the complexity of the hypothesis class of the model and the number of independent samples required to cover the data manifold. As \(d\) increases, the model requires more data to generalize, which is why the exponent \(\frac{2}{d}\) appears in the formula.

### 4. **Interpretation of the Scaling Law**

#### **Generalization Error and Model Size**

For large models where \(P \gg N\), the scaling law implies that the generalization error decreases as:

\[
\epsilon_{\text{gen}} \sim \left(\frac{N}{P^{\frac{d}{D}}}\right)^{\frac{2}{d}}
\]

Thus, the generalization error improves as the number of parameters \(P\) increases. However, the rate of improvement depends on the intrinsic dimension \(d\) of the data manifold. In particular, if \(d\) is small (the data lies on a low-dimensional manifold), the model can generalize well even with fewer samples.

#### **Impact of the Data Manifold Dimensionality**

The intrinsic dimension \(d\) of the data manifold plays a crucial role in determining how efficiently the model can interpolate between data points:

- For lower-dimensional manifolds (\(d\) small), models generalize more effectively from a limited number of samples, since fewer parameters are needed to "fill in" the space between training points.

- For higher-dimensional manifolds (\(d\) large), the model requires more parameters and more data to generalize well. The generalization error decreases more slowly as a function of model size.

#### **Double Descent Phenomenon**

This framework also helps explain the **double descent** phenomenon observed in neural networks. In the classical bias-variance tradeoff, increasing model complexity beyond a certain point leads to overfitting and higher generalization error. However, for large overparameterized models, the error starts decreasing again (the second descent).

In the interpolation view, this can be understood as follows: when the model has a large number of parameters, it can interpolate smoothly across the data manifold, rather than overfitting specific points. As the model grows in size, it finds a "flat" region in the parameter space where it generalizes well across the data manifold.

### 5. **Practical Insights from the Scaling Law**

The scaling law provides several practical insights for designing machine learning systems:

- **Choosing Model Size**: The optimal model size should depend on the intrinsic dimension of the data manifold. For datasets with a small manifold dimension \(d\), smaller models can generalize well, while larger models are needed for more complex datasets with higher intrinsic dimensions.

- **Data Augmentation and Manifold Expansion**: Data augmentation can be seen as expanding the effective size of the data manifold, making it easier for the model to generalize by providing more coverage of the manifold. In the context of the scaling law, this can be interpreted as increasing \(N\) (effective number of samples), thereby reducing the generalization error.

---

### 6. **Conclusion and Future Directions**

By viewing machine learning models as interpolators between points on a data manifold, we gain new insights into how overparameterized models generalize. The scaling laws presented in *"A Neural Scaling Law from the Dimension of the Data Manifold"* provide a quantitative framework to understand how generalization error scales with model size, number of training samples, and the intrinsic dimension of the data.

This perspective opens up many avenues for future research, including:

- **Characterizing the Intrinsic Dimension**: Understanding the intrinsic dimension of different datasets is critical for applying the scaling law in practice. Future work could focus on estimating \(d\) for various types of data (e.g., images, text) and seeing how it affects model performance.

- **Model Architecture and Data Manifolds**: Can we design architectures that explicitly exploit the low-dimensional structure of data manifolds? Some architectures, like convolutional networks for images, implicitly leverage low-dimensional structure, but there may be room for improvement.

- **Extensions to Other Models**: While the focus here has been on deep neural networks, similar scaling laws could apply to other machine learning models. For example, support vector machines (SVMs) or decision trees could be studied in this framework, leading to a more unified theory of generalization.