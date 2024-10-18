---
title: 'Attention Mechanism in Transformers Derived with Statistical Mechanics Interpretation'
date: 2024-09-23T16:57:09-04:00
math: katex
summary: "An full explanation and interpretation of scaled dot-product attention via the Boltzmann distribution and probability theory."
categories:
  - Machine Learning
tags:
  - Attention
  - Transformers
  - Self-Attention
  - Multi-Head Attention
  - Dot-Product Attention
  - Multiplicative Attention
  - Scaled Dot-Product Attention
  - Statistical Mechanics
  - Softmax
  - Boltzmann Distribution
  - Statistics
  - Probability Theory
weight: 99
draft: false
---

## Attention Mechanism in Transformers (Scaled Dot-Product Attention)

In recent years, **transformer models** have revolutionized the field of machine learning, particularly in natural language processing tasks. A core component of these models is the **attention mechanism**, which enables the model to focus on different parts of the input sequence while processing it. 

Despite its success, the attention mechanism is often explained in a way that emphasizes the technical implementation details—tensor dimensions, matrix multiplications—while glossing over the intuition behind it. In this article, I aim to provide a deeper understanding of how **scaled dot-product attention** works by relating it to familiar concepts from probability theory and statistical mechanics.

We'll explore the following:

- How dot products serve as a **similarity measure** between query and key vectors.
- Why the **softmax** function is applied to normalize these similarity scores.
- How the softmax operation can be viewed as representing a **Boltzmann distribution** from physics, providing a probabilistic interpretation of attention.
- The significance of **scaling** the dot product to stabilize the learning process.

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

You're absolutely right! Let me add an introduction to set the context before diving into the detailed explanation of the attention mechanism. Here's the revised version of the article with an introduction included:

---

## Attention Mechanism in Transformers (Scaled Dot-Product Attention)

In recent years, **transformer models** have revolutionized the field of machine learning, particularly in natural language processing tasks. A core component of these models is the **attention mechanism**, which enables the model to focus on different parts of the input sequence while processing it. 

Despite its success, the attention mechanism is often explained in a way that emphasizes the technical implementation details—tensor dimensions, matrix multiplications—while glossing over the intuition behind it. In this article, I aim to provide a deeper understanding of how **scaled dot-product attention** works by relating it to familiar concepts from probability theory and statistical mechanics.

We'll explore the following:

- How dot products serve as a **similarity measure** between query and key vectors.
- Why the **softmax** function is applied to normalize these similarity scores.
- How the softmax operation can be viewed as representing a **Boltzmann distribution** from physics, providing a probabilistic interpretation of attention.
- The significance of **scaling** the dot product to stabilize the learning process.

This detailed breakdown will help to demystify the inner workings of the attention mechanism, allowing you to appreciate how it efficiently computes the dependencies between tokens in a sequence, a critical part of how transformers operate.

---

### **Attention Mechanism in Transformers**

Let's say we have an input as a sequence of vector embeddings \(\vec x_i\) for \(i = 1, 2, ..., n\). The sequence length is \(n\). Note that I consider \(\vec x_i\) as a **column vector**, as is conventional in linear algebra, even though machine learning implementations often use row vectors.

We want to compute the next output token as a vector \(\vec x_{n+1}\) given the input sequence \(\vec x_1, \vec x_2, ..., \vec x_n\).

The main idea of the attention mechanism is to determine the **interactions** between each token in the input sequence. To do this, we use the dot product as a measure of **similarity** between two vectors. We then map these similarity scores to some corresponding output vector, the "value" vector, in a manner similar to key-value pairs in a **dictionary** or **hash table lookup**.

### Dot-Product Attention

The attention mechanism starts by computing the dot product between the **query** and **key** vectors derived from the input sequence. To keep the dimensionality manageable, we first project the original input vectors \(\vec x_i\) into a lower-dimensional space using learnable weight matrices \(W_Q\), \(W_K\), and \(W_V\):

\[
\vec k_i := W_K \vec x_i, \quad \vec q_i := W_Q \vec x_i, \quad \vec v_i := W_V \vec x_i
\]

The **key vectors** \(\vec k_i\) represent the "content" of each input element, and the **query vectors** \(\vec q_i\) capture what the model is "searching for" in the input sequence.

In practice, this doesn't necessarily hold significance, but it's where the names come, I'm guessing as inspiration from lookup tables.

The dot product between the query and key vectors gives a similarity score \(s_i\):

\[
s_i := \vec q_i \cdot \vec k_i = {\vec q_i}^T \vec k_i
\]

