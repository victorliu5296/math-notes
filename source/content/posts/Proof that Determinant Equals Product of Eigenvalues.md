---
title: 'Proof That Determinant Equals Product of Eigenvalues'
date: 2024-09-28T19:50:40-04:00
summary: "A short proof that the determinant of a (finite-dimensional) matrix is equal to the product of its eigenvalues."
math: katex
categories:
  - Linear Algebra
tags:
  - Proof
  - Eigenvalues
  - Determinants
  - Spectral Theory
weight: 100
draft: false
---

Proof that the determinant of a matrix is equal to the product of its eigenvalues based on exercise 4.1.10 from the book "Linear Algebra Done Wrong" by Sergei Treil.

#### 1. Start with the characteristic equation:
The characteristic polynomial of a matrix \( A \) is given by the determinant of \( A - \lambda I \), where \( \lambda \) is a scalar and \( I \) is the identity matrix:
\[
\text{det}(A - \lambda I) = 0
\]
The roots of this polynomial are the eigenvalues of the matrix \( A \). By the fundamental theorem of algebra, we have:
\[
\text{det}(A - \lambda I) = (\lambda_1 - \lambda)(\lambda_2 - \lambda) \dots (\lambda_n - \lambda)
\]
where \( \lambda_1, \lambda_2, \dots, \lambda_n \) are the eigenvalues of \( A \), possibly repeated according to their algebraic multiplicities.

#### 2. Plug in \( \lambda = 0 \):
From the characteristic polynomial, if we plug in \( \lambda = 0 \), we get:
\[
\text{det}(A - 0 \cdot I) = \text{det}(A) = (\lambda_1)(\lambda_2) \dots (\lambda_n)
\]
This shows that the determinant of matrix \( A \) is the product of its eigenvalues, taking into account their multiplicities.

#### 3. Conclusion:
Thus, we have proven that the determinant of \( A \) is indeed the product of its eigenvalues:
\[
\text{det}(A) = \lambda_1 \lambda_2 \dots \lambda_n
\]

\( \square \)