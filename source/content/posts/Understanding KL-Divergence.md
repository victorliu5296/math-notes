---
title: 'Understanding KL-Divergence'
date: 2024-09-12T20:00:00-04:00
summary: "An interpretation and explanation of the KL-divergence (Kullback-Leibler divergence) via probability theory."
math: katex
categories: [Statistics, Information Theory]
tags: [Bayesian Statistics, KL-Divergence, Information Theory, Entropy, Cross-Entropy, Surprisal, Kullback-Leibler Divergence, Probability, Statistics, Machine Learning, Deep Learning, Feature Learning, Interpolation, Generalization, Bias-Variance Tradeoff, Regularization, Data Augmentation, Architectural Choices, Adversarial Training, Multi-task Learning, Contrastive Learning, Causal Learning, Out-of-distribution Testing, Adversarial Testing, Interpretability, Probing Tasks, Few-shot Learning]
weight: 100
---

This post is inspired by Artem Kirsanov's video "The Key Equation Behind Probability" on [YouTube](https://www.youtube.com/watch?v=KHVR587oW8I).

KL-divergence (Kullback-Leibler divergence) is a fundamental concept in information theory and statistics that measures how one probability distribution diverges from a second, reference probability distribution. It has broad applications, from machine learning to physics.

Let's build up from the basics, step by step.

### 1. **Surprisal (Information Content)**

#### Motivating Example
Imagine you’re observing the outcome of a random event. How surprising is the outcome? The **surprisal** (or self-information) tells us this.

- **High Surprisal**: If the event is rare (low probability), its occurrence is surprising. For example, rolling a 1 on a very biased die where 1 appears only 1% of the time has high surprisal.
  
- **Low Surprisal**: If the event is likely (high probability), its occurrence is not surprising. For example, in the biased die, rolling a 6 which appears 95% of the time has low surprisal.

#### Formal Definition
For an outcome \(x\) with probability \(P(x)\), the surprisal \(I(x)\) is defined as:
\[
I(x) = -\log P(x)
\]
- **Logarithm base**: Typically, the base of the logarithm is \(2\) (for bits, used for information theory) or \(e\) (for nats: natural units of information, used in physics and other continuous processes).

#### Key Properties of Surprisal:
- \(I(x)\) is **0 for certain events** (when \(P(x) = 1\)): If you know for sure the event will happen, it provides no new information (no surprise).
  \[
  I(x) = -\log(1) = 0
  \]
- \(I(x)\) is **infinite for impossible events** (when \(P(x) = 0\)): Impossible events carry infinite surprisal, as they could never occur in the given probability model.
  \[
  I(x) = -\log(0) = \infty
  \]
- **Higher surprisal** for lower probability events: As \(P(x)\) decreases, surprisal increases logarithmically.

#### Example (Fair Die):
For a fair six-sided die, the surprisal of any face \(x\) is:
\[
I(x) = -\log\left(\frac{1}{6}\right) = \log(6)
\]
Since all outcomes are equally likely, their surprisal is the same.

---

### 2. **Entropy (Shannon Entropy)**

#### Motivating Example
Imagine you are predicting the outcome of a process (e.g., flipping a coin or rolling a die). The more unpredictable the outcome, the more uncertainty (or information) there is about the result. **Entropy** quantifies this uncertainty or the average surprisal over all possible outcomes.

- **Fair Coin**: A fair coin has two equally likely outcomes, so each flip is maximally uncertain, meaning entropy is high.
  
- **Biased Coin**: A coin that almost always lands heads has lower uncertainty because the outcome is more predictable, meaning entropy is lower.

#### Formal Definition
For a probability distribution \(P(x)\) over outcomes, the entropy is the **expected value** of surprisal:
\[
H(P) = \mathbb{E}_{x \sim P}[-\log P(x)]
\]
This tells us the **average number of bits** needed to encode the outcomes of the distribution.

#### Key Properties of Entropy:
- **Maximal entropy** occurs for a uniform distribution, where all outcomes are equally likely (maximum unpredictability).
- **Minimal entropy** is zero and occurs when the distribution is deterministic (one outcome has probability 1).
  
