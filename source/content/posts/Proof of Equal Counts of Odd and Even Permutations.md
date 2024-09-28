---
title: 'Proof of Equal Number of Odd and Even Permutations using Determinants'
date: 2024-09-28T14:48:35-04:00
summary: "A proof of the equinumerosity of the number of odd and even permutations via determinants."
math: katex
categories:
  - Linear Algebra
tags:
  - Determinant
  - Combinatorics
  - Permutation
  - Sign
  - Even Permutation
  - Odd Permutation
weight: 100
draft: false
---

I am reading through the book "Linear Algebra Done Wrong" by Sergei Treil. On page 89, the exercise 4.4.3 is given as follows:

> 4.3. Why is there an even number of permutations of \((1,2,\dots,9)\) why are there exactly half of them odd permutations? **Hint:** This problem can be hard to solve in terms of permutations, but there is a very simple solution using determinants.

The classic solution to this problem is by forming a bijection on the set of all permutations of \(n\) elements \(S_n\) through a transposition (a swap of 2 elements). This leaves \(S_n\) unchanged, but it maps each permutation to one of different parity (i.e. odd to even, even to odd). Since the set \(S_n\) is the same, the number of odd permutations has been mapped to the number of even permutations, and vice versa. But these numbers have not changed, so the number of odd permutations is equal to the number of even permutations.

However, this proof using determinants is equally as cool. The determinant of a square matrix is defined as follows:

\[
\det(A) = \sum_{\sigma \in S_n} \text{sign}(\sigma) \prod_{i=1}^n a_{i,\sigma(i)}
\]

where \(\sigma\) is a permutation of \(n\) elements and \(\text{sign}(\sigma)\) is the sign of the permutation \(\sigma\).

Now, consider the following matrix:

\[
A = \begin{bmatrix}
1 & 1 & \dots & 1 \\
1 & 1 & \dots & 1 \\
\vdots & \vdots & \ddots & \vdots \\
1 & 1 & \dots & 1
\end{bmatrix}
\]

In other words, \(A\) is a matrix with all entries equal to 1.

This matrix has the following determinant:

\[
\det(A) = \sum_{\sigma \in S_n} \text{sign}(\sigma) \prod_{i=1}^n 1 = \sum_{\sigma \in S_n} \text{sign}(\sigma)
\]

But at the same time, the matrix has duplicate columns, so we know the determinant is \(0\). Therefore, we have:

\[
\det(A) = \sum_{\sigma \in S_n} \text{sign}(\sigma) = 0
\]

But since \(\text{sign}(\sigma)\) is \(1\) for even permutations and \(-1\) for odd permutations, we have:

\[
\sum_{\sigma \in S_n} \text{sign}(\sigma) = n_e (1) + n_o (-1) = 0
\]

\[
n_e = n_o
\]

Therefore, the number of even permutations is equal to the number of odd permutations. Very epic!