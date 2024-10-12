---
title: 'Measurability of Random Variables'
date: 2024-10-11T22:30:45-04:00
summary: "Motivating the definition of measurability for random variables"
math: katex
categories:
  - Probability Theory
  - Measure Theory
tags:
  - Random Variables
  - Measurability
  - Sigma-Algebra
weight: 100
draft: false
---

### \( \mathcal{F} \)-Measurability and Examples

#### Motivation and Problem

Measurability is an essential concept in probability theory, particularly for defining random variables in a way that allows us to assign probabilities to events. For a random variable \( X \) to be useful in the context of a probability space \( (\Omega, \mathcal{F}, P) \), it needs to be compatible with the sigma-algebra \( \mathcal{F} \), which specifies which events (subsets of \( \Omega \)) can have assigned probabilities.

If a random variable \( X \) is **not** \( \mathcal{F} \)-measurable, it means that certain sets of real numbers that we care about (Borel sets) don't correspond to well-defined events in \( \Omega \) that we can measure. Without this compatibility, we can't calculate the probability of \( X \) taking values in a given set, rendering the random variable useless in a probabilistic setting.

#### A Negative Example: Non-\( \mathcal{F} \)-Measurable Random Variable

Let's consider a counterexample to highlight why this condition is important.

##### Setup:

1. **Sample space**: Let \( \Omega = [0, 1] \), the interval from 0 to 1.
2. **Sigma-algebra \( \mathcal{F} \)**: Let \( \mathcal{F} \) be the **trivial sigma-algebra**: 
   \[
   \mathcal{F} = \{\emptyset, \Omega\}
   \]
   This sigma-algebra contains only two sets: the empty set and the entire sample space \( \Omega \). This means we can only assign probabilities to these two events.
3. **Random variable \( X \)**: Define a function \( X: \Omega \to \mathbb{R} \) as follows:
   \[
   X(\omega) = \omega, \quad \text{for } \omega \in [0, 1]
   \]
   This is the identity function, so for each outcome \( \omega \in [0, 1] \), \( X(\omega) = \omega \). The random variable \( X \) takes every value in the interval \( [0, 1] \).

##### Checking \( \mathcal{F} \)-Measurability:

For \( X \) to be \( \mathcal{F} \)-measurable, we need to check that for every Borel set \( B \subseteq \mathbb{R} \), the preimage \( X^{-1}(B) \) belongs to \( \mathcal{F} \), meaning that the preimage must be either \( \emptyset \) or \( \Omega \).

Let’s consider specific Borel sets:

1. **Borel set \( B = [0, 0.5] \)**:
   - The preimage of \( B \) is:
     \[
     X^{-1}([0, 0.5]) = \{\omega \in [0, 1] : X(\omega) \in [0, 0.5]\} = [0, 0.5]
     \]
   - Is \( [0, 0.5] \in \mathcal{F} \)? No. The only sets in \( \mathcal{F} \) are \( \emptyset \) and \( \Omega \), but \( [0, 0.5] \) is neither of those.

2. **Borel set \( B = (0.7, 1] \)**:
   - The preimage is:
     \[
     X^{-1}((0.7, 1]) = \{\omega \in [0, 1] : X(\omega) \in (0.7, 1]\} = (0.7, 1]
     \]
   - Again, \( (0.7, 1] \notin \mathcal{F} \), because it’s not equal to \( \emptyset \) or \( \Omega \).

##### Conclusion: \( X \) is Not \( \mathcal{F} \)-Measurable

Since the preimages of these Borel sets are not elements of the sigma-algebra \( \mathcal{F} \), the random variable \( X \) is **not \( \mathcal{F} \)-measurable**. This means we cannot assign probabilities to events such as "the value of \( X \) lies in \( [0, 0.5] \)," which makes this random variable incompatible with the structure of the probability space.

#### Fixing the Problem: Restricting \( X \)

To make \( X \) \( \mathcal{F} \)-measurable, we need to redefine \( X \) so that its preimages are always either \( \emptyset \) or \( \Omega \), the only two sets in \( \mathcal{F} \).

##### New Random Variable \( X' \):