This similarity score \(s_i\) tells us how much attention the query should pay to the corresponding input element. To make sure these similarity scores are meaningful and avoid issues with large values, we typically normalize them.

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

### The Role of Softmax

To address this, we typically use the **softmax** (soft argmax) function to **normalize** the similarity scores. Hence, each similarity score \(s_i\) is replaced by a normalized similarity score that I'll call \(\hat s_i\) that is between 0 and 1.

\[
\hat s_i := \text{Softmax}(s_i|s_1, \dots, s_n) = \frac{\exp(\vec q_i \cdot \vec k_i)}{\sum_{j=1}^{n} \exp(\vec q_j \cdot \vec k_j)}
\]

The softmax function normalizes the scores into probabilities that sum to 1, ensuring that the attention mechanism gives a "weighted average" of the values \(\vec v_i\) based on their similarity to the query. This is critical because it prevents any single element from dominating the output and instead lets the model aggregate information from all elements.

The softmax function is a very interesting function that arises naturally from the Boltzmann distribution, the probability distribution underlying the temperature in a blackbody radiator. It's so interesting that it deserves its own article, but for now, Artem Kirsanov made an excellent [video](https://www.youtube.com/watch?v=_bqa_I5hNAo) covering it.

#### Softmax and the Boltzmann Distribution

The softmax function can be viewed through the lens of statistical mechanics, specifically as an instance of the **Boltzmann distribution**, which describes the probability distribution of states in a physical system based on their energy. In this analogy, the similarity score \(s_i\) can be interpreted as a negative "energy" (i.e., \(s_i = -E_i\)).

In statistical mechanics, the Boltzmann distribution defines the probability \(P(E_i)\) of a system being in a state with energy \(E_i\) as:

\[
P(E_i) = \frac{\exp\left(-\frac{E_i}{T}\right)}{\sum_{j=1}^{n} \exp\left(-\frac{E_j}{T}\right)}
\]

where \(T\) is the temperature of the system. In this context, the softmax function computes the probability of each value \(\vec v_i\) being chosen based on its similarity score, analogous to how the Boltzmann distribution gives the probability of a system occupying a state with energy \(E_i\). If we assume \(T = 1\), the softmax behaves like a probability distribution over the similarity scores, with higher similarity (lower energy) corresponding to higher probability.

In machine learning, **temperature scaling** can be applied to the softmax function as well. This gives us control over the sharpness of the resulting probability distribution:

\[
\text{Softmax}\left(\frac{s_i}{\tau}\right) = \frac{\exp\left(\frac{s_i}{\tau}\right)}{\sum_{j=1}^{n} \exp\left(\frac{s_j}{\tau}\right)}
\]

- If \(\tau\) is small, the distribution becomes **sharper**, meaning the attention focuses more on the highest similarity scores.
- If \(\tau\) is large, the distribution becomes **flatter**, distributing attention more evenly across the input.


### Scaled Dot-Product Attention

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

Here's the final modification we need to make for better behavior. We scale the dot product by \(\sqrt{d_k}\):

\[
s_i := \frac{\vec q_i \cdot \vec k_i}{\sqrt{d_k}}
\]

By scaling the dot product this way, we ensure that the magnitude of the similarity scores remains manageable, preventing extreme values that can lead to numerical instability or poor training behavior. After scaling, we apply the softmax function to obtain the normalized similarity scores \(\alpha_i\):

\[
\alpha_i := \text{Softmax}\left(\frac{\vec q_i \cdot \vec k_i}{\sqrt{d_k}}\right)
\]

---

### Final Attention Computation: A Statistical Mechanics Interpretation

Now that we have the normalized similarity scores \(\alpha_i\), let's take a step back and provide a **physical interpretation** of this process from the perspective of **statistical mechanics**. The softmax function, which turns raw dot-product similarity scores into probabilities, can be interpreted as an approximation of the **Boltzmann distribution**, a fundamental concept that governs the behavior of systems in thermal equilibrium.

In statistical mechanics, the **Boltzmann distribution** describes the probability that a system in thermal equilibrium occupies a particular state \(i\) with energy \(E_i\). The probability of being in that state is given by:

\[
P(E_i) = \frac{\exp\left(-\frac{E_i}{T}\right)}{\sum_{j=1}^{n} \exp\left(-\frac{E_j}{T}\right)}
\]

where \(T\) is the temperature of the system, and \(E_i\) is the energy associated with state \(i\). States with **lower energy** are exponentially more likely to be occupied, but as the temperature increases, the system explores a wider range of states more evenly.

