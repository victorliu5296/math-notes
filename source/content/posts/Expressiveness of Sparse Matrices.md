---
title: 'Expressiveness of Sparse Matrices'
date: 2024-09-08T21:54:38-04:00
math: katex
categories: [Linear Algebra, Machine Learning]
tags: [Matrix, Sparse Matrix, Expressiveness, Machine Learning, Deep Learning, Computational Efficiency]
weight: 100
draft: false
---

### Overview
Sparse matrices, despite having many zero entries, can be as expressive as dense matrices. By leveraging their high rank and structured non-zero elements, sparse matrices preserve accuracy while improving computational efficiency, interpretability, and generalization in machine learning models.

This leads to more efficient, interpretable, and generalizable models, as sparse representations reduce computational complexity while maintaining or even enhancing model performance, forcing the models to use parameters "correctly" and avoiding overfitting by creating too much noise in their representations.

## The Expressiveness of Sparse Matrices in Machine Learning

### 1. **Introduction**

In the realm of machine learning, we often encounter large, complex models with millions or even billions of parameters. These models typically use dense matrices for their weight representations. However, an intriguing alternative has gained traction: sparse matrices. Despite having many zero entries, sparse matrices can be just as expressive as their dense counterparts, offering advantages in efficiency, interpretability, and generalization.

### 2. Key Properties of Sparse Matrices:
1. High Rank: The rank of a matrix is the number of linearly independent rows or columns. A high-rank sparse matrix can capture complex relationships despite having many zero entries.
2. Structured Non-Zero Elements: The pattern and values of non-zero elements in a sparse matrix can encode important information efficiently.
3. Computational Efficiency: Sparse matrices require less storage and allow for faster computations compared to dense matrices of the same size.

### 3. **Theoretical Motivation: Expressiveness of Sparse Matrices**

It's not that hard to convince yourself that sparse matrices can be cheaper to compute than dense matrices. But can they truly be as expressive?

The expressiveness of sparse matrices stems from their ability to capture essential patterns and relationships in data without the need for every element to be non-zero. This is analogous to how the human brain works - not every neuron fires for every task, yet our brains are incredibly powerful and efficient.

In a more theoretical context, sparse matrices, despite having many zero entries, can still have high rank, meaning they can span a large dimensional space. The rank of a matrix is determined by its linearly independent rows or columns, not by how many non-zero entries it contains. A sparse matrix with a well-chosen structure can maintain or even enhance the model's expressive power while using far fewer parameters than its dense counterpart.

Well, that's what they all say. How is this possible, how do we make sense of it? Seemingly, with less numbers, you would have less information, right?

Wrong, fortunately!

#### The Power of Change of Basis in Sparse Matrices

At first glance, sparse matrices seem to contain less information due to their many zero entries. However, their power lies in the concept of **change of basis**. This transformation projects data into a new coordinate system—often high-dimensional—where relationships between inputs and outputs become more apparent, allowing for sparser representations.

#### Embedding Layer: A Pseudo-Change of Basis

In neural networks, embedding layers perform a "pseudo-change of basis" by projecting inputs into high-dimensional spaces. This is not a strict mathematical change of basis, as they often have to first encode the input space (which is often not a vector space) into a high-dimensional mathematical space expressible with numbers. The process works as follows:

1. An embedding layer \( E \) (a mathematical transformation) projects input data into a "friendly space", often high-dimensional, once at the network's start.
2. A sparse, cheaper weight matrix \( W_{\text{cheap}} \) operates in this new space throughout the network. 
3. The embedding is reversed at the network's end.

This approach allows for efficient computation, as the complex embedding is applied only twice (at input and output), while the simpler sparse matrix is used a LOT of times in intermediate layers, especially in modern deep learning models where compute is the hard carrier.

This approach demystifies architectures like BitNet, where embedding layers handle the heavy lifting, making sparse weight matrices viable without sacrificing expressiveness. The idea is analogous to common mathematical strategies like switching to polar coordinates to simplify problems involving circular objects, where changing the coordinate system makes the underlying structure easier to work with.

Let's see some concrete and analytical examples to gain some intuition.

### 4. Concrete Examples: Sparse Matrices in Action

#### Example 1: **Diagonalizing a Matrix**

For the second example, let’s demonstrate the process of **diagonalizing** a matrix, which involves finding a new basis where the matrix becomes diagonal—and potentially sparse. Practically, matrices are not always diagonalizable or it is very hard to do so, but it is useful for illustration of sparsity.

#### Original Dense Matrix:

Consider the following dense matrix:

\[
A = \begin{bmatrix}
6 & 2 \\
2 & 3
\end{bmatrix}
\]