#### Example:
- **Fair coin**: \(P(H) = P(T) = 0.5\), so:
  \[
  H(P) = -\left(0.5 \log 0.5 + 0.5 \log 0.5\right) = 1 \text{ bit}
  \]
- **Biased coin**: \(P(H) = 0.9\), \(P(T) = 0.1\):
  \[
  H(P) = -\left(0.9 \log 0.9 + 0.1 \log 0.1\right) = 0.469 \text{ bits}
  \]

Entropy measures the **average uncertainty** of an event. The more predictable the event, the lower the entropy.

---

### 3. **Cross-Entropy**

#### Motivating Example
Let’s say you have a model that approximates a true distribution of outcomes. If your model is accurate, it closely matches the true distribution. However, if your model is incorrect, it will be less efficient at encoding data from the true distribution. **Cross-entropy** measures the inefficiency of encoding data from a true distribution \(P(x)\) using a model distribution \(Q(x)\).

- **Good model**: If \(Q(x)\) is close to \(P(x)\), cross-entropy will be close to the entropy of \(P(x)\).
  
- **Bad model**: If \(Q(x)\) is very different from \(P(x)\), cross-entropy will be larger, indicating more inefficiency.

#### Formal Definition
The cross-entropy between the true distribution \(P(x)\) and the model distribution \(Q(x)\) is:
\[
H(P, Q) = \mathbb{E}_{x \sim P}[-\log Q(x)]
\]
This measures the expected number of bits required to encode data from \(P(x)\) using the model \(Q(x)\).

#### Key Properties of Cross-Entropy:
- \(H(P, Q)\) is always greater than or equal to \(H(P)\), with equality if \(P(x) = Q(x)\) (when the model perfectly matches the true distribution).
- Cross-entropy increases as the model \(Q(x)\) deviates from the true distribution \(P(x)\).
- Cross-entropy is not a true distance metric, as it is not symmetric.
- Note that the cross entropy of a distribution with itself \(H(P, P)\) is just the entropy \(H(P)\).

#### Example:
If you are using a machine learning model to predict the likelihood of different classes, and your model is slightly off, cross-entropy quantifies how much inefficiency is introduced by the incorrect predictions.

---

### 4. **KL-Divergence (Kullback-Leibler Divergence)**

#### Motivating Example
Suppose you are trying to approximate a true probability distribution \(P(x)\) with a model \(Q(x)\). **KL-divergence** tells you how much extra cost (in bits or information) you will incur if you use the model \(Q(x)\) instead of the true distribution \(P(x)\).

- **Exact model**: If \(P(x)\) and \(Q(x)\) are the same, there’s no extra cost, and the KL-divergence is zero.
  
- **Imperfect model**: The more \(Q(x)\) diverges from \(P(x)\), the higher the KL-divergence, indicating greater inefficiency or error in the model.

#### Formal Definition
KL-divergence is a divergence measure defined as:
\[
\begin{aligned}
D_{KL}(P || Q) 
&:= \mathbb{E}_{x \sim P} \left[\log \frac{P(x)}{Q(x)} \right] \\
&=  \mathbb{E}_{x \sim P} \left[-\log \frac{Q(x)}{P(x)} \right] \\
&= \begin{cases}
  \sum_x P(x) \log \frac{P(x)}{Q(x)}
  & \text{for discrete distributions} \\
  \int_{-\infty}^{\infty} P(x) \log \frac{P(x)}{Q(x)} \text{d}x
  & \text{for continuous distributions}
\end{cases}
\end{aligned}
\]
It represents the **expected logarithmic difference** between the true distribution \(P(x)\) and the model distribution \(Q(x)\), with the expectation taken over \(P(x)\).

