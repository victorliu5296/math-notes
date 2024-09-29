---
title: 'Proof That Trace Equals Sum of Eigenvalues'
date: 2024-09-28T19:55:48-04:00
summary: "A short proof that the trace of a (finite-dimensional) matrix is equal to the sum of its eigenvalues."
math: katex
categories:
  - Linear Algebra
tags:
  - Proof
  - Eigenvalues
  - Trace
  - Spectral Theory
weight: 100
draft: false
---

Proof that the trace of a matrix is equal to the sum of its eigenvalues based on exercise 4.1.11 from the book "Linear Algebra Done Wrong" by Sergei Treil.

### Step 1: Compute the coefficient of \( \lambda^{n-1} \)
The characteristic polynomial of a matrix \( A \) is given by \( \det(A - \lambda I) \). The eigenvalues \( \lambda_1, \lambda_2, \dots, \lambda_n \) are the roots of this characteristic polynomial, so we can factor it as:

\[
\det(A - \lambda I) = (\lambda_1 - \lambda)(\lambda_2 - \lambda) \dots (\lambda_n - \lambda)
\]

We need to compute the coefficient of \( \lambda^{n-1} \). Expanding this product:

\[
(\lambda_1 - \lambda)(\lambda_2 - \lambda) \dots (\lambda_n - \lambda) = (-1)^n \lambda^n + (-1)^{n-1} (\lambda_1 + \lambda_2 + \dots + \lambda_n) \lambda^{n-1} + \dots
\]

The coefficient of \( \lambda^{n-1} \) is \( (-1)^{n-1} (\lambda_1 + \lambda_2 + \dots + \lambda_n) \), which is just the sum of the eigenvalues multiplied by \( (-1)^{n-1} \).

### Step 2: Show that \( \det(A - \lambda I) \) can be written in terms of the diagonal entries
For a matrix \( A = [a_{i,j}] \), we can expand \( \det(A - \lambda I) \) as follows:

\[
\det(A - \lambda I) = (a_{1,1} - \lambda)(a_{2,2} - \lambda) \dots (a_{n,n} - \lambda) + o(\lambda^{n-1})
\]

Here, \( o(\lambda^{n-1}) \) is a polynomial of degree at most \( n-2 \).

To show this is true, we can use the cofactor expansion of the determinant. We'll use the following construction: suppose we start by crossing out the first row and column of the matrix \( A - \lambda I \). The important thing to notice is that the first term of this expansion is something of the form
\[
(a_{1,1} - \lambda)\det(\left( A - \lambda I \right)_{1,1})
\]

where \( \left( A - \lambda I \right)_{1,1} \) is the submatrix obtained by deleting the first row and column of \( A - \lambda I \). However, the *other terms* in this expansion involve crossing out the row \( 1 \) and column \( j \) for \( j \neq 1 \), which means that we will eliminate \( 2 \) different entries containing \( \lambda \). Therefore, the remaining terms result in a polynomial of at most degree \( n-2 \) (each coefficient does not contain \( \lambda \), and the minor determinants have degree at most \( n - 2 \)).

We can repeat this procedure for row \( 2 \), \( 3 \), \( \dots \), and \( n \), which leaves us with the desired result.

### Step 3: Compare coefficients of \( \lambda^{n-1} \)
Now, we compare the coefficients of \( \lambda^{n-1} \) in both expressions.

- From Step 1, we saw that the coefficient of \( \lambda^{n-1} \) is \( (-1)^{n-1} (\lambda_1 + \lambda_2 + \dots + \lambda_n) \), i.e., the sum of the eigenvalues.
- From Step 2, expanding \( (a_{1,1} - \lambda)(a_{2,2} - \lambda) \dots (a_{n,n} - \lambda) \), we find that the coefficient of \( \lambda^{n-1} \) is \( (-1)^{n-1} (a_{1,1} + a_{2,2} + \dots + a_{n,n}) \), i.e., the trace of the matrix.

Since these two coefficients must be equal, we conclude that:

\[
\text{Tr}(A) = a_{1,1} + a_{2,2} + \dots + a_{n,n} = \lambda_1 + \lambda_2 + \dots + \lambda_n
\]

Thus, **the trace of the matrix equals the sum of the eigenvalues**.

This completes the proof. \(\blacksquare\)