#### Softmax as a Boltzmann Distribution

In the context of the attention mechanism, the **dot product** between the query \(\vec q_i\) and key \(\vec k_i\) can be viewed as an **inverse energy measure**. That is, a high dot product (strong similarity between query and key) corresponds to a **low energy state** in the Boltzmann analogy, meaning it's more likely that attention will be focused on that particular value.

By applying the **softmax function**, we compute the probabilities \(\alpha_i\) of attending to each key-value pair. This can be seen as analogous to the Boltzmann distribution in which each query-key similarity score \(s_i\) corresponds to the "negative energy" \(-E_i\):

\[
\alpha_i = \frac{\exp(s_i)}{\sum_{j=1}^{n} \exp(s_j)} = \frac{\exp\left(\frac{\vec q_i \cdot \vec k_i}{\sqrt{d_k}}\right)}{\sum_{j=1}^{n} \exp\left(\frac{\vec q_j \cdot \vec k_j}{\sqrt{d_k}}\right)}
\]

This normalized similarity score \(\alpha_i\) plays the role of a **probability distribution** over the different key-value pairs. Much like a system in thermal equilibrium, the attention mechanism is selecting which keys (and corresponding values) to focus on, based on a weighted measure of similarity, or equivalently, inverse energy.

#### Expectation and Weighted Average

Once we have the probability distribution \(\alpha_i\) over the key-value pairs, the attention mechanism performs a **weighted average** over the value vectors \(\vec v_i\). This can be directly interpreted as the **expected value** of the system in statistical mechanics. In that framework, the expected value of an observable is the average of that observable over all possible states, weighted by the probability of each state.

In the case of attention, the value vectors \(\vec v_i\) represent the different "states" the system can occupy, and the softmax-derived probabilities \(\alpha_i\) represent the likelihood of attending to each state. Thus, the attention output \(\vec x_{n+1}\) is the **expectation** of the value vectors \(\vec v_i\) under the probability distribution \(P\) defined by the similarity scores:

\[
\vec x_{n+1} := \sum_{i=1}^{n} \alpha_i \vec v_i = \mathbb{E}_{\vec v \sim P}[\vec v]
\]

This expectation is the key output of the attention mechanism. It represents the system's **aggregated response** based on the "energies" (similarities) between the query and keys. Each value vector \(\vec v_i\) is weighted by how likely it is to be selected, according to the Boltzmann-like softmax probabilities.

### Scaled Dot-Product Attention

To mitigate issues related to the magnitudes of these similarity scores, we introduce a scaling factor. As mentioned earlier, without scaling, the dot product can become large as the dimensionality of the key and query vectors increases, leading to numerical instability.

Our scaled dot products \(s_i \in \mathbb{R}\) are therefore defined as:

\[
s_i := \frac{\vec q_i \cdot \vec k_i}{\sqrt{d_k}}
\]

This scaling factor \(\sqrt{d_k}\) reduces the variance of the dot product, ensuring that the similarity scores remain within a manageable range before being passed through the softmax function. By scaling, we ensure that the softmax distribution is neither too **peaked** (overly focusing on one or two keys) nor too **flat** (spreading attention too evenly across all keys).

#### Final Interpretation: Boltzmann-Like Attention

Now, we can see the full **statistical mechanics interpretation** of attention. The scaled dot-product attention mechanism assigns probabilities \(\alpha_i\) based on an energy-like measure (the dot product), analogous to the Boltzmann distribution. The output of the attention mechanism is the **expected value** of the system, with the value vectors \(\vec v_i\) representing possible states and the softmax-normalized similarity scores \(\alpha_i\) representing their likelihoods:

\[
\text{Scaled Dot-Product Attention} := \mathbb{E}_{\vec v \sim P}[\vec v] = \sum_{i=1}^{n} \alpha_i \vec v_i
\]

In this sense, the attention mechanism acts like a **thermodynamic system** that dynamically adjusts which parts of the input it focuses on, computing an aggregate response based on probabilistic weighting.

Each attention head performs this process independently, capturing different "perspectives" on the input sequence. The final output of the attention module is a combination of these independent heads, giving a rich, multi-faceted interpretation of the input.

---

### Multi-Head Attention: Enhancing Flexibility and Parallelism

In modern transformers, to take full advantage of **parallelism** and the abundant computational resources available, the entire attention calculation is **repeated multiple times in parallel**. This repetition is done using **different sets of query, key, and value weight matrices**, denoted \(W_Q^h\), \(W_K^h\), and \(W_V^h\), for each attention head \(h\). Each of these repeated computations is referred to as an **attention head**.

