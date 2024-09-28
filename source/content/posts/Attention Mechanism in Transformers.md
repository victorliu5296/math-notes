---
title: 'Attention Mechanism in Transformers (Scaled Dot-Product Attention)'
date: 2024-09-23T16:57:09-04:00
math: katex
summary: "An interpretation and explanation of the scaled dot-product attention mechanism via probability theory."
categories:
  - Machine Learning
tags:
  - Attention
  - Transformers
  - Multi-Head Attention
  - Self-Attention
  - Dot-Product Attention
  - Multiplicative Attention
  - Scaled Dot-Product Attention
  - Statistics
  - Probability Theory
weight: 50
draft: false
---

I feel like a lot of people don't really explain the attention mechanism in transformers properly. They tend to get caught in the implementation details and just running through the math, not really taking time to interpret it.

For instance, there is often a heavy focus on the dimensions of the tensors involved, but little detail on the interaction between single vectors within the tensors. The matrix form is only for computational implementation purposes and is not important to understanding the mechanism.

So, this is my own interpretation of the dot-product (multiplicative) attention mechanism in transformers. In short, here it is:

The dot-product attention mechanism is akin to a look-up table for a database in computer science. Except, rather than statically retrieving values from a table, it not only considers the similarity between the query and key, but also dynamically adjusts the database values based on the input sequence. Then, it doesn't pick a the single most similar value, but rather a weighted average of the similar values.

In the dot-product attention mechanism specifically, the similarity measure is calculated using the dot product of the query and key vectors.

Now, let's start a proper explanation from the beginning.


---

### **Attention Mechanism in Transformers**

Let's say we have an input as a sequence of vector embeddings \(\vec x_i\) for \(i = 1, 2, ..., n\). The sequence length is \(n\). Note that I consider \(\vec x_i\) as a **column vector** as is conventional in linear algebra, even though machine learning implementations often use row vectors.

We want to compute the next output token as a vector \(\vec x_{n+1}\) given the input sequence \(\vec x_1, \vec x_2, ..., \vec x_n\).

The main idea of the attention mechanism is that we want to have some kind of way to determine the **interactions** between each token in the input sequence.

To do this, we use the dot product as a measure of **similarity** between two vectors. We want some kind of lookup table, or function, that then maps these similarity scores to some corresponding output vector, the "value" vector. This is similar to the key and value pairs in a **dictionary** or **hash table lookup**.

The first idea that comes to mind is to simply compute the dot product between each pair of vectors in the input sequence. That is,

\[
\begin{array}{c|cccc}
   & \vec{x}_1 & \vec{x}_2 & \cdots & \vec{x}_n \\
  \hline
  \vec{x}_1 & \vec{x}_1 \cdot \vec{x}_1 & \vec{x}_1 \cdot \vec{x}_2 & \cdots & \vec{x}_1 \cdot \vec{x}_n \\
  \vec{x}_2 & \vec{x}_2 \cdot \vec{x}_1 & \vec{x}_2 \cdot \vec{x}_2 & \cdots & \vec{x}_2 \cdot \vec{x}_n \\
  \vdots    & \vdots                    & \vdots                    & \ddots & \vdots                    \\
  \vec{x}_n & \vec{x}_n \cdot \vec{x}_1 & \vec{x}_n \cdot \vec{x}_2 & \cdots & \vec{x}_n \cdot \vec{x}_n \\
\end{array}
\]

Since the dot product is a commutative operation, about half of the elements in this table are the same.

\[
\begin{array}{c|cccc}
   & \vec{x}_1 & \vec{x}_2 & \cdots & \vec{x}_n \\
  \hline
  \vec{x}_1 & \vec{x}_1 \cdot \vec{x}_1 & \textcolor{red}{\vec{x}_1 \cdot \vec{x}_2} & \cdots & \textcolor{blue}{\vec{x}_1 \cdot \vec{x}_n} \\
  \vec{x}_2 & \textcolor{red}{\vec{x}_2 \cdot \vec{x}_1} & \vec{x}_2 \cdot \vec{x}_2 & \cdots & \textcolor{green}{\vec{x}_2 \cdot \vec{x}_n} \\
  \vdots    & \vdots                    & \vdots                    & \ddots & \vdots                     \\
  \vec{x}_n & \textcolor{blue}{\vec{x}_n \cdot \vec{x}_1} & \textcolor{green}{\vec{x}_n \cdot \vec{x}_2} & \cdots & \vec{x}_n \cdot \vec{x}_n \\
\end{array}
\]

