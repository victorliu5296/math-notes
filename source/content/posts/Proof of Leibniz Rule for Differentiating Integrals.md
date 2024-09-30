---
title: 'Proof of Leibniz Rule for Differentiating Integrals'
date: 2024-09-29T20:22:31-04:00
summary: "A short proof of Leibniz rule for differentiating integrals with variable integration bounds."
math: katex
categories:
  - Calculus
tags:
  - Proof
  - Derivative
  - Leibniz Rule
  - Integral
  - Partial Derivative
weight: 100
draft: false
---

### Theorem. Leibniz Rule for Differentiating Integrals with Variable Integration Bounds

Let \( f(x, t) \) be a function such that:
- \( f(x, t) \) and its partial derivative \( \frac{\partial f}{\partial x}(x, t) \) are continuous on the region of interest.
- The functions \( a(x) \) and \( b(x) \) are differentiable with respect to \( x \), and for each \( x \), the integrals \( \int_{a(x)}^{b(x)} f(x, t) \, dt \) exist.

Then the derivative of the function
\[
F(x) = \int_{a(x)}^{b(x)} f(x, t) \, dt
\]
with respect to \( x \) is given by the formula:
\[
F'(x) = f(x, b(x)) \cdot b'(x) - f(x, a(x)) \cdot a'(x) + \int_{a(x)}^{b(x)} \frac{\partial f}{\partial x}(x, t) \, dt
\]

### Case 1: Constant Bounds

For constant bounds \( a \) and \( b \), we need to show:

\[
\frac{d}{dx} \left( \int_{a}^{b} f(x, t) \, dt \right) = \int_{a}^{b} \frac{\partial f}{\partial x}(x, t) \, dt
\]

Define \( F(x) = \int_{a}^{b} f(x, t) \, dt \). By the limit definition of the derivative:

\[
F'(x) = \lim_{h \to 0} \frac{F(x+h) - F(x)}{h} = \lim_{h \to 0} \frac{1}{h} \left( \int_{a}^{b} f(x+h, t) \, dt - \int_{a}^{b} f(x, t) \, dt \right)
\]

Since the bounds are constant, combine the integrals:

\[
F'(x) = \lim_{h \to 0} \frac{1}{h} \int_{a}^{b} \left( f(x+h, t) - f(x, t) \right) dt
\]

The difference quotient inside the integral:

\[
\frac{f(x+h, t) - f(x, t)}{h} \to \frac{\partial f}{\partial x}(x, t) \quad \text{as} \quad h \to 0
\]

Interchanging the limit and integral (justified by the continuity of \( f(x, t) \) and its partial derivative):

\[
F'(x) = \int_{a}^{b} \lim_{h \to 0} \frac{f(x+h, t) - f(x, t)}{h} \, dt = \int_{a}^{b} \frac{\partial f}{\partial x}(x, t) \, dt
\]

Thus, for constant bounds, we have:

\[
\frac{d}{dx} \left( \int_{a}^{b} f(x, t) \, dt \right) = \int_{a}^{b} \frac{\partial f}{\partial x}(x, t) \, dt
\]

### Case 2: Variable Bounds

Now consider the case where \( a(x) \) and \( b(x) \) are functions of \( x \). We want to compute:

\[
F(x) = \int_{a(x)}^{b(x)} f(x, t) \, dt
\]

We decompose this into two fixed-bound integrals:

\[
F(x) = \int_{c}^{b(x)} f(x, t) \, dt - \int_{c}^{a(x)} f(x, t) \, dt
\]

where \( c \) is a constant. Now, differentiate each integral using the chain rule and the Fundamental Theorem of Calculus.

Call the first integral \( F_{b(x)}(b(x), f(x, t)) \) and the second integral \( F_{a(x)}(a(x), f(x, t)) \). By the multivariable chain rule, we have:

\[
\frac{d}{dx} F_{b(x)}(b(x), f(x, t)) = \frac{\partial F}{\partial b} \cdot \frac{db}{dx} + \frac{\partial F}{\partial f} \cdot \frac{\partial f}{\partial x}
\]