#### Key Properties of KL-Divergence:
- **Non-negativity**: \(D_{KL}(P || Q) \geq 0\). KL-divergence is always non-negative, with equality if and only if \(P(x) = Q(x)\) for all \(x\). This means there's no extra cost if the model perfectly matches the true distribution.
- **Asymmetry**: KL-divergence is not symmetric: \(D_{KL}(P || Q) \neq D_{KL}(Q || P)\). This is why it’s not a true distance metric.
- **Interpretation as Extra Cost**: KL-divergence quantifies the extra bits or nats needed to encode data from \(P(x)\) using \(Q(x)\) instead of \(P(x)\) itself.

#### Example:
In machine learning, you might be fitting a model to data. The KL-divergence between the data distribution \(P(x)\) and the model’s predictions \(Q(x)\) gives you a measure of how far your model is from the true distribution.

#### Relation to Cross-Entropy and Entropy:
Using properties of logarithms and expectation, KL-divergence can be seen as the difference between **cross-entropy** and **entropy**:
\[
\begin{aligned}
D_{KL}(P || Q)
&= \mathbb{E}_{x \sim P} \left[\log \frac{P(x)}{Q(x)} \right] \\
&= \mathbb{E}_{x \sim P} \left[-\log \frac{Q(x)}{P(x)} \right] \\
&= \mathbb{E}_{x \sim P} \left[-\log Q(x) + \log P(x) \right] \\
&= \mathbb{E}_{x \sim P} \left[-\log Q(x) \right] + \mathbb{E}_{x \sim P} \left[\log P(x) \right] \\
&= \mathbb{E}_{x \sim P} \left[-\log Q(x) \right] - \mathbb{E}_{x \sim P} \left[-\log P(x) \right] \\
&= H(P, Q) - H(P)
\end{aligned}
\]
This makes sense intuitively because the cross-entropy represents the inefficiency of encoding data from \(P(x)\) using \(Q(x)\), while entropy represents the inherent uncertainty in \(P(x)\).

We see that for \(P(x) = Q(x)\), we have \(D_{KL}(P || Q) = H(P, P) - H(P) = 0\).

---

### 5. **Historical Context of KL-Divergence**
The concept of KL-divergence was introduced by **Solomon Kullback** and **Richard Leibler** in 1951 in the context of **information theory** and **statistics**. In their original work, KL-divergence was referred to as **"divergence of information"** and was developed independently from the concepts of entropy and cross-entropy. The formulation was primarily focused on comparing two probability distributions.

- **Double bar notation**: The **

double bar** \(D_{KL}(P || Q)\) used in KL-divergence is meant to emphasize the asymmetry between the two distributions. It explicitly indicates that \(D_{KL}(P || Q)\) and \(D_{KL}(Q || P)\) are not equal.

- **Original formulation**: The original KL-divergence was introduced without reference to **cross-entropy** or **entropy**. The connection to these concepts came later as part of the growing body of work in information theory and machine learning. Today, we understand KL-divergence as being closely tied to cross-entropy, but historically, this was not the case.

KL-divergence emerged from the study of hypothesis testing and statistical inference, where the task was to measure how one probabilistic model diverges from another.

---

### 6. **Summary**
We’ve now built up a complete understanding of KL-divergence and its related concepts, starting from basic motivations and then tying in formal definitions and key properties. Here’s a summary of what we’ve covered:

- **Surprisal** measures how surprising an event is.
- **Entropy** quantifies the average uncertainty or information in a distribution.
- **Cross-Entropy** measures the inefficiency of encoding data from one distribution using another.
- **KL-Divergence** measures the extra cost incurred by using the wrong distribution to encode the true distribution.

---

### 7. **Optimization of KL-Divergence in Machine Learning**

In practice, actual KL-divergence is not optimized directly. This is because the entropy of the underlying distribution \(H(P)\) is often unknown, and the KL-divergence is only used to compare two distributions.

Luckily for us, this is not a problem. Let's recall our relationship between KL-divergence and cross-entropy:

\[
D_{KL}(P || Q) = H(P, Q) - H(P)
\]

The important thing to note is that the entropy \(H(P)\) is a constant, independent of our model distribution \(Q(x)\). This means that we can instead optimize the cross-entropy, as a constant shift does not affect the optimization problem.