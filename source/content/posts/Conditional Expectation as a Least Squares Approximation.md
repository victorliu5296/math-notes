---
title: 'Conditional Expectation as a Least Squares Approximation'
date: 2024-10-11T22:35:38-04:00
summary: "Conditional Expectation defined as an optimal predictor for a random variable through orthogonal projection"
math: katex
categories:
  - Probability Theory
  - Linear Algebra
tags:
  - Conditional Expectation
  - Least Squares
  - Orthogonal Projection
  - Hilbert Space
weight: 100
draft: false
---

A while ago, I did many algebraic manipulations to derive the formula for conditional expectation and show it is the optimal predictor for a random variable. However, I recently have been introduced to the beautiful perspective of linear algebra and basics of functional analysis, and it really does simplify the derivation.

Taken from [AN INTRODUCTION TO STOCHASTIC DIFFERENTIAL EQUATIONS](https://www.cmor-faculty.rice.edu/~cox/stoch/SDE.course.pdf) by Lawrence C. Evans.

---

### Conditional Expectation via Least Squares Projection

#### Motivation:
Conditional expectation, a fundamental concept in probability, can be derived through an elegant geometric approach using **least squares projections**. This method is based on minimizing the distance between a vector (or random variable) and a subspace, which leads to a natural interpretation of conditional expectation as a best approximation.

#### 1. **Least Squares in** \( \mathbb{R}^n \):
Consider \( \mathbb{R}^n \) and a proper subspace \( V \subseteq \mathbb{R}^n \). Given a vector \( x \in \mathbb{R}^n \), we aim to find \( z \in V \) that minimizes the distance:
\[
\| z - x \| = \min_{y \in V} \| y - x \|.
\]
This problem has a unique solution where \( z \) is the **projection of** \( x \) **onto** \( V \), denoted by:
\[
z = \text{proj}_V(x).
\]
Geometrically, this projection ensures that the error \( x - z \) is orthogonal to the subspace \( V \).

#### 2. **Characterizing the Projection:**
Let \( w \in V \) be any vector in the subspace. Define the function:
\[
i(\tau) := \| z + \tau w - x \|^2.
\]
Since \( z + \tau w \in V \) for all \( \tau \), the minimization implies that \( i(\cdot) \) has a minimum at \( \tau = 0 \), which leads to:
\[
0 = i'(0) = 2(z - x) \cdot w,
\]
which gives:
\[
x \cdot w = z \cdot w \quad \text{for all} \ w \in V.
\]
Thus, \( x - z \) is perpendicular to every vector in \( V \).

#### 3. **Projection in** \( L^2 \) **Spaces (Random Variables):**
We extend this idea to random variables. Consider the space \( L^2(\Omega) \), which consists of all real-valued square-integrable random variables. Given random variables \( X \) and \( Y \) in \( L^2(\Omega) \), their **inner product** is defined as:
\[
(X, Y) := \int_\Omega X Y \, dP = \mathbb{E}[XY].
\]
The norm associated with this inner product is:
\[
\| Y \| := \left( \int_\Omega Y^2 \, dP \right)^{1/2} = \left( \mathbb{E}[Y^2] \right)^{1/2}.
\]

#### 4. **Conditional Expectation as Projection:**
Let \( V = L^2(\Omega, \mathcal{V}) \), where \( \mathcal{V} \subseteq \mathcal{U} \) is a sub-\(\sigma\)-algebra. This is the space of \( \mathcal{V} \)-measurable random variables. Given \( X \in L^2(\Omega) \), we can project \( X \) onto \( V \) to find the best \( \mathcal{V} \)-measurable approximation of \( X \). Denote this projection by:
\[
Z = \text{proj}_V(X).
\]
Just as before, the projection satisfies:
\[
(X, W) = (Z, W) \quad \text{for all} \ W \in V,
\]
which implies:
\[
\int_A X \, dP = \int_A Z \, dP \quad \text{for all} \ A \in \mathcal{V}.
\]
Since \( Z \) is \( \mathcal{V} \)-measurable, we conclude that \( Z = \mathbb{E}[X | \mathcal{V}] \).

Thus, conditional expectation \( \mathbb{E}[X | \mathcal{V}] \) can be interpreted as the **projection of** \( X \) **onto the space of** \( \mathcal{V} \) **-measurable random variables**:
\[
\mathbb{E}[X | \mathcal{V}] = \text{proj}_V(X).
\]

#### 5. **Conclusion:**
This approach allows us to view conditional expectation as solving the least squares problem:
\[
\| Z - X \| = \min_{Y \in V} \| Y - X \|,
\]
where \( Z = \mathbb{E}[X | \mathcal{V}] \) is the best \( \mathcal{V} \)-measurable approximation of \( X \). This perspective provides a geometric intuition for conditional expectation as a projection, minimizing the "error" or distance between \( X \) and its approximation from the subspace of \( \mathcal{V} \)-measurable random variables.
