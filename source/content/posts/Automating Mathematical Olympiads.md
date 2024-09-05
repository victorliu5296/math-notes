---
title: 'Automating Mathematical Olympiads'
date: 2024-09-05T18:35:18-04:00
math: katex
categories: []
tags: []
weight: 100
draft: true
---

Today, Matt Shumer, CEO of HyperWrite AI, announced the newest top open-source model, Reflection 70B. It is a fine-tuned version of Llama 3.1 70B trained to reflect on its own output using a technique called "Reflection-Tuning", and correct its own mistakes accordingly.

This model crushed benchmarks like crazy. It's ranking among the SOTA models from OpenAI and Anthropic, which is absolutely insane to think about since they are both likely much larger in comparison.

There aren't many details about the techniques used as they are working on releasing them, but the main idea is that it leverages chain-of-thought techniques by generating "thinking tokens" with <thinking></thinking> and within that, "reflection tokens" surrounded by <reflection> and </reflection> tags.

I was very pleasantly surprised by the results. Anthropic already did a similar thing in their website to make Claude "think" before it answers queries. However, while it did improve results, it wasn't anything like these new results we are seeing.

According Matt Shumer himself, the results didn't seem very meaningful with an 8 billion parameter model. However, we of course see a very significant change in the 70B range. This is why they are also actively working on creating a 405B version as well.

What are the implications of this? It's likely that it will get exponentially better as it scales up. Maybe it might plateau at some point. But until then, this is a significant advancement in developing AGI.

Here, I would like to focus on a very specific set of problems: specifically, those of high-school level competitive computer science and mathematics olympiads. I am convinced that the existing techniques are plenty sufficient to solve these problems at over 99% accuracy.

As evidence of this, they managed to get 99.2% in the grade school math problems benchmark GSM8K (keep in mind, some problems are mislabeled, so the model likely got the right solution, but the label solution would've been incorrect in those cases).

Previously, models were only getting high accuracy by overfitting, but even if presence of "reasoning" could be debatable, it is undebatable that this model manages to see some form of self-correction.

The problems in high school olympiads are very easy to verify. For computer science, we simply run the programs and see if the output is correct. And for math, recent developments like OpenAI's work on using LLMs with formal languages, AlphaGeometry, DeepSeekProver and AlphaProof make it obvious that these verification algorithms are extremely powerful.

I'll leave off with the following: speculation on AI and the future of mathematics has been widely debated for a while. While most people likely believed that it would reach very strong levels at a certain point, this event confirms that we are very close to such things being possible.

Using formal verification tools like Lean 4, it is possible to prove if the model is correct. Then, given the incredible performance of transformers, our existing techniques alone without major adjustments should be enough to reach researcher level capabilities through self-refinement in training. We could then automate mathematical research, exploding progress unlike anything ever done before.

Why is this so useful and compelling? Some people are sad because they think it reduces the value of mathematics for humans. On the complete and total contrary! Such a powerful tool can successively offer endless high-quality practice problems, and even allow for the creation of entirely new mathematical concepts. We will be able to learn with AI tutors for everyone, the best teachers in the world accessible for all, truly democratizing education and science for all.

Even the giants like Euler and Gauss built their own ideas based on the work of others. Having doors opened to entire new fields that you never could've even imagined before is truly amazing, and something I am already experiencing myself. The satisfaction is unlike anything else.

It is an exciting time for AI and mathematics, and in turn for science as a whole. I dare say it is the most exciting time of known history.