and similarly for \( F_a(x) \).

To compute \( \frac{\partial F}{\partial b} \), we need to differentiate \( F_b(x) \) with respect to \( b \). Using the Fundamental Theorem of Calculus, we have:

\[
\frac{\partial F_{b(x)}}{\partial b(x)} = \frac{\partial}{b(x)} \left( \int_{c}^{b(x)} f(x, t) \, dt \right) = f(x, b(x)) \cdot b'(x)
\]

Notice that since \( f(x, t) \) is constant with respect to \( b(x) \), then the bounds of integration \( c \) and \( b(x) \) are constant with respect to it. Thus, the Leibniz Rule for constant bounds applies.

\[
\frac{\partial F}{\partial f} = \frac{\partial}{\partial f} \left( \int_{c}^{b(x)} f(x, t) \, dt \right) = \int_{c}^{b(x)} \frac{\partial}{\partial f} f(x, t) \, dt = \int_{c}^{b(x)} 1 \, dt
\]

1. **First integral: \( \int_{c}^{b(x)} f(x, t) \, dt \)**

Putting it all together:

\[
\frac{d}{dx} \left( \int_{c}^{b(x)} f(x, t) \, dt \right) = f(x, b(x)) \cdot b'(x) + \int_{c}^{b(x)} \frac{\partial f}{\partial x}(x, t) \, dt
\]

2. **Second integral: \( \int_{c}^{a(x)} f(x, t) \, dt \)**

Similarly, for the second integral:

\[
\frac{d}{dx} \left( \int_{c}^{a(x)} f(x, t) \, dt \right) = f(x, a(x)) \cdot a'(x) + \int_{c}^{a(x)} \frac{\partial f}{\partial x}(x, t) \, dt
\]

3. **Subtract the results**:

Now, subtract the derivative of the second integral from the derivative of the first:

\[
F'(x) = \left[ f(x, b(x)) \cdot b'(x) + \int_{c}^{b(x)} \frac{\partial f}{\partial x}(x, t) \, dt \right] - \left[ f(x, a(x)) \cdot a'(x) + \int_{c}^{a(x)} \frac{\partial f}{\partial x}(x, t) \, dt \right]
\]

Simplifying:

\[
F'(x) = f(x, b(x)) \cdot b'(x) - f(x, a(x)) \cdot a'(x) + \left( \int_{c}^{b(x)} \frac{\partial f}{\partial x}(x, t) \, dt - \int_{c}^{a(x)} \frac{\partial f}{\partial x}(x, t) \, dt \right)
\]

The difference of the two integrals can be combined into one:

\[
F'(x) = f(x, b(x)) \cdot b'(x) - f(x, a(x)) \cdot a'(x) + \int_{a(x)}^{b(x)} \frac{\partial f}{\partial x}(x, t) \, dt
\]

---

### **Clarification of Assumptions**:

In both the **constant bounds** and **variable bounds** cases, we assumed that the partial derivative \( \frac{\partial f}{\partial x}(x, t) \) is continuous. This is a **sufficient condition** for applying the rule, as it ensures that the limit of the difference quotient converges uniformly, allowing us to interchange the limit and the integral.

However, the Leibniz Rule still holds under weaker conditions. Specifically, the partial derivative \( \frac{\partial f}{\partial x}(x, t) \) does **not** need to be continuous. The key requirement is that the **limit of the difference quotient** can be interchanged with the integral.

More generally, the **interchange of the limit and the integral** (in this case, taking the derivative under the integral sign) is valid if:
- \( \frac{\partial f}{\partial x}(x, t) \) exists almost everywhere and is **absolutely integrable** on the interval \( [a(x), b(x)] \).
- Alternatively, **uniform convergence** or the **Dominated Convergence Theorem** can be used to justify bringing the limit inside the integral if there exists a dominating function that bounds the integrand.