This matrix is symmetric, so it can be diagonalized by finding an appropriate change of basis through its eigenvectors.

#### Step 1: Find the Eigenvalues

To diagonalize the matrix, we first compute the eigenvalues by solving the characteristic equation:

\[
\text{det}(A - \lambda I) = 0
\]

where \( \lambda \) is the eigenvalue, and \( I \) is the identity matrix.

\[
\text{det} \begin{bmatrix}
6 - \lambda & 2 \\
2 & 3 - \lambda
\end{bmatrix} = 0
\]

This simplifies to:

\[
(6 - \lambda)(3 - \lambda) - (2)(2) = 0
\]

\[
\lambda^2 - 9\lambda + 14 = 0
\]

Solving this quadratic equation gives the eigenvalues:

\[
\lambda_1 = 7, \quad \lambda_2 = 2
\]

#### Step 2: Find the Eigenvectors

Next, we find the eigenvectors corresponding to each eigenvalue. For \( \lambda_1 = 7 \):

\[
A - 7I = \begin{bmatrix}
6 - 7 & 2 \\
2 & 3 - 7
\end{bmatrix} = \begin{bmatrix}
-1 & 2 \\
2 & -4
\end{bmatrix}
\]

Solving \( (A - 7I) \vec{v} = 0 \), we get the eigenvector:

\[
\vec{v}_1 = \begin{bmatrix}
2 \\
1
\end{bmatrix}
\]

For \( \lambda_2 = 2 \):

\[
A - 2I = \begin{bmatrix}
6 - 2 & 2 \\
2 & 3 - 2
\end{bmatrix} = \begin{bmatrix}
4 & 2 \\
2 & 1
\end{bmatrix}
\]

Solving \( (A - 2I) \vec{v} = 0 \), we get the eigenvector:

\[
\vec{v}_2 = \begin{bmatrix}
1 \\
-2
\end{bmatrix}
\]

#### Step 3: Diagonalize the Matrix

The eigenvectors form the **change of basis** matrix:

\[
P = \begin{bmatrix}
2 & 1 \\
1 & -2
\end{bmatrix}
\]

The diagonal matrix \( D \), which represents the matrix \( A \) in the new basis, is constructed from the eigenvalues:

\[
D = \begin{bmatrix}
7 & 0 \\
0 & 2
\end{bmatrix}
\]

Thus, \( A \) is diagonalized as:

\[
A = P D P^{-1}
\]

#### Sparsity in the Diagonal Matrix:

In the new basis, we can interpret the \( P \) matrix as a **change of basis** linear transformation that serves as an embedding layer. Then, the "weight matrix" \( D \) is diagonal, and it is much simpler to work with than the original dense matrix. Moreover, it is **sparse** because it contains zeros everywhere except along the diagonal. 

As a brief side note: in math, this diagonalization process is usually used because applying powers of \( A \) gives 

\[
A^n = P D P^{-1} P D P^{-1} ... = P D^n P^{-1}
\]

So we only need to calculate powers of the diagonal matrix \( D \). A diagonal structure allows for more efficient computations, as only the diagonal elements need to be considered.

#### Example 2: **Simplifying a 2D Rotation in Polar Coordinates**

Next, I've mentioned that converting coordinates from Cartesian to polar is a common problem-solving strategy, and can simplify many problems involving circular objects or motion. This includes rotation!

We can express rotations in 2D using a matrix in Cartesian coordinates as follows:

\[
R_{\text{cart}}(\theta) = \begin{bmatrix}
\cos(\theta) & -\sin(\theta) \\
\sin(\theta) & \cos(\theta)
\end{bmatrix}
\]

So, if we convert a rotation to polar coordinates, it should be much simpler to work with, right? Indeed, it should allow us to only do the dirty work once and the do the rest of the computation very easily. However, a problem unfortunately arises when we try to do so. Consider what a 2D rotation of \( \Delta \theta \) does under polar coordinates \( (r, \theta) \):

\[
R_{\text{polar}}: \left (\begin{bmatrix} r \\ \theta \end{bmatrix}, \Delta \theta \right) \mapsto \begin{bmatrix} r \\ \theta + \Delta \theta \end{bmatrix}
\]

Looking carefully at its form, we notice that this is an affine transformation which unfortunately cannot be defined by a linear transformation (e.g. the origin does not map to itself), therefore we cannot express it as a 2D matrix.

Luckily for us, there is a workaround! Here comes our notion of **pseudo-change of basis**: we use an up-projection to increase the dimensionality of the input space.

\[
E_{\text{up}}: \begin{bmatrix} r \\ \theta \end{bmatrix} \mapsto \begin{bmatrix} r \\ \theta \\ 1 \end{bmatrix}
\]

And conversely,