If you know the formula for triangular numbers, this means we need to compute exactly \(\frac{n(n+1)}{2}\) dot products.

Here's the thing, though: each dot product between these vectors takes \(d^2\) scalar multiplications. In modern models, the embedding dimension \(d\) from \(\vec x_i \in \mathbb{R}^d\) is quite large. For example, in the GPT-2 model, the embedding dimension is 1024. In Llama 3, it is 4096 for the 8 billion parameter version and 8192 for the 70 billion parameter version.

This means that for each dot product, we would need \(8192^2 = 67108864\) scalar multiplications. In total, we need to do about \(\frac{n(n+1)}{2} \cdot d^2\) scalar multiplications. For just an input of length 1024, this is **68719476736** scalar multiplications, over **68 billion operations**. Yikes.

So, the idea in dot-product attention mechanism is, as is common in machine learning, **reduce the number of dimensions** to make computation **cheaper**. We do this via linear transformations that are **down projections**; in the transformer, these down projections are characterized by weight matrices \(W_K\), \(W_Q\). In order to dynamically adjust them based on the input sequence, we simply multiply each matrix with the corresponding input vector \(\vec x_i\) to generate the particular key, query and value vectors for that token.

\[
\vec k_i := W_K \vec x_i
\]

\[
\vec q_i := W_Q \vec x_i
\]

The hope is that queries capture "what we’re looking for", while keys represent "what each input element contains". In practice, this doesn't necessarily hold significance, but it's where the names come, I'm guessing as inspiration from lookup tables.

As a theoretical justification, we use two different linear mappings rather than a single down projection in hopes of preserving the information in the original, higher-dimensional input sequence by extracting different features from it with different weights.

Behind the scenes, we also similarly compute value vectors as a linear projection of the input sequence.

\[
\vec v_i := W_V \vec x_i
\]

Now, the goal is to compare the query vector \(\vec q_i\) with the key vectors \(\vec k_i\) and assign a similarity score to each key vector. The similarity score is then used to compute the output vector a **linear combination** of all value vectors \(\vec v_i\).

To be able to take the dot product between the query and key vectors, they need to have the **same dimension**. Thus, we often refer to the reduced dimension using \(d_k\), as in the original paper "Attention Is All You Need" by Vaswani et al.

\[
\vec k_i, \vec q_i \in \mathbb{R}^{d_k}
\]

Then, we can compute the similarity score between the query and key vectors as

\[
s_i := \vec q_i \cdot \vec k_i = {\vec q_i}^T \vec k_i \in \mathbb{R}
\]

This is the core idea of the dot-product attention mechanism. At this stage, we have the ingredients to compute the output vector. For instance, we could set

\[
\vec x_{n+1} := \sum_{i=1}^{n} s_i \vec v_i
\]

This would mean that our value vectors are in a sense "weighted" by the similarity score \(s_i\) between the query and key vectors. In this formulation, the value vectors would have the same dimension as the embedding dimension \(d\), so that \(\vec v_i \in \mathbb{R}^{d}\).

However, there are some issues with this. In this formulation, the similarity score \(s_i\) is quite **large**, combining the magnitude of the query and key vectors since the dot product can be expressed as a product of the magnitude of the vectors and the cosine of the angle between them. This means that, in the extreme case, it will **multiply the magnitudes** of the vectors.

\[
s_i := \vec q_i \cdot \vec k_i = \|\vec q_i\| \|\vec k_i\| \cos \theta
\]

But, in turn, the value would have to compensate by being significantly **smaller** in magnitude than the query and key vectors. In practice, very small values do not behave well, such as in the backpropagation of gradients, where numerical instability or vanishing gradients can occur.

To address this, we typically use the **softmax** (soft argmax) function to **normalize** the similarity scores. Hence, each similarity score \(s_i\) is replaced by a normalized similarity score that I'll call \(\hat s_i\) that is between 0 and 1.

\[
\hat s_i := \text{Softmax}(s_i|s_1, \dots, s_n) = \frac{\exp(\vec q_i \cdot \vec k_i)}{\sum_{j=1}^{n} \exp(\vec q_j \cdot \vec k_j)}
\]

