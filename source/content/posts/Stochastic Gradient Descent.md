---
title: 'Stochastic Gradient Descent'
date: 2024-09-22T16:44:35-04:00
math: katex
description: ""
categories:
  - 
tags:
  - 
weight: 100
draft: false
---

In brief, Stochastic Gradient Descent (SGD) is a cheaper approximation of standard gradient descent where we sampling a subset from the full dataset and calculate the gradient of the subset loss that way.

Because data shares a lot of redundancy, a decently sized subset approximates the full dataset. Then, by sampling a random subset each time, we ensure the diversity is also captured.

### **Write-up on Stochastic Gradient Descent (SGD)**

---

### 1. **Introduction to Gradient Descent**

In machine learning and optimization problems, the goal is often to minimize (or maximize) a cost or loss function. The process of finding the optimal parameters (weights) that minimize this loss function is at the core of many algorithms. **Gradient Descent** is a widely used optimization algorithm for this purpose.

#### **What is Gradient Descent?**

Gradient Descent is an iterative optimization algorithm used to minimize a given function, commonly called the cost or loss function. It updates parameters by moving them in the opposite direction of the gradient of the function with respect to those parameters. Mathematically, the parameter update rule at each iteration \( t \) is:

\[
\theta_{t+1} = \theta_t - \eta \nabla_{\theta} J(\theta)
\]

Where:
- \( \theta_t \) are the parameters at step \( t \),
- \( \eta \) is the learning rate (step size),
- \( \nabla_{\theta} J(\theta) \) is the gradient of the loss function \( J(\theta) \) with respect to the parameters.

Gradient descent works by computing the gradient over the entire dataset and adjusting the parameters to move towards a local or global minimum.

#### **Types of Gradient Descent**:
- **Batch Gradient Descent**: The gradient is computed using the entire dataset.
- **Stochastic Gradient Descent (SGD)**: The gradient is computed using only one data point at a time.
- **Mini-batch Gradient Descent**: The gradient is computed using small random batches of data.

---

### 2. **What is Stochastic Gradient Descent?**

**Stochastic Gradient Descent (SGD)** is a variant of gradient descent that updates the model parameters using a single training example (or a small batch of examples) at each iteration, instead of using the entire dataset. This makes it more efficient and suitable for large-scale machine learning tasks where the dataset is too large to fit into memory.

In the context of SGD, "stochastic" refers to the random selection of a single training sample or a subset of the training data to compute the gradient. By doing this, the method introduces noise into the updates, which can help escape local minima but can also make convergence less stable.

#### **Mathematical Representation of SGD**

At each iteration, instead of using the gradient of the entire cost function (which sums over all training examples), we update the parameters based on a single training example:

\[
\theta_{t+1} = \theta_t - \eta \nabla_{\theta} J(\theta; x_i, y_i)
\]

Where \( (x_i, y_i) \) is a single training example chosen at random from the dataset.

---

### 3. **How Stochastic Gradient Descent Works**

1. **Initialize the Parameters**: Start by initializing the model parameters (weights) randomly or with zeros.
2. **Select a Training Example**: At each step, select a single training example \( (x_i, y_i) \) at random from the dataset.
3. **Compute the Gradient**: Calculate the gradient of the loss function with respect to the parameters using just the chosen example \( (x_i, y_i) \).
4. **Update the Parameters**: Use the calculated gradient to update the parameters in the direction of the negative gradient.
5. **Repeat**: Repeat this process for a set number of iterations or until convergence.

This iterative process ensures that the model gradually converges towards the optimal solution, though with some noise introduced by the randomness of selecting individual data points.

---

### 4. **Advantages of Stochastic Gradient Descent**

- **Efficiency with Large Datasets**: Since SGD uses only one sample at a time, it is computationally efficient and can be used for online learning where data arrives sequentially.
- **Ability to Escape Local Minima**: The randomness introduced by selecting a single training point allows SGD to "bounce around," potentially escaping shallow local minima, especially in non-convex loss landscapes (such as those found in deep learning).
- **Faster Iterations**: Each iteration is much faster because it does not require computing gradients over the entire dataset, allowing the model to quickly make updates.

---

### 5. **Disadvantages of Stochastic Gradient Descent**

- **High Variance in Updates**: Because SGD uses only one data point, the updates can be noisy and inconsistent. This means the loss function may fluctuate and not decrease smoothly, making convergence harder to diagnose.
- **Requires Careful Tuning of Learning Rate**: If the learning rate is too high, the parameter updates may overshoot the minimum. If it’s too low, convergence will be very slow. Finding the right learning rate is critical for SGD to work well.
- **Slower Convergence**: Although each iteration is fast, SGD may require more iterations to converge because the updates are noisy and can move in less optimal directions.

---

### 6. **Variations and Improvements on SGD**

SGD can be augmented with various techniques to improve its performance. Some of the popular variations include:

#### **SGD with Momentum**

Momentum helps accelerate convergence by adding a fraction of the previous update to the current update. This helps smooth out the fluctuations in SGD and can help traverse ravines more effectively.

Update rule:

\[
v_t = \beta v_{t-1} + \eta \nabla_{\theta} J(\theta; x_i, y_i)
\]
\[
\theta_{t+1} = \theta_t - v_t
\]

Where \( v_t \) is the velocity term that accumulates the gradients, and \( \beta \) is the momentum coefficient.

#### **Adam (Adaptive Moment Estimation)**

Adam is an extension of SGD that combines ideas from both momentum and adaptive learning rates. It adapts the learning rate for each parameter based on estimates of the first and second moments of the gradients, providing faster and more stable convergence.

Adam’s update rule incorporates two components:
- **Moving average of gradients** (like momentum),
- **Moving average of the squared gradients** to adapt the learning rate.

#### **Learning Rate Schedules and Decay**

SGD can benefit from a learning rate that decreases over time. A large initial learning rate allows for fast progress, while a smaller learning rate later in training helps fine-tune the parameters. Common learning rate schedules include:
- **Step decay**: Reduce the learning rate by a factor after a set number of iterations.
- **Exponential decay**: Multiply the learning rate by a constant factor at each iteration.
- **Cosine annealing**: Reduce the learning rate based on a cosine function to slowly reduce the rate in a more smooth manner.

---

### 7. **Applications of Stochastic Gradient Descent**

SGD and its variants are widely used in many machine learning algorithms, particularly those involving large-scale data. It’s commonly applied in:
- **Training deep learning models**: SGD is the backbone of training neural networks, especially for large datasets like those used in image recognition, language modeling, and recommendation systems.
- **Logistic regression** and **support vector machines (SVMs)** also frequently utilize SGD in large-scale contexts.

---

### 8. **Conclusion**

**Stochastic Gradient Descent (SGD)** is a fundamental optimization technique that is widely used due to its efficiency with large datasets and its ability to handle non-convex optimization problems, such as those found in deep learning. While it introduces noise into the optimization process, this characteristic can be beneficial in escaping local minima. However, tuning parameters such as the learning rate and employing techniques like momentum or Adam are necessary to ensure successful training and convergence.

In summary, SGD is a powerful tool in machine learning, balancing computational efficiency with performance, and it forms the foundation for many modern optimization techniques.