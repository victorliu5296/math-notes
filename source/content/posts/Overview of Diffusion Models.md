---
title: 'Overview of Diffusion Models'
date: 2024-09-14T10:54:40-04:00
math: katex
description: "An overview of diffusion models, including their mathematical foundations, key concepts, and practical applications."
categories: [Machine Learning]
tags: [Diffusion Models, Generative Models, Image Generation, Overview]
weight: 100
draft: false
---

### Introduction to Diffusion Models
Diffusion models are a class of generative models that have gained significant attention in recent years, particularly for their impressive results in image generation. The core idea is to gradually add noise to data and then learn to reverse this process.

Notable examples include Stable Diffusion, DALL-E, Midjourney, and the recent Flux model.

Diffusion models are a type of generative model that create high-quality samples (like images) by learning to reverse a process that gradually adds noise to the data. The core idea is to start with a data sample, corrupt it with noise over time, and then learn a model that can reverse this corruption to reconstruct or generate new data.

---

### 1. Brief History of Diffusion Models

### **1.1. Evolution of Image Generation in Machine Learning**

| **Date** | **Model**                      | **Key Innovation**                                                                                                                                 | **Strengths**                                    | **Weaknesses**                            |
| -------- | ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------ | ----------------------------------------- |
| **2014** | GANs (Goodfellow et al.)       | Generator and discriminator trained in a minimax game to produce realistic images.                                                                 | Sharp, realistic images                          | Unstable training, mode collapse          |
| **2014** | VAEs (Kingma & Welling)        | Probabilistic framework using latent variables for image generation.                                                                               | Stable training, well-defined probabilities      | Blurry images                             |
| **2016** | PixelCNN (van den Oord et al.) | Autoregressive model generating images pixel by pixel, with explicit likelihood.                                                                   | Likelihood modeling, captures pixel dependencies | Slow, limited global coherence            |
| **2019** | BigGAN                         | Large-scale GAN models, improving quality and diversity in image generation.                                                                       | High-resolution, diverse images                  | Requires enormous computational resources |
| **2019** | VQ-VAE-2 (DeepMind)            | Combines discrete latent spaces and hierarchy to improve image generation quality.                                                                 | High-quality, diverse images                     | Complex architecture                      |
| **2020** | DALL-E (OpenAI)                | Text-to-image generation, using multimodal learning to generate images from descriptions.                                                          | Breakthrough in text-to-image generation         | High computational cost                   |
| **2021** | DDPMs (Ho et al.)              | Denoising Diffusion Probabilistic Models (DDPMs): diffusion models for generating images by denoising a Gaussian noise process over several steps. | Stable training, high-quality images             | Slow sampling                             |
| **2022** | Latent Diffusion Models (LDMs) | Diffusion models operating in a lower-dimensional latent space for faster and more efficient generation.                                           | Fast sampling, highly realistic images           | Computationally complex model design      |

---

### **1.2. Prerequisites for Modern Diffusion Models**

| **Date**        | **Concept/Model**                                | **Key Contribution**                                                                                               |
| --------------- | ------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| **1980s–1990s** | Thermodynamics & Stochastic Processes            | Foundations in non-equilibrium thermodynamics and stochastic processes. Brownian motion, Fokker-Planck equations.  |
| **2004**        | Denoising Autoencoders (Vincent)                 | Early model for denoising noisy inputs, a precursor to the reverse diffusion process.                              |
| **2011**        | Score Matching (Hyvärinen)                       | Technique for matching the gradient of the data distribution, central to score-based diffusion models.             |
| **2014**        | Variational Inference in VAEs (Kingma & Welling) | Introduced variational methods to infer latent variables, inspiring inference methods in diffusion models.         |
| **2015**        | Deep Generative Models with Gaussian Noise       | Emphasized stochastic processes in generative modeling, including the use of Gaussian noise.                       |
| **2019**        | Neural ODEs (Chen et al.)                        | Continuous-time neural network models, inspiring continuous diffusion models and variants like score-based models. |
| **2020**        | Score-Based Generative Models (Song & Ermon)     | Unified framework combining score matching and reverse diffusion, leading to efficient diffusion-based models.     |
| **2021**        | Denoising Diffusion Probabilistic Models (Ho)    | Formalized forward and reverse diffusion processes using variational inference, making diffusion models practical. |

---

## Mathematical Foundations of Diffusion Models

### High-Level Intuition
Imagine starting with a clear image and progressively adding small amounts of noise over time until it becomes pure noise. If we can somehow manage to reverse this process in a non-deterministic way, we can generate novel, high-quality samples from a learned data distribution starting from nothing but random noise (basically, from scratch).

Indeed, the success of diffusion models shows that this is indeed possible. Diffusion models are a type of generative model that create high-quality samples (like images) by learning to reverse a process that gradually adds noise to the data. The core idea is to start with a data sample, corrupt it with noise over time, and then learn a model that can reverse this corruption to reconstruct or generate new data.

The following are the fundamental processes that make diffusion models work:

- **Forward Process**: Start with clean data and add noise gradually over several steps until the data becomes almost indistinguishable from random noise.
- **Reverse Process**: Learn to reverse this noise-adding process step by step, generating clean data starting from noise.


### Key Concepts

1. **Forward Diffusion Process**: Gradually adding noise to data
2. **Reverse Diffusion Process**: Learning to remove noise step-by-step
3. **Training Objective**: Predicting and removing added noise
4. **Sampling**: Generating new data by denoising random noise

### The Forward Diffusion Process

#### Mathematical Formulation
Let $x_0$ be our original data point (e.g., an image). The forward diffusion process adds Gaussian noise over $T$ timesteps:

$$q(x_t | x_{t-1}) = \mathcal{N}(x_t; \sqrt{1 - \beta_t} x_{t-1}, \beta_t I)$$

Where:
- $x_t$ is the noisy version of the data at timestep $t$
- $\beta_t$ is a variance schedule (typically small and increasing over time)
- $\mathcal{N}(\mu, \Sigma)$ denotes a Gaussian distribution with mean $\mu$ and covariance $\Sigma$
- The notation $\mathcal{N}(x; \mu, \Sigma)$ is shorthand for $x \sim \mathcal{N}(\mu, \Sigma)$
- $I$ is the identity matrix

#### Closed Form for Noisy Data
We can directly express $x_t$ in terms of the original data $x_0$ and noise $\epsilon \sim \mathcal{N}(0, I)$:

$$x_t = \sqrt{\bar{\alpha}_t} x_0 + \sqrt{1 - \bar{\alpha}_t} \epsilon$$

Where $\bar{\alpha}_t = \prod_{i=1}^t (1 - \beta_i)$

### The Reverse Diffusion Process

#### Mathematical Formulation
The reverse process is defined as:

$$p_\theta(x_{t-1} | x_t) = \mathcal{N}(x_{t-1}; \mu_\theta(x_t, t), \Sigma_\theta(x_t, t))$$

Where:
- $\mu_\theta$ and $\Sigma_\theta$ are learned functions (typically neural networks)
- $\theta$ represents the parameters of these functions

### Training Objective

The model is trained to predict the noise added at each timestep. A common objective is denoising score matching:

$$
\begin{aligned}
L(\theta) :=& \, \mathbb{E}_{t, x_0, \epsilon} \left[ \|\epsilon - \epsilon_\theta(x_t, t)\|^2 \right] \\
=& \, \mathbb{E}_{t, x_0, \epsilon} \left[ \left\| \epsilon - \epsilon_\theta(\sqrt{\bar \alpha_t} x_0 + \sqrt{1 - \bar \alpha_t} \epsilon, t) \right\|^2 \right] \\
\end{aligned}
$$

Where:
- $\epsilon \sim \mathcal{N}(0, I)$ is the noise added to the data
- $\epsilon_\theta(x_t, t)$ is the model's prediction of the **total cumulated** noise at timestep $t$

It is important to note that although the reverse process is iterative such that we subtract a part of the noise at each step, the objective of the model is to find the **total** noise at that step (therefore, recovering the original image) in a single step.

Empirically, trying to predict the noise between a single step does not work well. Intuitively, this is likely because two noisy images tend to look similar and have similar features, so the model has a hard time finding the correct noise to subtract.

Effectively, if the model were trained to predict the next intermediate timestep $x_{t}$ from $x_{t-1}$​ directly, it would have to explicitly learn the full sequence of steps in the reverse process. This would complicate the training procedure:

- The model would need to learn how to transition between each intermediate distribution at each step.
- It would be more prone to error accumulation—if the model makes a mistake at one step, that error could propagate through subsequent steps, degrading the quality of the final output.

An explanation on why the reverse process is then iterative is mentioned in the questions section.

### Sampling (Generation)

To generate new data, we start from pure noise $x_T \sim \mathcal{N}(0, I)$ and gradually reverse the diffusion process to generate a sample $x_0$ from the data distribution. This involves sampling $x_{T-1}, x_{T-2}, \dots, x_0$ by following the learned reverse process $p_\theta(x_{t-1} | x_t)$.

The sampling process can be described as:

$$x_{t-1} = \frac{1}{\sqrt{1 - \beta_t}}\left(x_t - \frac{\beta_t}{\sqrt{1 - \bar{\alpha}_t}}\epsilon_\theta(x_t, t)\right) + \sqrt{\beta_t}\epsilon$$

Where $\epsilon$ is fresh Gaussian noise at each step.

### Key Points and Common Areas of Confusion

1. **Gaussian Noise**: Used for its mathematical simplicity and properties like the Central Limit Theorem.

2. **Markov Process**: Simplifies forward and reverse processes, making computations tractable.

3. **Model Learning**: The model learns to predict the noise added at each timestep, allowing it to denoise data and recover original samples.

4. **Comparison to Other Models**: Unlike GANs or VAEs, diffusion models use a more direct probabilistic formulation and tend to have more stable training dynamics.

5. **Variance Schedule**: The choice of $\beta_t$ can significantly impact model performance.

6. **Continuous Time Formulation**: Some papers use stochastic differential equations for a continuous time formulation.

