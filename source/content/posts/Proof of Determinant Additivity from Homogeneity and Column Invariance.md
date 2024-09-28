---
title: 'Proof of Determinant Additivity From Homogeneity and Column Invariance'
date: 2024-09-28T09:40:25-04:00
math: katex
summary: "A proof of the additivity of determinants from homogeneity and invariance under linear combinations of other columns."
categories:
  - Linear Algebra
tags:
  - Determinant
  - Homogeneity
  - Column Invariance
  - Linear Combination
  - Additivity
  - Linearity
weight: 100
draft: false
---

I am reading through the book "Linear Algebra Done Wrong" by Sergei Treil. On page 77, it is mentioned that the although the columnwise additivity of the determinant is natural using its intuitive "volume of a parallelepiped" interpretation, it can be proven using the two other properties presented: argumentwise homogeneity of degree 1 and invariance under addition of linear combinations of other columns.

I found that fact quite interesting and especially unintuitive, so I decided that it would be worth writing a post about it.

---

To show that the determinant being additive per column follows from being homogeneous of degree 1 per column and invariant under adding linear combinations of other columns, we'll proceed step by step.

**Definitions:**

- **Homogeneous Degree 1 Per Column:** For any scalar \(\lambda\) and any column \(c_i\) of a matrix \(A\), the determinant satisfies
  \[
  D(\ldots, \lambda c_i, \ldots) = \lambda D(\ldots, c_i, \ldots).
  \]
- **Invariance Under Adding Linear Combinations of Other Columns:** For any scalar \(\alpha\) and any columns \(c_i\) and \(c_j\) (with \(i \neq j\)),
  \[
  D(\ldots, c_i + \alpha c_j, \ldots) = D(\ldots, c_i, \ldots).
  \]
  