The softmax function is a very interesting function that arises naturally from the Boltzmann distribution, the probability distribution underlying the temperature in a blackbody radiator. It's so interesting that it deserves its own article, but for now, Artem Kirsanov made an excellent [video](https://www.youtube.com/watch?v=_bqa_I5hNAo) covering it.

But because the softmax function creates a valid probability distribution, then our new formula

\[
\vec x_{n+1} := \sum_{i=1}^{n} \hat s_i \vec v_i
\]

can be interpreted as a weighted average of all possible value vectors to form \(\vec v_i\). 

In this view, each value vector \(\vec v_i\) is an outcome in our probability distribution with probability \(\hat s_i\). Let's call this probability distribution \(P\). Then, in statistical terms, the output vector it is the expectation of a sample \(v \sim P\).

\[
\vec x_{n+1} := \sum_{i=1}^{n} \hat s_i \vec v_i = \mathbb{E}_{\vec v \sim P}[\vec v]
\]

That's it, we're done, right? Well, not quite. This is indeed an early formulation of dot-product attention in 2015 by [Luong et al.](https://arxiv.org/abs/1508.04025) 

Unfortunately, as mentioned earlier, when numbers are not normalized in machine learning, they tend to misbehave. We need to normalize EVERYTHING. But didn't we just do that? What is there left to normalize?

This brings us to the modern formulation of **scaled dot-product attention** in 2017 by [Vaswani et al.](https://arxiv.org/abs/1706.03762), for real this time.

To see what this is all about, we need to consider even more statistics. Let's bring back our key and query vectors from earlier, and I'll drop the indices for now, just \(\vec k, \vec q \in \mathbb{R}^{d_k}\). 

Let's view them as (multivariate) random variables with components \(k_j\) and \(q_k\) for \(j = 1, \dots, d_k\) and \(k = 1, \dots, d_k\). 

\[
\vec k := [ k_1, \dots, k_{d_k} ]
\]

\[
\vec q := [ q_1, \dots, q_{d_k} ]
\]

Since they are created independently from two independent weight matrices \(W_K\), \(W_Q\), we'll assume for simplicity that each component \(k_j\) and \(q_k\) is independent and identically distributed. We'll call their variance \(\sigma^2\).

Now, we analyze the dot product between the two.

\[
\vec k \cdot \vec q = \sum_{c=1}^{d_k} k_c q_c
\]

Specifically, we're interested in the **variance** of this dot product, which is what caracterizes dispersion from the mean, resulting in too much spread in the distribution, which means large gaps between points, hence more room for poor stability.

Because we assumed the components are independent, all the covariance terms between the different components are zero, simplfying to the sum of the variances.

\[
\text{Var}(\vec k \cdot \vec q) = \sum_{c=1}^{d_k} \sigma^2 = \sigma^2 \sum_{c=1}^{d_k} 1 = \sigma^2 d_k
\]

So, we notice that for two independent and identically distribution random vectors, the **variance of their dot product scales with the number of dimensions**. 

To mitigate this effect, we can scale the dot product by the square root of the number of dimensions. Remember, scaling by a constant factor scales the standard deviation by that factor, but the variance is scaled by the square of that factor.

With all this in mind, we can now write the formula for scaled dot-product attention.

Our scaled dot products \(s_i \in \mathbb{R}\) are now

\[
s_i := \frac{\vec q_i \cdot \vec k_i}{\sqrt{d_k}}
\]

Our attention "probabilities" or similarity scores \(\alpha_i \in \mathbb{R}\) are

\[
\alpha_i := \text{Softmax}\left(s_i|s_1, \dots, s_n\right)
\]

Then, taking our \(\alpha_i\) as the probabilities for the values \(\vec v_i\) in a probability distribution \(P\), we interpret the scaled dot-product attention as

\[
\text{Scaled Dot-Product Attention} := \mathbb{E}_{\vec v \sim P}[\vec v] = \sum_{i=1}^{n} \alpha_i \vec v_i
\]

Note that in modern transformers, to make use of parallelism and computational abundance, this whole calculation is repeated several times in parallel with different query, key and value weight matrices \(W_Q\), \(W_K\), \(W_V\). Each of these calculations is called a **head** or **attention head** in the transformer.

At the end, we apply a linear transformation that maps each output of the attention head to a single, final output vector \(\vec x_{n+1}\), denoted often by \(W_O\) since it's the output weight matrix. This means that, in practice, we work with \(v_i\) also in a lower dimension, often \(d_v = d_k\).