\[
E_{\text{down}}: \begin{bmatrix} r \\ \theta \\ 1 \end{bmatrix} \mapsto \begin{bmatrix} r \\ \theta \end{bmatrix}
\]

This seems totally arbitrary and useless until you realize that we can now encode 2D affine transformations in a 3D matrix! Let's see how this works:

\[
R(\Delta \theta) := \begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & \Delta \theta \\
0 & 0 & 1
\end{bmatrix}
\]

So 

\[
R(\Delta \theta) \left( E_{\text{up}} \begin{bmatrix} r \\ \theta \end{bmatrix} \right) = \begin{bmatrix} 1 & 0 & 0 \\ 0 & 1 & \Delta \theta \\ 0 & 0 & 1 \end{bmatrix} \begin{bmatrix} r \\ \theta \\ 1 \end{bmatrix} = \begin{bmatrix} r \\ \theta + \Delta \theta \\ 1 \end{bmatrix}
\]

This is exactly what we wanted! So by using an up-projection, we can encode a 2D affine transformation in a 3D matrix, which is much more expressive than a 2D matrix. And we therefore end up with a much simpler matrix that is much sparser and easier to work with.

Our final formula is:

\[
R_{\text{polar}}\left(\begin{bmatrix} r \\ \theta \end{bmatrix}, \Delta \theta \right) = E_{\text{down}} R(\Delta \theta) E_{\text{up}} \begin{bmatrix} r \\ \theta \end{bmatrix}
\]

so we see that

\[
R_{\text{polar}}(\Delta \theta) = E_{\text{down}} \circ R(\Delta \theta) \circ E_{\text{up}}
\]

where \( E_{\text{up}} \) and \( E_{\text{down}} \) are seen as an upward and downward embedding projection, respectively, and \( \circ \) denotes function composition. \( R(\Delta \theta) \) is the 3D affine transformation in homogeneous coordinates defined earlier.

This trick is actually used often in graphics programming, and is called **homogeneous coordinates**.

#### 2. **Sparse Neural Networks**
Sparse neural networks are a prominent example of the power of sparse matrices. In deep learning, neural networks are traditionally represented by dense weight matrices that connect every neuron in one layer to every neuron in the next. However, research has shown that large neural networks can be sparsified, either by **pruning** (removing weights post-training) or by **sparse initialization**, without significantly reducing performance.

For example, consider a fully connected layer in a neural network where the weight matrix \(W_{\text{dense}}\) looks like this:

\[
W_{\text{dense}} = \left[\begin{matrix} 0.7 & 0.1 & 0.5 \\ 0.3 & 0.2 & 0.4 \\ 0.6 & 0.9 & 0.8 \end{matrix}\right]
\]

After pruning, we might end up with a sparse version:

\[
W_{\text{sparse}} = \left[\begin{matrix} 0.7 & 0 & 0.5 \\ 0 & 0.2 & 0 \\ 0.6 & 0 & 0.8 \end{matrix}\right]
\]

Despite having fewer active parameters, the sparse matrix often retains the essential structure, leading to nearly identical performance with far less computation. Techniques like the [Lottery Ticket Hypothesis](/math-notes/posts/lottery-ticket-hypothesis/) suggest that sparse subnetworks (like \(W_{\text{sparse}}\)) within dense networks are responsible for the model's success, furthoer highlighting the expressiveness of sparse matrices.

#### 5. **Compressed Sensing and Signal Reconstruction**

In signal processing, sparse matrices are central to **compressed sensing**, which allows the reconstruction of high-dimensional signals from a small set of measurements. 

Many signals are sparse in certain domains, and sparse matrices efficiently capture these signals' key features while ignoring unnecessary data. 

This concept is widely used in image compression, where sparse representations can capture the most important details (e.g., edges) while reducing storage needs.

### 6. **Hardware Efficiency of Sparse Matrices**

While sparse matrices can theoretically reduce computation and memory usage, the actual performance gains heavily depend on hardware optimization. Sparse matrix operations often face challenges such as irregular memory access patterns and overhead from storing non-zero element indices, which can negate the computational savings, especially if sparsity is low or matrices are small. Additionally, many hardware architectures, like CPUs and GPUs, are optimized for dense matrix operations, making it difficult to achieve significant speed-ups with sparse matrices.

To address these issues, modern hardware optimizations have emerged:
- GPUs and TPUs supporting structured sparsity
- Custom hardware like FPGAs and ASICs
- Software libraries offering sparse BLAS routines

### 7. **Conclusion**

Sparse matrices are overpowered in machine learning, being able to have high rank (hence similar expressiveness to dense matrices) while being cheaper to compute. We need to research them more to fully exploit their potential! 