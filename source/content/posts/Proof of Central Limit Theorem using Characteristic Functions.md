---
title: 'Proof of Central Limit Theorem Using Characteristic Functions'
date: 2024-09-28T10:14:42-04:00
summary: "A fairly rigorous proof of the Central Limit Theorem (CLT) using characteristic functions."
math: katex
categories:
  - Statistics
tags:
  - Proof
  - Central Limit Theorem
  - Characteristic Function
  - Probability Distribution
  - Normal Distribution
  - Gaussian Distribution
weight: 100
draft: false
---

There is an abundance of proofs of the Central Limit Theorem (CLT) using either moment-generating functions or characteristic functions. However, they are often quite difficult to follow because they rely on hand-waving and skip a lot of justification for the steps.

This post offers a detailed step-by-step proof of the Central Limit Theorem using characteristic functions.

## Proof of the Central Limit Theorem Using Characteristic Functions

### **Statement of the Central Limit Theorem**

Let \( X_1, X_2, \ldots, X_n \) be independent and identically distributed (i.i.d.) random variables with mean \( \mu \) and variance \( \sigma^2 > 0 \). Define:

\[
S_n = \sum_{i=1}^n X_i
\]
\[
Z_n = \frac{S_n - n\mu}{\sigma\sqrt{n}}
\]

Here, \( S_n \) is the sum of \( n \) i.i.d. random variables, and \( Z_n \) is the normalized sum of \( n \) i.i.d. random variables (i.e., it has mean \( 0 \) and variance \( 1 \)).

The Central Limit Theorem states that as \( n \to \infty \), the distribution of \( Z_n \) converges in distribution to a standard normal random variable \( Z \sim N(0,1) \).

### **Proof Using Characteristic Functions**

#### **Step 1: Define the Characteristic Function**

The characteristic function \( \phi_X(t) \) of a random variable \( X \) is defined as:
\[
\phi_X(t) = E[e^{itX}]
\]

#### **Step 2: Properties of Characteristic Functions**

We use the following key properties of characteristic functions:
1. For independent random variables \( X \) and \( Y \), \( \phi_{X+Y}(t) = \phi_X(t) \phi_Y(t) \).
2. For a constant \( a \), \( \phi_{aX}(t) = \phi_X(at) \).
3. For a constant \( b \), \( \phi_{X+b}(t) = e^{itb} \phi_X(t) \).

#### **Step 3: Characteristic Function of** \( Z_n \)

Using the properties of characteristic functions, we express the characteristic function of \( Z_n \):

\[
\phi_{Z_n}(t) = E\left[ e^{itZ_n} \right] = E\left[ e^{it \frac{S_n - n\mu}{\sigma \sqrt{n}}} \right] = e^{-it \frac{n\mu}{\sigma \sqrt{n}}} \phi_{S_n} \left( \frac{t}{\sigma \sqrt{n}} \right)
\]

#### **Step 4: Characteristic Function of** \( S_n \)

Since \( S_n \) is the sum of \( n \) i.i.d. random variables, the characteristic function of \( S_n \) can be written as:
\[
\phi_{S_n}(t) = \left( \phi_X(t) \right)^n
\]
where \( \phi_X(t) \) is the characteristic function of the individual random variables \( X_i \).

#### **Step 5: Taylor Expansion of** \( \phi_X(t) \)

We now expand \( \phi_X(t) \) around \( t = 0 \) using a Taylor expansion:
\[
\phi_X(t) = 1 + it\mu - \frac{t^2}{2}(\sigma^2 + \mu^2) + o(t^2)
\]
where \( o(t^2) \) represents terms that vanish faster than \( t^2 \) as \( t \to 0 \). We will see that we don't need to expand this term because it vanishes as \( n \to \infty \).

#### **Step 6: Substitute into** \( \phi_{Z_n}(t) \)

Substituting the Taylor expansion of \( \phi_X(t) \) into the expression for \( \phi_{Z_n}(t) \), we get:
\[
\begin{aligned}
\phi_{Z_n}(t) &= e^{-it \frac{n\mu}{\sigma \sqrt{n}}} \left( 1 + i\frac{t}{\sigma \sqrt{n}} \mu - \frac{t^2}{2\sigma^2 n} (\sigma^2 + \mu^2) + o\left( \frac{1}{n} \right) \right)^n
\\
&= e^{-it \frac{n\mu}{\sigma \sqrt{n}}} \left( 1 + \frac{1}{n} \left(i\frac{t}{\sigma \sqrt{n}} n\mu - \frac{t^2}{2\sigma^2} (\sigma^2 + \mu^2) + n o\left( \frac{1}{n} \right) \right) \right)^n
\end{aligned}
\]

#### **Step 7: Simplify and Take Limit**

Recall the limit form of the exponential function:

\[
e^z = \lim_{n \to \infty} \left( 1 + \frac{z}{n} \right)^n
\]