The core idea behind multi-head attention is that each attention head can focus on different parts of the input sequence, **capturing diverse relationships** between tokens. For instance, one head might focus on local dependencies (like adjacent words), while another head might capture longer-range dependencies (relationships between distant words). By having multiple heads, the transformer can **simultaneously attend** to different types of patterns and structures in the data.

#### Why Multiple Heads?

One of the limitations of single-head attention is that it might become **biased toward certain types of relationships**. In contrast, multi-head attention provides several benefits:

- **Multiple perspectives:** Each head can learn to attend to different parts of the input. One head might focus on syntax (e.g., noun-verb relationships), while another might focus on meaning or co-references (e.g., relationships between pronouns and the nouns they refer to).
- **Dimensional flexibility:** By splitting the computation into multiple heads, the transformer can work with smaller subspaces of the input vector dimension. Instead of processing the entire embedding in one shot, the embedding is split into chunks (subspaces), and each head processes a different subspace, thus reducing the complexity of individual attention computations.
- **Improved learning dynamics:** Multiple heads help distribute the learning process, making it easier for the model to learn richer representations. The transformer can learn multiple attention patterns, allowing it to generalize better and understand a wider variety of input dependencies.

Mathematically, for each head \(h\), the attention computation is:

\[
\vec z^h = \sum_{i=1}^{n} \alpha_i^h \vec v_i^h
\]

where \(\alpha_i^h\) is the softmax-normalized similarity score computed for the \(h\)-th head, and \(\vec v_i^h\) is the value vector for the \(h\)-th head.

Each attention head performs the **scaled dot-product attention** independently, leading to multiple intermediate output vectors \(\vec z^h\), one for each head. These are then **concatenated** together into a single vector. If there are \(H\) heads, the output of the multi-head attention is:

\[
\text{Multi-Head Attention Output} = \text{Concat}(\vec z^1, \vec z^2, \dots, \vec z^H)
\]

#### Linear Transformation with \(W_O\)

Once the individual attention head outputs are concatenated, the result is passed through a final **linear transformation** using the weight matrix \(W_O\). This linear transformation combines the information from all the heads into a single output vector \(\vec x_{n+1}\), which is of the same dimension as the input embedding.

The role of this final linear transformation is twofold:

1. **Dimensionality reduction:** The concatenation of the attention heads increases the dimensionality of the output. The linear transformation \(W_O\) projects this concatenated vector back into the original embedding dimension \(d_{\text{model}}\), allowing the model to maintain consistency in dimensionality across layers.
   
2. **Aggregation of attention outputs:** The linear transformation allows the model to **combine information from all heads** in a meaningful way. Rather than having independent results from each head, the linear transformation aggregates them, enabling the model to learn a unified representation from multiple perspectives.

Thus, the final output of the attention mechanism is:

\[
\vec x_{n+1} = W_O \cdot \text{Concat}(\vec z^1, \vec z^2, \dots, \vec z^H)
\]

### Lower Dimensional Projections for Computational Efficiency

It’s important to note that, in practice, the attention mechanism typically works with **lower-dimensional projections** of the input embeddings. Each attention head operates in a reduced-dimensional subspace, where \(d_k = d_{\text{model}} / H\), ensuring that the total computational cost is kept manageable.

For example, if the input embedding dimension \(d_{\text{model}} = 512\) and there are \(H = 8\) heads, each head processes embeddings of dimension \(d_k = 512 / 8 = 64\). After processing, the outputs of the 8 heads (each 64-dimensional) are concatenated back into a single 512-dimensional vector before being transformed by \(W_O\).

This strategy balances **computational efficiency** with **model flexibility**, allowing the transformer to process large amounts of information in parallel while keeping the overall memory and compute cost reasonable.

### Summary of Multi-Head Attention

- **Parallelism:** Multi-head attention enables transformers to process multiple aspects of the input sequence in parallel, using different attention heads to focus on different relationships between tokens.
- **Diverse Focus:** By splitting the embedding into subspaces and learning multiple attention patterns, multi-head attention allows the model to capture a richer set of dependencies, both local and long-range, across the input sequence.
- **Efficiency:** Each head operates on lower-dimensional projections, reducing the computational burden while still allowing for a highly expressive model.

In summary, multi-head attention gives the transformer its power and flexibility, enabling it to learn complex relationships within the data through multiple independent perspectives. This parallelism, combined with the final linear aggregation, ensures that the transformer can handle large input sequences efficiently, while maintaining rich representational capacity.