---
title: 'Multi-Head Latent Attention'
date: 2024-09-13T20:02:08-04:00
math: katex
description: "A short post on Multi-Head Latent Attention as presented in the DeepSeek-V2 paper."
categories: [Machine Learning]
tags: [Multi-head Latent Attention, Low Rank Approximation, DeepSeek-V2, Attention Mechanism, Transformer]
weight: 100
---

A short post on Multi-Head Latent Attention as presented in the DeepSeek-V2 paper.

## Multi-Head Latent Attention (MLA)

Multi-Head Latent Attention (MLA) is an innovative approach to attention mechanisms introduced in the DeepSeek-V2 paper. It aims to reduce the memory overhead of traditional multi-head attention while maintaining or even improving performance.

The key idea behind MLA is to compress the key-value (KV) cache and the queries using a low-rank approximation.

### Motivation

Traditional multi-head attention in transformers, while powerful, is computationally expensive and memory-intensive. The key-value (KV) cache for each token requires storing $2d_hn_h$ elements, resulting in significant memory consumption, especially for long sequences:

$$
\text{Total KV Memory} = \text{seq\_len} \cdot \text{layer count} \cdot 2d_hn_h
$$

MLA addresses this issue by using a low-rank approximation to compress the KV cache.

### Low-Rank Approximation

The core idea of MLA is to approximate the key and value matrices with a low-rank representation using two linear transformations: down-projection and up-projection.

#### Down-Projection

The input embeddings are mapped to a lower-dimensional space, creating a compressed context matrix:

$$
C = X_\text{context}W_{DKV} \in \mathbb{R}^{\text{seq\_len} \times d_c}
$$

Where:
- $W_{DKV} \in \mathbb{R}^{d_\text{model} \times d_c}$ is the down-projection matrix
- $d_c$ is the reduced latent dimension ($d_c \ll d_\text{model}$)

#### Up-Projection

The compressed context is then up-projected to reconstruct the key and value matrices:

$$
K = CW_{UK} \in \mathbb{R}^{\text{seq\_len} \times d_hn_h}, \quad V = CW_{UV} \in \mathbb{R}^{\text{seq\_len} \times d_hn_h}
$$

Where:
- $W_{UK}, W_{UV} \in \mathbb{R}^{d_c \times d_hn_h}$ are the up-projection matrices for keys and values

This approach significantly reduces memory requirements by storing only the smaller context matrix $ C $ .

### Query Compression

MLA also applies low-rank compression to queries, reducing activation memory during training:

$$
Q_\text{latent} = X_\text{query}W_{DQ} \in \mathbb{R}^{\text{seq\_len} \times d_c'}
$$

Where $W_{DQ} \in \mathbb{R}^{d_\text{model} \times d_c'}$ is the down-projection matrix for queries.

### Decoupled Rotary Position Embeddings (RoPE)

To preserve positional information despite the low-rank approximation, MLA employs a decoupled RoPE strategy:

1. **Context-driven components:**
   $$ 
   Q_C = XW_Q \in \mathbb{R}^{\text{seq\_len} \times d_hn_h}
   $$ 
   $$ 
   K_C = XW_{UK} \in \mathbb{R}^{\text{seq\_len} \times d_hn_h}
   $$ 

2. **RoPE-driven components:**
   $$ 
   Q_\text{RoPE} = \text{RoPE}(XW_{QR}) \in \mathbb{R}^{\text{seq\_len} \times d_\text{RoPE}n_h}
   $$ 
   $$ 
   K_\text{RoPE} = \text{RoPE}(XW_{KR}) \in \mathbb{R}^{\text{seq\_len} \times d_\text{RoPE}n_h}
   $$ 

3. **Concatenation:**
   $$ 
   Q = \text{Concat}(Q_C, Q_\text{RoPE}) \in \mathbb{R}^{\text{seq\_len} \times (d_h + d_\text{RoPE})n_h}
   $$ 
   $$ 
   K = \text{Concat}(K_C, K_\text{RoPE}) \in \mathbb{R}^{\text{seq\_len} \times (d_h + d_\text{RoPE})n_h}
   $$ 

### Attention Computation

The attention mechanism is then applied using the concatenated queries and keys:

$$
A = \text{softmax}\left(\frac{QK^T}{\sqrt{d_h + d_\text{RoPE}}}\right)
$$

$$
O = AV
$$

The final output is obtained by projecting the attention output:

$$
\text{Output} = OW^O
$$

Where $ W^O \in \mathbb{R}^{d_hn_h \times d_\text{model}} $ is the output projection matrix.

### Advantages of MLA

According to the DeepSeek-V2 paper, Multi-Head Latent Attention outperforms traditional Multi-Head Attention despite being computationally cheaper. This is a notable achievement, as it contrasts with other efficiency-focused approaches like LoRA (Low-Rank Adaptation) where reduced computational cost often comes at the expense of performance.

The superior performance of MLA, combined with its memory efficiency, makes it a promising advancement in attention mechanisms for large language models.