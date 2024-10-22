---
title: 'Scaling Transformers Efficiently'
date: 2024-09-05T19:31:37-04:00
summary: "A summary of techniques for scaling transformers efficiently."
math: katex
categories: [Machine learning]
tags: [Language modeling, NLP, Transformers, Efficiency, Scaling]
weight: 200
---

Here, I will gather and summarize techniques in scaling transformers efficiently to make models cheap and powerful. Some of these techniques may be more specific or general than transformers only, being applicable either to specific parts of the transformer or to other parts of AI models. Some of these techniques could be used for language modeling, or deep learning models in general.

### Scalable MatMul-free Language Modeling
https://arxiv.org/abs/2406.02528
- This work builds on the [BitNet b1.58](https://arxiv.org/abs/2402.17764) paper, which uses ternary weights in the dense layers of the feed-forward network in the transformer.
- Main idea: a MatMul-free token mixer to replace the self-attention component typically found in transformer-based language models, which involves expensive matrix-matrix multiplications.
- Implications: they managed to fully eliminate matrix multiplication in their architecture, making it much more computationally efficient while retaining performance that scales as well as regular transformers.
- Implementation: https://github.com/ridgerchu/matmulfreellm. They build a custom FPGA hardware solution that allows extremely fast operation better than general-purpose GPUs.

### Mixture of A Million Experts
https://arxiv.org/abs/2407.04153

- This work builds on previous sparse mixture-of-experts (MoE) architectures, which aim to decouple model size from computational cost in transformer models.
- Main idea: Introduces PEER (Parameter Efficient Expert Retrieval), a novel layer design that uses product key technique for sparse retrieval from a vast pool of tiny experts (over a million).
- Key innovation: PEER enables efficient utilization of a massive number of experts, unlocking potential for further scaling of transformer models while maintaining computational efficiency.
- Implications: PEER layers outperform dense feedforward networks and coarse-grained MoEs in terms of performance-compute trade-off on language modeling tasks.
- Scaling: Demonstrates that higher granularity in expert mixtures leads to better performance, following the recently discovered fine-grained MoE scaling law.

### Q-Sparse: All Large Language Models can be Fully Sparsely-Activated
https://arxiv.org/abs/2407.10969

- This work builds on previous research aimed at improving the efficiency of large language models (LLMs) through techniques like quantization, pruning, and sparsity.
- Main idea: Introduces Q-Sparse, a novel approach for training sparsely-activated LLMs that enables full sparsity of activations, leading to significant efficiency gains during inference.
- Key innovation: Applies top-K sparsification to activations and uses the straight-through estimator (STE) during training to overcome gradient vanishing issues.
- Implications: 
  1. Q-Sparse can achieve results comparable to dense baseline LLMs while being much more efficient at inference time.
  2. Presents an inference-optimal scaling law for sparsely-activated LLMs.
  3. Effective in various settings: training from scratch, continue-training of existing LLMs, and fine-tuning.
  4. Works for both full-precision and 1-bit LLMs (e.g., BitNet b1.58), so these methods can be leveraged together.
- Scaling: Demonstrates that sparsely-activated models follow a power law scaling similar to dense models, with the performance gap diminishing as model size increases.