7. **Prediction Targets**: While we've described predicting $\epsilon$, some formulations predict $x_0$ or other quantities.

8. **Sampling Techniques**: Various techniques like DDIM or ancestral sampling can accelerate the sampling process or provide more control.

9. **Loss Weighting**: The loss is often reweighted to focus more on less noisy timesteps, improving sample quality.

## Other Questions

### 1. Why Use an Iterative Procedure Rather Than One-Shotting It?

The iterative reverse process procedure in diffusion models is crucial for several reasons:

a) **Tractability**: Reversing the noise process in one step would require modeling an extremely complex distribution. By breaking it down into many small steps, we make each step simpler and more tractable.

b) **Quality**: The gradual denoising allows the model to refine its predictions at each step, leading to higher quality outputs. It's akin to an artist starting with a rough sketch and gradually refining details.

c) **Flexibility**: The iterative process allows for more control over the generation process. We can intervene at different steps, guide the generation, or even interpolate between samples.

d) **Theoretical Grounding**: The iterative process is grounded in the mathematics of Markov chains and stochastic processes, providing a solid theoretical foundation.

### 2. Why Reinject Noise at Each Step (Excluding the Last)?

Reinjecting a small amount of noise at each denoising step (except the final one) serves several purposes:

a) **Preventing Collapse**: It helps prevent the model from collapsing to a single point or a small subset of the data distribution.

b) **Exploration**: The added noise allows the model to explore slightly different paths during generation, potentially leading to more diverse outputs.

c) **Consistency with Training**: During training, the model learns to predict and remove noise. By reinjecting noise during sampling, we maintain consistency with the training process.

d) **Stochastic Sampling**: It turns the deterministic reverse process into a stochastic one, which can help in generating more natural and varied samples.

### 3. How Do Diffusion Models Compare to GANs and VAEs?

- **Stability**: Diffusion models often have more stable training compared to GANs.
- **Quality**: They can produce very high-quality samples, often competitive with or surpassing GANs.
- **Diversity**: They typically offer better sample diversity than GANs.
- **Interpretability**: The step-by-step process is more interpretable than the latent space of VAEs.
- **Computational Cost**: They generally require more computational resources for sampling compared to GANs or VAEs.

### 4. What Are the Limitations of Diffusion Models?

- **Slow Sampling**: The iterative sampling process can be computationally expensive and time-consuming.
- **Training Time**: They often require longer training times compared to other generative models.
- **Parameter Sensitivity**: Performance can be sensitive to the choice of noise schedule and other hyperparameters.

### 5. How Do You Choose the Number of Timesteps?

- More timesteps generally lead to higher quality outputs but slower sampling.
- Typical values range from a few hundred to a few thousand steps.
- Recent research has focused on reducing the number of steps while maintaining quality.

### 6. Can Diffusion Models Be Used for Tasks Other Than Generation?

Yes, diffusion models have been adapted for various tasks, including:
- Image inpainting
- Super-resolution
- Image-to-image translation
- Anomaly detection
- Even some non-image tasks like molecule generation

### 7. What's the Intuition Behind the Variance Schedule?

- The variance schedule ($\beta_t$) controls how quickly noise is added in the forward process.
- It's typically chosen to be small at first and gradually increase.
- This allows the model to learn fine details early in the reverse process and broader structures later.

### 8. How Do Diffusion Models Handle Different Types of Data?

- While most commonly used for images, diffusion models can be adapted to various data types.
- For non-continuous data (like text), special techniques are needed to handle the discrete nature of the data.

### 9. What Recent Advancements Have Been Made in Diffusion Models?

- Faster sampling techniques (e.g., DDIM, DPM-Solver)
- Conditional generation methods
- Combining with other architectures (e.g., transformers)
- Continuous time formulations
- Applications to new domains and tasks

### 10. How Do You Evaluate the Quality of Diffusion Models?

- Common metrics include FID (Fréchet Inception Distance) for image quality and diversity
- Perceptual studies with human evaluators
- Task-specific metrics for applications like super-resolution or inpainting
- Sample diversity measures

### 11. **How is Diversity in Generated Samples Achieved?**
- The use of stochasticity (reinjecting noise) at every step of the reverse process ensures that even if you start with the same initial noise \( x_T \), the injected randomness at intermediate steps can lead to different outputs, promoting sample diversity.

## **Summary of Diffusion Models**

1. **Forward Process**: Gradually corrupt data by adding Gaussian noise step by step until it becomes nearly indistinguishable from random noise.
2. **Reverse Process**: Learn a model that reverses the noise-adding process step by step, gradually refining the noisy sample into clean data.
3. **Training**: Train the model to predict the noise added at each step, using a mean-squared error loss between the true noise and the model’s predicted noise.
4. **Sampling**: After training, generate new samples by starting with pure noise and applying the learned reverse process to progressively remove noise.
5. **Iterative Procedure**: The iterative denoising allows for fine control and gradual refinement of data, ensuring high-quality, stable sample generation.
6. **Noise Reinjection**: Injecting fresh noise at each step improves robustness, generalization, and diversity, and prevents overfitting to specific noise configurations.