Our goal is to prove that for any columns \(c_i\) and \(c_i'\),
\[
D(\ldots, c_i + c_i', \ldots) = D(\ldots, c_i, \ldots) + D(\ldots, c_i', \ldots).
\]

**Proof:**

1. **Understand the Function \(f(c_i)\):**

   Let’s define \(f(c_i) = D(c_1, \ldots, c_i, \ldots, c_n)\), where all columns except \(c_i\) are fixed.

2. **Identify the Subspace \(V\):**

   Let \(V\) be the vector space spanned by all columns except \(c_i\):
   \[
   V = \text{span}\{c_j : j \neq i\}.
   \]

3. **Determine the Behavior of \(f(c_i)\) on \(V\):**

   - **Invariance Property:** Since adding any linear combination of other columns to \(c_i\) doesn't change the determinant, we have
     \[
     f(c_i + v) = f(c_i) \quad \text{for all } v \in V.
     \]
   - This implies that \(f(c_i)\) is constant on cosets of \(V\); that is, \(f\) depends only on the equivalence class \(c_i + V\) in the quotient space \(\mathbb{R}^n / V\).

4. **Analyze the Quotient Space \(\mathbb{R}^n / V\):**

   - Since \(V\) has dimension \(n - 1\), the quotient space \(\mathbb{R}^n / V\) is one-dimensional.
   - Any vector in \(\mathbb{R}^n / V\) can be represented as \(k [v]\), where \([v]\) is a basis vector of \(\mathbb{R}^n / V\) and \(k \in \mathbb{R}\).

5. **Establish Linearity in the Quotient Space:**

   - **Homogeneity Property:** The determinant being homogeneous of degree 1 per column implies that \(f\) is homogeneous of degree 1 in \(\mathbb{R}^n / V\):
     \[
     f(\lambda c_i) = \lambda f(c_i).
     \]
   - In a one-dimensional space, any homogeneous degree 1 function is linear. A proof of this fact is provided in the next section.

6. **Conclude Additivity:**

   - Since \(f\) is linear on \(\mathbb{R}^n / V\), for any vectors \(c_i\) and \(c_i'\),
     \[
     f(c_i + c_i') = f(c_i) + f(c_i').
     \]
   - Therefore, the determinant is additive per column:
     \[
     D(\ldots, c_i + c_i', \ldots) = D(\ldots, c_i, \ldots) + D(\ldots, c_i', \ldots).
     \]

**Answer:** Because these properties imply linearity per column: the determinant becomes a linear function on a one-dimensional space (modulo the other columns), so additivity follows from homogeneity and invariance under adding combinations of other columns.

### Proof of Linearity in One Dimensional Space

**Definitions Recap:**

- **Homogeneous Function of Degree 1:** A function \( f: V \rightarrow \mathbb{R} \) (or \( \mathbb{C} \)) is homogeneous of degree 1 if for all scalars \( \lambda \) and vectors \( v \in V \):
  \[
  f(\lambda v) = \lambda f(v).
  \]
  
- **Linear Function:** A function \( f: V \rightarrow \mathbb{R} \) is linear if it satisfies both:
  - **Homogeneity:** \( f(\lambda v) = \lambda f(v) \) for all \( \lambda \in \mathbb{R}, v \in V \).
  - **Additivity:** \( f(v + w) = f(v) + f(w) \) for all \( v, w \in V \).

Our goal is to show that in a one-dimensional vector space, any homogeneous function of degree 1 is also additive, and therefore linear.

**Proof:**

1. **Set Up the One-Dimensional Space:**

   - Let \( V \) be a one-dimensional vector space over \( \mathbb{R} \).
   - Choose a non-zero vector \( v_0 \) in \( V \) as a basis. Every vector \( v \in V \) can be uniquely expressed as:
     \[
     v = k v_0, \quad \text{for some } k \in \mathbb{R}.
     \]

2. **Define the Homogeneous Function:**

   - Let \( f: V \rightarrow \mathbb{R} \) be a function that is homogeneous of degree 1:
     \[
     f(\lambda v) = \lambda f(v), \quad \text{for all } \lambda \in \mathbb{R}, v \in V.
     \]
   - In particular, for any scalar \( k \):
     \[
     f(k v_0) = k f(v_0).
     \]

3. **Show Additivity:**

   - **Consider Two Vectors \( v \) and \( w \):**
     \[
     v = k v_0, \quad w = l v_0, \quad \text{for some } k, l \in \mathbb{R}.
     \]
   - **Compute \( f(v + w) \):**
     \[
     v + w = k v_0 + l v_0 = (k + l) v_0.
     \]
     Therefore,
     \[
     f(v + w) = f\left((k + l) v_0\right) = (k + l) f(v_0).
     \]
   - **Compute \( f(v) + f(w) \):**
     \[
     f(v) + f(w) = f(k v_0) + f(l v_0) = k f(v_0) + l f(v_0) = (k + l) f(v_0).
     \]
   - **Compare the Two Results:**
     \[
     f(v + w) = f(v) + f(w).
     \]
     Thus, \( f \) is additive.

4. **Conclude Linearity:**

   - Since \( f \) is both homogeneous of degree 1 and additive, it satisfies the properties of a linear function:
     \[
     f(\lambda v) = \lambda f(v) \quad \text{and} \quad f(v + w) = f(v) + f(w).
     \]
   - Therefore, in a one-dimensional vector space, any homogeneous function of degree 1 is linear.

**Implications for the Determinant:**

- Returning to the determinant function \( D \), when considering it as a function of a single column (with the other columns fixed), and recognizing that the space of possible columns modulo the space spanned by the other columns is one-dimensional, we can apply the above reasoning.
- Since \( D \) is homogeneous of degree 1 in that column and invariant under adding linear combinations of other columns, it behaves like a homogeneous degree 1 function on a one-dimensional space.
- Therefore, \( D \) is linear in that column, which implies additivity:
  \[
  D(\ldots, c_i + c_i', \ldots) = D(\ldots, c_i, \ldots) + D(\ldots, c_i', \ldots).
  \]

**Answer:**

Because in a one-dimensional space, any function that’s homogeneous of degree 1 must also be additive—homogeneity implies additivity in one dimension—so the function is linear; thus, the determinant becomes additive per column since it behaves like a linear (homogeneous and additive) function on that one-dimensional space.