In our earlier expression:

\[
\phi_{Z_n}(t) = e^{-it \frac{n\mu}{\sigma \sqrt{n}}} \left( 1 + \frac{1}{n} \textcolor{red}{\left(i\frac{t}{\sigma \sqrt{n}} n\mu - \frac{t^2}{2\sigma^2} (\sigma^2 + \mu^2) + n o\left( \frac{1}{n} \right) \right)} \right)^n
\]

As \( n \to \infty \), we can use the limit form of \( e^z \) and simplify the expression.

\[
\lim_{n \to \infty} \phi_{Z_n}(t) = e^{-it \frac{n\mu}{\sigma \sqrt{n}}} \cdot e^{i \frac{t}{\sigma \sqrt{n}} n \mu - \frac{t^2}{2} + no\left( \frac{1}{n} \right)}
\]

\[
= e^{-\frac{t^2}{2}} \cdot e^{o(1)}
\]

Here, \( n o\left( \frac{1}{n} \right) = o(1) \). Since, by definition, \( o(1) \to 0 \) as \( n \to \infty \), then \( e^{o(1)} \to 1 \) as \( n \to \infty \), and we have:

\[
\lim_{n \to \infty} \phi_{Z_n}(t) = e^{-\frac{t^2}{2}}
\]

#### **Step 8: Recognize the Limit**

The function \( e^{-\frac{t^2}{2}} \) is the characteristic function of a standard normal distribution \( N(0,1) \).

#### **Step 9: Apply Lévy's Continuity Theorem**

Lévy's Continuity Theorem states that if a sequence of characteristic functions converges pointwise to a function that is continuous at 0, then the corresponding random variables converge in distribution to a random variable with that characteristic function.

Since \( \phi_{Z_n}(t) \to e^{-\frac{t^2}{2}} \) as \( n \to \infty \), and \( e^{-\frac{t^2}{2}} \) is the characteristic function of \( N(0,1) \), we conclude that \( Z_n \) converges in distribution to a standard normal random variable.

### **Conclusion**

We have shown that the characteristic function of \( Z_n \) converges to the characteristic function of a standard normal random variable. By applying Lévy's Continuity Theorem, we conclude that \( Z_n \) converges in distribution to \( N(0,1) \), thus proving the Central Limit Theorem.

---

### **Note on Characteristic Functions and Probability Distributions**

The bijection between characteristic functions and probability distributions can be rigorously analyzed and proved via the Fourier transform and its inverse. Specifically, the characteristic function \( \phi_X(t) \) of a random variable \( X \) is the Fourier transform of the probability density function (if it exists) or the probability distribution function of \( X \). This connection is central to the study of convergence in distribution and to results such as the Central Limit Theorem.

#### **Fourier Transform and Inversion**

Given a probability density function \( f_X(x) \) for a random variable \( X \), its characteristic function is defined as:
\[
\phi_X(t) = \int_{-\infty}^{\infty} e^{itx} f_X(x) \, dx
\]
This is exactly the Fourier transform of the probability density function \( f_X(x) \).

Conversely, if we know the characteristic function \( \phi_X(t) \), the probability density function \( f_X(x) \) can be recovered using the inverse Fourier transform:
\[
f_X(x) = \frac{1}{2\pi} \int_{-\infty}^{\infty} e^{-itx} \phi_X(t) \, dt
\]
Thus, there is a direct and invertible relationship between the characteristic function and the probability density function.

#### **Uniqueness and Continuity**

One of the key results in probability theory is that the characteristic function uniquely determines the distribution of a random variable. This is a consequence of the fact that the Fourier transform is injective, meaning different probability distributions have distinct characteristic functions.

Furthermore, the continuity of characteristic functions plays an important role in proving convergence in distribution. Lévy’s Continuity Theorem relies on this fact: if a sequence of characteristic functions converges pointwise to a limiting function that is continuous at \( t = 0 \), then this limiting function is the characteristic function of some random variable, and the corresponding sequence of random variables converges in distribution to that random variable.

#### **Application to Central Limit Theorem**

In the proof of the Central Limit Theorem, we showed that the characteristic function of the normalized sum \( Z_n \), \( \phi_{Z_n}(t) \), converges to the characteristic function of the standard normal distribution:
\[
\lim_{n \to \infty} \phi_{Z_n}(t) = e^{-\frac{t^2}{2}}
\]
Since the Fourier transform is bijective, this convergence implies that the probability distributions of \( Z_n \) converge to the normal distribution \( N(0,1) \). The inverse Fourier transform ensures that the limiting characteristic function corresponds to the standard normal distribution, completing the argument.

In this way, the theory of Fourier transforms and characteristic functions not only provides a powerful tool for analyzing convergence in distribution but also guarantees the unique correspondence between characteristic functions and probability distributions.