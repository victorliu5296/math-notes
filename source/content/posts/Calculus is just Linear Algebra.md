---
title: 'Calculus Is Just Linear Algebra'
date: 2024-10-09T19:43:57-04:00
summary: "An introduction to functional analysis"
math: katex
categories:
  - Functional Analysis
  - Calculus
  - Linear Algebra
tags:
  - Differential Equations
  - Fourier Transform
  - Laplace Transform
  - Linear Transformations
  - Operator Theory
  - Spectral Theory
  - Dual Spaces
  - Eigenfunctions
  - Taylor Series
  - Fourier Series
  - Lagrange Interpolation
  - Mathematical Physics
  - Function Spaces
weight: 25
draft: false
---

The title really is true—I'm not kidding! *Functional analysis* defines fundamental concepts in calculus within the framework of linear algebra, and it’s incredible how many insights we can derive from this connection.

In fact, many concepts in calculus, often presented arbitrarily, can be understood as linear transformations. This perspective makes tools like Laplace and Fourier transforms arise much more naturally.

## A Friendly Introduction to Calculus Through Linear Algebra

At first glance, calculus and linear algebra may seem like separate subjects—calculus studies change (how things move, grow, or shrink), while linear algebra focuses on vectors and matrices. But these two worlds are deeply connected. Many calculus operations, like differentiation and integration, are actually **linear transformations**, just like those we study in linear algebra.

First, how would we ever think of doing this? Does it make sense? Yes, it does! To see this, let's review some familiar concepts in calculus.

### 1. **Derivative and Integral as Linear Transformations**

The derivative gives us the local rate of change of a function at a point. Geometrically, it represents the slope of the tangent line. Formally, for a function \( f(x) \), the derivative at \( a \) is:

\[
f'(a) = \lim_{\Delta x \to 0} \frac{f(a + \Delta x) - f(a)}{\Delta x}
\]

This derivative is a **linear approximation** of the function near \( a \), where we treat the function locally as a straight line:

\[
f(x) \approx f(a) + f'(a)(x - a)
\]

Thus, differentiation is about local linearity—how a function behaves in an infinitesimally small region. And, importantly, the derivative is a **linear transformation**, meaning it transforms a function into its rate of change. This motivates the following definition.