We can define a new, restricted random variable \( X': \Omega \to \mathbb{R} \) as:
\[
X'(\omega) =
\begin{cases}
1, & \text{if } \omega \in \Omega = [0, 1] \\
0, & \text{otherwise}
\end{cases}
\]

This makes \( X' \) a constant function that always takes the value 1 for all \( \omega \in [0, 1] \).

##### Checking \( \mathcal{F} \)-Measurability of \( X' \):

Now, let's verify if \( X' \) is \( \mathcal{F} \)-measurable:

1. **If \( 1 \in B \) (e.g., \( B = [1] \)):**
   - The preimage is:
     \[
     X'^{-1}(B) = \{\omega \in [0, 1] : X'(\omega) \in B\} = [0, 1] = \Omega
     \]
     - \( \Omega \in \mathcal{F} \), so this set is measurable.
   
2. **If \( 1 \notin B \) (e.g., \( B = [0.5] \)):**
   - The preimage is:
     \[
     X'^{-1}(B) = \emptyset
     \]
     - \( \emptyset \in \mathcal{F} \), so this set is measurable.

Since for every Borel set \( B \), the preimage is either \( \emptyset \) or \( \Omega \), we conclude that \( X' \) is \( \mathcal{F} \)-measurable.

#### Formal Definition of \( \mathcal{F} \)-Measurability:

A random variable \( X: \Omega \to \mathbb{R} \) is said to be **\( \mathcal{F} \)-measurable** if for every Borel set \( B \subseteq \mathbb{R} \), the **preimage** \( X^{-1}(B) = \{\omega \in \Omega : X(\omega) \in B\} \) is an element of the sigma-algebra \( \mathcal{F} \).

In other words, for \( X \) to be \( \mathcal{F} \)-measurable, the sets of outcomes that map to measurable sets in \( \mathbb{R} \) (Borel sets) must themselves be measurable events in the probability space \( (\Omega, \mathcal{F}, P) \).

#### Another Positive Example: \( \mathcal{F} \)-Measurable Random Variable

Let’s construct a more interesting example of a random variable that **is** \( \mathcal{F} \)-measurable.

##### Setup:

1. **Sample space**: Let \( \Omega = \{1, 2, 3\} \).
2. **Sigma-algebra \( \mathcal{F} \)**: Let \( \mathcal{F} = \{\emptyset, \{1\}, \{2, 3\}, \Omega\} \). This sigma-algebra allows us to assign probabilities to individual outcomes and the combined set \( \{2, 3\} \).
3. **Random variable \( X \)**: Define \( X: \Omega \to \mathbb{R} \) as:
   \[
   X(1) = 0, \quad X(2) = 1, \quad X(3) = 1
   \]
   So, \( X \) maps outcome 1 to 0, and both outcomes 2 and 3 to 1.

##### Checking \( \mathcal{F} \)-Measurability:

For \( X \) to be \( \mathcal{F} \)-measurable, the preimage of every Borel set \( B \subseteq \mathbb{R} \) must be an element of \( \mathcal{F} \).

1. **Borel set \( B = \{0\} \)**:
   - The preimage is:
     \[
     X^{-1}(\{0\}) = \{1\}
     \]
     - \( \{1\} \in \mathcal{F} \), so this set is measurable.
   
2. **Borel set \( B = \{1\} \)**:
   - The preimage is:
     \[
     X^{-1}(\{1\}) = \{2, 3\}
     \]
     - \( \{2, 3\} \in \mathcal{F} \), so this set is measurable.

Since for all Borel sets \( B \), the preimage \( X^{-1}(B) \) is in \( \mathcal{F} \), the random variable \( X \) is \( \mathcal{F} \)-measurable.

### Conclusion:

- We saw that in the negative example, a random variable \( X(\omega) = \omega \) defined on \( [0, 1] \) with the trivial sigma-algebra \( \mathcal{F} = \{\emptyset, \Omega\} \) was not \( \mathcal{F} \)-measurable because the preimages of many Borel sets were not in \( \mathcal{F} \).
- By restricting \( X \) to a constant value \( X'(\omega) = 1 \), we ensured that the preimages were either \( \emptyset \) or \( \Omega \), making \( X' \) \( \mathcal{F} \)-measurable.
- Finally, we provided a formal definition of \( \mathcal{F} \)-measurability and illustrated it with a positive example where \( X \) maps discrete outcomes in a finite probability space and is \( \mathcal{F} \)-measurable.