We can express the derivative as a linear operator, \( D \), that acts on a function \( f(x) \) and produces its derivative \( f'(x) \). 

\[
D(f) = f'
\]

When evaluated at a specific point \( a \), this becomes:

\[
D|_a(f) = f'(a)
\]

In general, \( D \) is understood as an operator that transforms the entire function into its derivative, making it a linear operator in the same sense we see in linear algebra.

While the derivative provides the rate of change, integration sums infinitesimal contributions over an interval to compute total change. For a function \( f(x) \), the definite integral from \( a \) to \( b \) is:

\[
\int_a^b f(x) \, dx
\]

Just as differentiation involves local linearity, integration involves **global accumulation**—summing small changes over an interval. Importantly, integration is also a **linear operator**.

The integral operator, \( I|_a^b \), transforms a function into its accumulated sum over an interval:

\[
I|_a^b(f) = \int_a^b f(x) \, dx
\]

This operator satisfies additivity \( I|_a^b(f + g) = I|_a^b(f) + I|_a^b(g) \) and homogeneity \( I|_a^b(\alpha f) = \alpha I|_a^b(f) \), confirming its linear nature.

### 2. **Functions as Vectors in Function Spaces**

Okay, so the differentiation and integration operators are inherently linear operations, so it is believable that we can define them using linear algebra. But to apply linear algebra, we need vectors. This means we have to think of functions as vectors in a vector space. Does this even make sense?

Just as vectors in space can be added and scaled, so can functions:

- **Adding functions**: \( (f + g)(x) = f(x) + g(x) \)
- **Scalar multiplication**: \( (\alpha f)(x) = \alpha f(x) \)

Unfortunately, this notation is quite poor, and it makes it seem like we just rewrote it in a trivial way. In fact, it is completely different: on the left-hand side, we define a *new function* with operations on *functions*, whereas on the right-hand side, the operations are applied to *scalars*.

Thus, with these definitions, functions live in a **function space** where differentiation and integration are linear transformations acting on these "function-vectors."

### 3. **Differentiation and Integration as Transformations on Function Spaces**

In this view, differentiation and integration are transformations that operate within a function space:

- **The derivative operator**, \( D|_a \), transforms \( f \) into \( f'(a) \), describing local rates of change.
- **The integral operator**, \( I|_a^b \), transforms \( f \) into the total accumulated value over an interval.

Both are linear, reinforcing that calculus operations fit naturally into the framework of linear algebra.

### 7. **Why Does This Perspective Matter?**

You may wonder why we should view calculus through the lens of linear algebra. By recognizing differentiation and integration as linear transformations, we unlock powerful new ways to approach problems. Advanced topics like solving differential equations, understanding Fourier series, and working with transforms all benefit from this linear algebraic perspective.

For example, eigenfunctions (like \( e^{\lambda x} \)) behave under the derivative operator similarly to eigenvectors under a matrix:

\[
D(e^{\lambda x}) = \lambda e^{\lambda x}
\]

This correspondence allows us to apply the *incredibly powerful* tools of linear algebra to calculus problems, making them easier to understand and solve.

Don't worry, I have many examples to convince you! I'll start with this: using **duality**, we can find virtually any interpolation formula, like Taylor series, Fourier series, and Lagrange interpolation, by viewing them as expansions of functions using dual functionals.

This result is called the *abstract Fourier decomposition*, and it is incredibly powerful.

## Abstract Fourier Decomposition

### **Dual Spaces: Definition and Concept**

In linear algebra, vectors are elements of a **vector space**, like ordered pairs in \( \mathbb{R}^n \). The **dual space** of a vector space consists of **linear functionals**—functions that map vectors to scalars.

#### Motivation for the Dual Basis

A key operation in vector spaces is breaking down vectors into components. Similarly, in function spaces, we use **linear functionals** to break down functions into simpler components. These functionals help extract specific information, such as derivatives or values at certain points, allowing us to express complex objects more simply.

#### **Formal Definition of a Dual Space**

Given a vector space \( V \), its **dual space** \( V^* \) consists of linear functionals, which map vectors to scalars. For a functional \( \phi \in V^* \), the following holds for all \( v, w \in V \) and scalars \( \alpha \):

\[
\phi(v + w) = \phi(v) + \phi(w), \quad \phi(\alpha v) = \alpha \phi(v)
\]

For example, in \( \mathbb{R}^n \), a linear functional could be a dot product with another vector.

#### **The Dual Basis**

For a basis \( \{e_1, e_2, \dots, e_n\} \) in \( V \), the dual space \( V^* \) has a **dual basis** \( \{e^1, e^2, \dots, e^n\} \), where each \( e^i \) is a functional that selects specific components of vectors in \( V \).

#### **Dual Spaces for Function Spaces**

In function spaces, the dual space includes functionals that map functions to scalars. Examples include:
- **Evaluation functionals**: \( \phi_a(f) = f(a) \), which returns the function value at \( a \).
- **Differentiation functionals**: These functionals return the derivative of a function at a given point.

### **Using Dual Spaces to Derive Key Formulas**

The concept of dual spaces helps derive key formulas like **Taylor series**, **Fourier series**, and **interpolation formulas**. These formulas represent functions as sums of simpler components, derived using dual bases.

#### 1.**Taylor Series**

The **Taylor series** of a function \( f(x) \) about \( 0 \) is a decomposition using the monomial basis \( \{1, x, x^2, \dots\} \). So, we want to find a linear functional that sends each

\[
\begin{cases}
e_k(x^k) = 1
\\
e_k(x^j) = 0 \quad \text{if } k \neq j
\end{cases}
\]

Let's think about this. How can we "delete" other terms with a linear functional so that only the basis monomial with the same index remains? Well, starting by the constant term, this is quite easy. We simply evaluate the function at \( 0 \), which makes all the non-zero powers terms vanish. In other words, \( e_0 \) is simply the evaluation functional at \( 0 \): 

\[
e_0(f) = f(0)
\]

For the other terms, it's not so clear. However, remember that the *derivative* is also a linear operator, so maybe we can apply that!

\[
\begin{cases}
D(x^k) = kx^{k-1}
\\
D(1) = 0
\end{cases}
\]

Hold on, that's perfect! All powers shift down by one, which makes the previous constant disappear, and the previously first power becomes the new constant term. So, we can just use the evaluation functional at \( 0 \) again:

\[
\begin{cases}
D|_0(x^k) = 0 \quad \text{if } k \neq 1
\\
D|_0(1) = 1
\end{cases}
\]

That's it, right? We repeat this process for other powers. But then, we run into a small issue.

\[
\begin{cases}
D^2|_0(x^k) = 0 \quad \text{if } k \neq 2
\\
D^2|_0(x^2) = 2
\end{cases}
\]

And

\[
\begin{cases}
D^3|_0(x^k) = 0 \quad \text{if } k \neq 3
\\
D^3|_0(x^3) = 3 \cdot 2
\end{cases}
\]

So it turns out, we are left with a factorial term. That's easy to fix, we just divide the \( k \)-th coefficient by \( k! \). So, we finally have our dual basis: for \( e_k = x^k \), we correspondingly have:

\[
e^k := \frac{1}{k!} D^k|_0
\]

Guess what: that's exactly the Taylor series! In general, if we use the standard monomial basis shifted by \( a \), we finally get the expansion:

\[
\begin{aligned}
f(x)
&= \sum_{n=0}^{\infty} e^n(e_n)
\\
&= \sum_{n=0}^{\infty} \frac{1}{n!} D^n|_a(x - a)^n
\\
&= \sum_{n=0}^{\infty} \frac{f^{(n)}(a)}{n!} (x - a)^n
\end{aligned}
\]

This logic can be applied to several other examples.

#### **2. Fourier Series: Decomposition via Orthogonal Dual Bases**

In contrast to the Taylor series, the **Fourier series** uses an orthogonal basis consisting of sine and cosine functions (or complex exponentials \( e^{inx} \)).

##### **Step-by-Step Derivation Using Orthogonal Dual Bases**

1. **The basis functions**: The Fourier basis is formed by the functions \( \cos(nx) \) and \( \sin(nx) \) (or equivalently \( e^{inx} \) for complex form). These functions are orthogonal with respect to the inner product:

\[
\langle f, g \rangle = \int_0^{2\pi} f(x) g(x) \, dx
\]

Don't worry too much about the details, but the idea is that the inner product is a measure of how similar two functions are. It is a generalization of the dot product.

2. **The dual functionals**: The dual basis is defined via the orthogonality of sine and cosine functions. The projection of \( f(x) \) onto these basis functions gives us the Fourier coefficients. Specifically, for a periodic function \( f(x) \), the dual functional \( \phi_n \) for each \( n \) is:

\[
\phi_n(f) = \frac{1}{\pi} \int_0^{2\pi} f(x) \cos(nx) \, dx, \quad \psi_n(f) = \frac{1}{\pi} \int_0^{2\pi} f(x) \sin(nx) \, dx
\]

These functionals extract the Fourier coefficients \( a_n \) and \( b_n \) by projecting \( f(x) \) onto the orthogonal basis functions \( \cos(nx) \) and \( \sin(nx) \).

3. **The expansion**: The function \( f(x) \) is then written as:

\[
f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty} \left( a_n \cos(nx) + b_n \sin(nx) \right)
\]

This is the **Fourier series**—a decomposition of \( f(x) \) using an orthogonal basis, where the coefficients are found by projecting onto the dual basis via inner products.

#### **3. Lagrange Interpolation Formula: Exact Fit at Points**

Another powerful tool for approximating a function is **Lagrange interpolation**, which provides an exact fit for a function based on its values at specific points.

Suppose we know the values of a function \( f(x) \) at \( n + 1 \) distinct points \( x_0, x_1, \dots, x_n \). The Lagrange interpolation formula gives us a polynomial \( P(x) \) of degree at most \( n \) that passes through all these points. The formula is:

\[
P(x) = \sum_{i=0}^{n} f(x_i) \ell_i(x)
\]

where the **Lagrange basis polynomials** \( \ell_i(x) \) are defined as:

\[
\ell_i(x) = \prod_{\substack{0 \le j \le n \\ j \neq i}} \frac{x - x_j}{x_i - x_j}
\]

Each \( \ell_i(x) \) is constructed so that it equals 1 at \( x = x_i \) and 0 at the other interpolation points \( x_j \), making it a suitable non-orthogonal basis for interpolation.

#### **4. Newton’s Finite Difference Formula: Using Successive Differences**

Another way to perform interpolation, particularly useful for **equally spaced** points, is **Newton’s finite difference formula**. This method is based on the idea of approximating a function using **finite differences** between successive points.

The **Newton interpolation polynomial** is:

\[
P(x) = f(x_0) + \Delta f(x_0)(x - x_0) + \frac{\Delta^2 f(x_0)}{2!}(x - x_0)(x - x_1) + \dots
\]

Here, \( \Delta f(x_0) \) represents the first finite difference, \( \Delta^2 f(x_0) \) is the second finite difference, and so on. This method is particularly well-suited for computational purposes, as it is more efficient when data points are equally spaced.

##### **Dual Basis in Finite Differences**

In Newton’s method, the successive finite differences \( \Delta f(x_i) \) play a role similar to the derivatives in Taylor’s series. The basis functions are constructed from products of \( (x - x_0), (x - x_1), \dots \), and again, these form a **non-orthogonal basis** for representing the function based on known data.

---

## Differential equations

The linear algebra perspective offers great insight into differential equations. For instance, a common example is spectral theory being applied to the **Sturm-Liouville problem**, which is a system of differential equations that arise in many areas of science and engineering. In particular, the heat and harmonic oscillator equations are a classic example of a Sturm-Liouville problem.

\[
\frac{d^2 u}{dx^2} = \lambda u
\]

This illustrates that the solution to the heat equation is a **linear combination** of eigenfunctions \( u(x) = \sum_{\lambda \in \Lambda} c_\lambda e^{\lambda x} \), where \( \Lambda \) is the set of eigenvalues and \( c_\lambda \) are the corresponding eigenfunctions. For instance, \( e^kx \), \( e^ikx \), \( sin kx \), \( cos kx \), \( cosh kx \), and \( sinh kx \) are all eigenfunctions of the second derivative.

Some very important tools for solving differential equations which also have reach beyond it are the **Fourier transform** and **Laplace transform**.

Here's a condensed and more abstract version of the section, incorporating the linear algebra perspective on the Fourier and Laplace transforms:

---

## Differential Equations and Linear Algebra

Viewing differential equations through the lens of **linear algebra** offers profound insights, particularly in how **spectral theory** applies to systems like the **Sturm-Liouville problem**. A simple example is the heat equation:

\[
\frac{d^2 u}{dx^2} = \lambda u
\]

The solution is a **linear combination** of eigenfunctions, \( u(x) = \sum_{\lambda} c_\lambda e^{\lambda x} \), where \( \lambda \) are eigenvalues. Eigenfunctions such as \( e^{kx} \), \( e^{ikx} \), \( \sin(kx) \), and \( \cos(kx) \) are solutions of the second derivative, which forms the foundation for powerful tools like the **Fourier** and **Laplace transforms**.

### Fourier and Laplace Transforms as Linear Operators

Both the Fourier and Laplace transforms can be analyzed as **linear operators** on function spaces, much like matrices act on vectors in finite-dimensional spaces.

#### Fourier Transform

The Fourier transform \( \mathcal{F} \) of a function \( f(x) \), is defined as:

\[
\mathcal{F}[f(x)] = \hat{f}(k) = \int_{-\infty}^{\infty} f(x) e^{-2\pi ikx} \, dx
\]

In the **linear algebra** framework, we treat functions like vectors in a vector space (e.g., \( L^2(\mathbb{R}) \)), and \( \mathcal{F} \) as a **linear map** between function spaces. This operator exhibits **linearity**:

\[
\mathcal{F}[\alpha f(x) + g(x)] = \alpha \hat{f}(k) + \hat{g}(k)
\]

Furthermore, the **inverse Fourier transform** \( \mathcal{F}^{-1} \) has an elegant relation with the Fourier transform: \( \mathcal{F}^{-1} = \mathcal{F} R = R \mathcal{F} \), where \( R \) is the **flip operator** defined by \( (Rf)(x) = f(-x) \). This symmetry makes the Fourier transform convenient, as it is almost self-inverting! And it turns out that applying it makes many problems much easier, from solving differential equations to taking faster convolutions.

#### Laplace Transform

The Laplace transform \( \mathcal{L} \), another linear operator, maps a function \( f(t) \) from the time domain to the complex frequency domain:

\[
\mathcal{L}[f(t)] = F(s) = \int_0^\infty f(t) e^{-st} \, dt
\]

This transform also satisfies the linearity property:

\[
\mathcal{L}[\alpha f(t) + g(t)] = \alpha F(s) + G(s)
\]

It operates on functions of exponential growth and converts differential operators into algebraic expressions.

Note that we can consider the bidirectional Laplace transform (from \( -\infty \) to \( \infty \)) as a generalized version of the Fourier transform. In practice, we use bounds \( 0 \) and \( \infty \) because it simplifies better.

### Why Transforms Simplify Differential Equations

Both transforms simplify the action of differentiation:

- **Fourier transform** of a derivative:

\[
\mathcal{F}\left[\frac{d^n}{dx^n} f(x)\right] = (2\pi i k)^n \hat{f}(k)
\]

This result shows that differentiation in the time/space domain becomes **multiplication** by \( (2\pi i k)^n \) in the frequency domain. As \( e^{2\pi ikx} \) are eigenfunctions of the derivative operator, the Fourier transform effectively diagonalizes differentiation!

- **Laplace transform** of a derivative:

\[
\mathcal{L}\left[\frac{d}{dt} f(t)\right] = s F(s) - f(0)
\]

Here, differentiation in the time domain translates to multiplication by \( s \) in the Laplace domain, with initial conditions handled directly.

Of course, the linearity property of these operators is absolutely crucial, otherwise we wouldn't be able to simplify much. This transformation of differentiation into multiplication simplifies differential equations into algebraic ones, making them easier to solve. For example:

#### Example: Heat Equation via Fourier Transform

The heat equation \( \frac{\partial u}{\partial t} = \alpha \frac{\partial^2 u}{\partial x^2} \), under Fourier transform, becomes:

\[
\frac{\partial \hat{u}(k, t)}{\partial t} = -\alpha (2\pi k)^2 \hat{u}(k, t)
\]

This is a simple ODE in \( t \), solvable as:

\[
\hat{u}(k, t) = \hat{u}(k, 0) e^{-\alpha (2\pi k)^2 t}
\]

Returning to the original space via inverse Fourier transform gives the solution in terms of the initial condition.

#### Example 2: Solving a Differential Equation Using Laplace Transform

Consider the damped harmonic oscillator:

\[
m \frac{d^2 x(t)}{dt^2} + c \frac{dx(t)}{dt} + kx(t) = 0
\]

1. **Laplace Transform the ODE**: Applying the Laplace transform:

   \[
   m(s^2 X(s) - sx(0) - v(0)) + c(s X(s) - x(0)) + kX(s) = 0
   \]

2. **Solve for \( X(s) \)**:

   \[
   X(s) = \frac{msx(0) + mv(0) + cx(0)}{ms^2 + cs + k}
   \]

3. **Inverse Laplace Transform**: Use the inverse Laplace transform to find \( x(t) \). This often involves partial fraction decomposition and looking up standard Laplace transform pairs, which is certainly easier than solving the ODE directly.