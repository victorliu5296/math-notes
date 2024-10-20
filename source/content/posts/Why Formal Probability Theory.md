---
title: 'Why Probability Theory'
date: 2024-10-18T19:23:51-04:00
summary: "The evolution of modern axiomatic probability theory based on measure theory, motivation for its development through its history and its applications on examples problems and paradoxes."
math: katex
categories:
  - Probability Theory
tags:
  - Formal Probability Theory
  - Axiomatic Probability
  - Measure Theoric Probability
weight: 49
draft: true
---

# Why Formal Probability Theory?

## Preface

Modern probability theory has a reputation for being extremely abstract. Unfortunately, textbooks often present very heavy axioms, definitions, and proofs from the get-go that are difficult to digest without prior knowledge. 

Probability theory has a rich history, with many famous mathematicians contributing to its development. Each aspect has been created to respond to a set of challenges, which, over time, accumulated to this great edifice we now call:

- Formal probability theory
- Measure-theoretic probability
- Modern axiomatic probability theory
- Or simply, probability theory

Yet, this historical context is often omitted, leading to a significant gap in motivation and causing confusion for many learners.

### Motivation

This blog post aims to fill this gap by providing a brief introduction to the foundations of modern probability and a surface-level overview of the concepts. We'll explore the evolution of probability theory, examining the problems and paradoxes that spurred its development. 

Starting from the very basics, we will adopt the Bayesian perspective of updating priors and gradually refine each definition. While encountering concrete problems that arise from our naive ones, we will build up to increasingly sophisticated and abstract concepts. By understanding the "why" behind the theory, these abstract concepts can hopefully become more accessible and meaningful.

This is not meant to be a comprehensive textbook on probability theory, but rather a brief introduction to the foundations of modern probability and a surface-level overview of the concepts. We are more interested in the intuition and motivation behind the theory than in a exhaustive treatment of all its intricacies.

### Prerequisites

This blog post assumes a basic understanding of probability, calculus and linear algebra. While it's not strictly required since I attempt to build ideas up from scratch, familiarity with these topics undoubtedly will be helpful as the concepts are introduced.

---

## Introduction

Let's start with a seemingly simple question: What's the probability of randomly selecting a number between $0$ and $1$ on the unit interval $[0,1]$?

Your first instinct might be to say it's $100\% = 1$, since we're certain to pick a number in this range. But what if I ask for the probability of picking exactly $0.5$? Or any specific number?

Suddenly, our intuitive understanding of probability starts to break down. There are infinitely many numbers between $0$ and $1$, so the probability of picking any specific one should be infinitesimally small. But if every individual probability is $0$, how can the total probability be $1$?

This paradox hints at the limitations of elementary probability theory and the need for a more robust framework. As we'll see, such questions led mathematicians to develop increasingly sophisticated tools, culminating in modern measure-theoretic probability.

## The Birth of Probability Theory: Gambling and Games of Chance

### From Dice to Mathematical Formulas

Probability theory has its roots in the analysis of games of chance. Let's start our exploration with a simple example:

Imagine rolling a fair six-sided die. What's the probability of rolling a 4?

Intuitively, we might reason:
1. There are six possible outcomes.
2. Only one of these outcomes is favorable (rolling a 4).
3. Therefore, the probability is 1/6.

This intuitive approach forms the basis of classic probability theory:

> #### Definition: Classic Probability.
> 
> Given an event $A$, the probability of $A$, denoted $P(A)$, is defined as:
> \[
> P(A) := \frac{\text{number of favorable outcomes}}{\text{total number of possible outcomes}}
> \]


### The Emergence of Combinatorics

As games became more complex, so did the mathematics needed to analyze them. Consider this problem:

You roll two dice. What's the probability of getting a sum of 7?

To solve this, we need to:
1. Count the total number of possible outcomes: $6 \times 6 = 36$
2. Count the favorable outcomes: $(1,6)$, $(2,5)$, $(3,4)$, $(4,3)$, $(5,2)$, $(6,1)$ - six in total
3. Apply our formula: $P(\text{sum of 7}) = \frac{6}{36} = \frac{1}{6}$

This approach works well for discrete problems with a finite number of outcomes. But what happens when we encounter infinity?

### The St. Petersburg Paradox

Probability theory quickly ran into philosophical and mathematical challenges that spurred its development. Let's explore a famous paradox that shook the foundations of probability theory:

The "St. Petersburg paradox," proposed by Nicolas Bernoulli in 1713, goes like this:

Imagine a casino game where a fair coin is tossed repeatedly until it lands on tails. The pot starts at $2 and doubles every time heads comes up. When the coin lands on tails, the game ends and you win the pot. How much would you pay to play this game?

Intuitively, most people would only pay a small amount. But if we calculate the expected value using elementary probability theory, we get:

$E = \frac{1}{2} \cdot 2\$ + \frac{1}{4} \cdot 4\$ + \frac{1}{8} \cdot 8\$ + ... = \$1 + \$1 + \$1 + ... = \infty$

This paradox challenged mathematicians to reconcile probability theory with real-world decision making, leading to concepts like utility theory and risk aversion.

---

## Challenges to Classical Probability: Infinite Sets and Continuous Distributions

### The Limitations of Ratios

Our simple ratio approach works well for finite sets of outcomes. But what happens when we deal with infinite sets or continuous distributions?

Let's revisit our opening question: What's the probability of randomly selecting a number between 0 and 1?

Using our classical approach, we might try:

$P(\text{selecting a number in [0,1]}) = \frac{\text{numbers in [0,1]}}{\text{numbers in [0,1]}} = \frac{\infty}{\infty}$

But this is meaningless! We can't divide infinity by infinity and expect a sensible result.

## Geometric Probability: A Step Towards Continuity

To tackle continuous probabilities, mathematicians developed the concept of geometric probability. Revisiting our original problem, we can define the probability of choosing any number between 0 and 1 as the ratio of their respective *lengths*:

$P(\text{choosing a number between 0 and 1}) = \frac{1}{1} = 1$

We can also find the probability of falling between $0$ and $0.5$:

$P(\text{choosing a number between 0 and 0.5}) = \frac{0.5}{1} = 0.5$

Similarly, this definition also works for any interval $[a,b]$ with $a < b$:

$P(\text{choosing a number between } a \text{ and } b) = \frac{b - a}{b - a} = 1$

So far so good, it's consistent with our original intuition. Let's further explore this with Buffon's Needle problem:

Imagine dropping a needle of length $L$ onto a floor with parallel lines spaced a distance $D$ apart (where $L \leq D$). What's the probability that the needle will cross one of the lines?

The solution involves calculus and geometric reasoning to arrive at a very beautiful result:

$P(\text{needle crosses a line}) = \frac{2L}{\pi D}$

This problem introduces the idea of using geometric measures (lengths, areas, volumes) to calculate probabilities in continuous spaces. 

> #### Definition: Geometric Probability.
>
> Given a region $A$, the probability of $A$, denoted $P(A)$, is defined as:
> \[
> P(A) := \frac{\text{size of } A}{\text{total size}}
> \]
> where size is length, area, or volume.

So far, this definition seems to be holding up pretty well for the infinite cases. But, unfortunately, it has its own limitations.

## The Need for a More Rigorous Foundation

While geometric probability provided a way to handle some continuous problems, it still had limitations. Consider Bertrand's Paradox:

Draw a chord at random on a circle. What's the probability that the chord is longer than the side of an equilateral triangle inscribed in the circle?

Surprisingly, this problem has three different solutions depending on how we interpret "at random":
1. Choose two random points on the circumference: Probability = 1/3
2. Choose a random radius and a random point on this radius: Probability = 1/2
3. Choose a random point inside the circle: Probability = 1/4

This paradox reveals that our intuitive notion of "randomness" isn't always well-defined in continuous spaces. It challenges us to think more carefully about what we mean by probability and how we should formalize it.

---

## The Bridge Between Discrete and Continuous: A New Perspective

As we've seen, both the counting approach for discrete probabilities and the geometric approach for continuous probabilities have their strengths and limitations. But what if we could find a unified framework that encompasses both? Let's first explore some intriguing examples that highlight the need for a more comprehensive approach.

### Limitations of Our Current Approaches

Our current methods treat discrete and continuous probabilities as entirely separate concepts. This disconnect becomes problematic when we encounter scenarios that don't fit neatly into either category, or even when we want to combine them.

Let's look at an example that challenges our current understanding:

### The Curious Case of Mixed Distributions

Consider a game where you flip a fair coin. If it's heads, you win \$10. If it's tails, you spin a wheel that gives you a random amount between \$0 and \$20.

How would you describe the probability distribution of your winnings? It's neither purely discrete nor purely continuous. There's a 50\% chance of winning exactly \$10 (discrete), and a 50\% chance of winning an amount from a continuous range.

This mixed distribution challenges our separate notions of discrete and continuous probability. We need a framework that can handle such hybrid scenarios in a unified manner.

To fix this, we introduce a more general that can handle both discrete and continuous probabilities.

#### Desired Properties of Probability

Let's try to identify the key properties we want to preserve from our current approaches:

1. The maximum probability is $1$ (when all outcomes are favorable).
2. The minimum probability is $0$ (when no outcomes are favorable).
3. Other probabilities lie between $0$ and $1$.
4. Scaling the "size" of a set should scale its probability by the same factor.

Now, we try to construct a definition based on these ideas from a more abstract perspective.

#### The Concept of Relative Size

At its core, probability is about measuring the "size" of an event relative to the total "size" of possibilities. This idea applies whether we're dealing with discrete outcomes (like rolling a die) or continuous regions (like intervals on a number line).

Let's consider how this concept evolved:

1. In finite settings, we simply counted favorable outcomes.
2. In geometric settings, we used lengths of intervals or areas of shapes.


#### The Challenge of Infinite Sets

Remember our attempt to assign probability to a subinterval of $[0,1]$? 

- Using the counting measure, both numerator and denominator became infinitely large.
- Using the geometric measure (length), we obtained a ratio of finite numbers.

This illustrates why different types of measures are needed for different scenarios.

#### Formalizing Our Approach

Let's introduce some notation:

- $\Omega$ represents our sample space (all possible outcomes).
- $A$ is a subset of $\Omega$ (an event we're interested in).
- $\mu(A)$ denotes the "measure" of set $A$, which could be a count, length, area, etc.

We can then define probability in a more general sense.

> #### Definition: Ratio Probability.
>
> Given an event $A$ in a universe $\Omega$, the ratio probability of $A$, denoted $P(A)$, is defined as:
> \[
> P(A) := \frac{\mu(A)}{\mu(\Omega)}
> \]

This definition satisfies our desired properties:

1. $P(\Omega) = 1$ (certainty: each outcome is favorable)
2. $P(\emptyset) = 0$ (impossibility: no outcome is favorable)
3. $0 \le P(A) \le 1$ (for any $A \subseteq \Omega$)
4. $P(B) = kP(A)$ if $\mu(B) = k\mu(A)$ (scaling property)

#### Looking Ahead

While we'll formally define measures later, keeping these concepts and properties in mind will guide our exploration of more advanced probability theory.

This progression will lead us to measure theory, a modern mathematical framework that formalizes these ideas. It provides measures of "size" of appropriate dimensions for different types of objects.

###### {#note-non-integer-dimensions} 
Interestingly, this concept of dimension-appropriate measures extends to non-integer dimensions, leading to the fascinating world of fractals. For those curious, check the [References](#references-dimension-of-measures) section for more on this topic.

### Another Problem: Uniformity Assumption

We are not nearly done yet. Unfortunately, our current approach still relies on the assumption that all outcomes are equally likely. This assumption doesn't hold in many real-world scenarios, and it can lead to contradictions such as the St. Petersburg paradox we covered earlier. Here are more examples of scenarios where the uniformity assumption fails.

### Unequal Probabilities in Discrete Spaces

Let's revisit our die-rolling example, but with a twist. Imagine a weighted die where the probability of rolling a 6 is twice that of any other number.

Our simple counting approach falls short here because the outcomes are no longer equally likely. We need a way to assign different probabilities to different discrete outcomes.

### Continuous Distributions with Varying Densities

Imagine you're a meteorologist studying rainfall patterns in a particular region. You have a map of the area, and you want to predict the likelihood of rain at different locations. 

If rainfall were equally likely everywhere, we could use a simple geometric approach. The probability of rain in any sub-region would just be the area of that sub-region divided by the total area of the map.

But let's consider why this doesn't work in our case:
- Coastal areas might have a higher chance of rainfall due to moisture from the sea.
- Mountainous regions could experience more rainfall due to orographic lifting.
- Some areas might be in a "rain shadow," receiving less precipitation.

Based on this, our uniform probability approach falls short. We need a more sophisticated approach.

### From Counting to Measuring: The Evolution of Probability

As we've seen, our initial approach to probability had limitations. To overcome these, statisticians introduced several key concepts:

1. Random Variables
2. Probability Mass Functions (PMFs)
3. Probability Density Functions (PDFs)
4. Cumulative Distribution Functions (CDFs)

---

### Random Variables: Bridging Discrete and Continuous

A **random variable** is a function that assigns a real number to each outcome in a sample space. This powerful abstraction allows us to treat both discrete and continuous probabilities in a unified manner.

Let's explore this with an example:

#### Discrete Example

Suppose we flip a coin twice. We can define a random variable $X$ as the number of heads observed. Here, $X$ can take on values 0, 1, or 2.

If we consider all possible outcomes, we see that we have the set of outcomes $\{TT, TH, HT, HH\}$. If the coin is fair, then the probability of each outcome is $\frac{1}{4}$. We see that there is $1$ outcome with 0 heads, $2$ outcomes with 1 head, and $1$ outcome with 2 heads.

So $X$ can be defined as the following function:

\[
X = \begin{cases}
0 & \text{if } TT \\
1 & \text{if } TH \\
1 & \text{if } HT \\
2 & \text{if } HH \\
\end{cases}
\]

We should note that some values of this random variable are *repeated*, which means that the probabilities are not equal. Specifically, the probability that $X = 1$ is twice as likely as each of $X = 0$ or $X = 2$. We can describe this discrete random variable using a probability mass function (PMF), which tells us the probability of each possible value of the random variable:

\[
P(X = k) = \begin{cases}
\frac{1}{4} & \text{if } k = 0 \\
\frac{2}{4} = \frac{1}{2} & \text{if } k = 1 \\
\frac{1}{4} & \text{if } k = 2 \\
0 & \text{otherwise}
\end{cases}
\]

As we can see, the *total probabilities* of each outcome must **sum to 1** for the probability mass function to be valid. So, the probability mass function just lists out the probabilities for each value of the random variable $X$.

This definition agrees with our previous valid examples. Now, let's see what more it brings to the table.

Let's say that the coin is now biased, with heads being more likely than tails. In this case, the probability of each outcome is no longer $\frac{1}{4}$.

If we decide that $P(heads) = \frac{2}{3}$, then the probability of tails is $1 - \frac{2}{3} = \frac{1}{3}$. But then, our probabilities of each outcome is now different:

\[
\begin{cases}
P(TT) = \frac{1}{3} \cdot \frac{1}{3} = \frac{1}{9} \\
P(TH) = \frac{1}{3} \cdot \frac{2}{3} = \frac{2}{9} \\
P(HT) = \frac{2}{3} \cdot \frac{1}{3} = \frac{2}{9} \\
P(HH) = \frac{2}{3} \cdot \frac{2}{3} = \frac{4}{9} \\
\end{cases}
\]

This changes the PMF, as we now have different probabilities for each outcome.

\[
\begin{cases}
P(X = 0) = \frac{1}{9} \\
P(X = 1) = \frac{2}{9} + \frac{2}{9} = \frac{4}{9} \\
P(X = 2) = \frac{4}{9} \\
0 & \text{otherwise}
\end{cases}
\]

So, our new definitions are more flexible, allowing us to assign probabilities to unevenly weighted outcomes. This approach finally allows for unequal probabilities in discrete spaces. Let's now try to extend this to continuous spaces.

---

### Continuous Probability: Moving Beyond Points

In our previous discussions, we've often encountered the paradox of picking a single number from an infinite set. How do we assign a meaningful probability to selecting just one point from a continuum of possibilities? For instance, imagine trying to assign a probability to a person being *exactly* 170.000000... cm tall. Intuitively, this feels impossible—there are infinitely many possible heights, and any one height, considered in isolation, has a probability of zero.

So, what do we do? We shift our focus. Instead of assigning probabilities to **individual points**, we assign probabilities to **intervals**. This is one of the most important conceptual shifts in moving from discrete to continuous probability theory.

#### Example: Heights of Individuals

Let’s say we’re interested in the probability that a person’s height falls between 169.5 cm and 170.5 cm. Unlike the probability of being exactly 170 cm tall, this range is meaningful. The concept of probability now applies to intervals—ranges of outcomes—rather than individual values.

This principle is at the heart of continuous probability: assigning probabilities to intervals of outcomes rather than specific points.

### Introducing Bias: Non-Uniform Distributions

Now, let's add complexity by introducing bias into our probability distribution. We'll see how this relates to our earlier discussion about scaling probabilities linearly with the size of intervals.

#### The Weight-Proportion Principle

The key idea we're introducing is that probabilities can be defined using the product of two factors:

1. A normalized weight assigned to a region
2. The proportion of that region occupied by our interval of interest

This principle allows us to create non-uniform distributions while maintaining the property that probabilities scale linearly with the size of intervals.

#### Example: Biased Interval

Let's consider the interval $[0,1]$ and introduce a bias towards smaller values. We'll do this by:

1. Assigning different weights to different parts of the interval
2. Normalizing these weights to sum to 1
3. Calculating probabilities based on these normalized weights and the proportion of each region occupied

Here's our setup:

- Assign an unnormalized weight of 2 to the interval $[0, 0.25]$ (the first quarter)
- Assign an unnormalized weight of 1 to the interval $[0.25, 1]$ (the remaining three-quarters)

To normalize these weights, we divide each by their sum:

$$
\text{Total weight} = 2 + 1 = 3
$$

Normalized weights:
- For $[0, 0.25]$: $\frac{2}{3}$
- For $[0.25, 1]$: $\frac{1}{3}$

Now, let's define the probability that a number falls between two points $a$ and $b$:

$$
P(a \leq X \leq b) = \begin{cases}
\frac{2}{3} \cdot \frac{(b - a)}{0.25} & \text{if } 0 \leq a \leq b \leq 0.25 \\
\frac{1}{3} \cdot \frac{(b - a)}{0.75} & \text{if } 0.25 \leq a \leq b \leq 1 \\
0 & \text{otherwise}
\end{cases}
$$

Let's break down this formula:

1. For the first case $(0 \leq a \leq b \leq 0.25)$:
   - Normalized weight assigned to this region: $\frac{2}{3}$
   - Proportion of the region occupied: $\frac{(b - a)}{0.25}$
   - Probability: $\text{(Normalized Weight)} \cdot \text{(Proportion)} = \frac{2}{3} \cdot \frac{(b - a)}{0.25}$

2. For the second case $(0.25 \leq a \leq b \leq 1)$:
   - Normalized weight assigned to this region: $\frac{1}{3}$
   - Proportion of the region occupied: $\frac{(b - a)}{0.75}$
   - Probability: $\text{(Normalized Weight)} \cdot \text{(Proportion)} = \frac{1}{3} \cdot \frac{(b - a)}{0.75}$

This formulation explicitly shows how we're using the weight-proportion principle to define probabilities. The normalized weight ($\frac{2}{3}$ or $\frac{1}{3}$) represents the bias towards certain regions, while the proportion ($\frac{(b-a)}{0.25}$ or $\frac{(b-a)}{0.75}$) ensures that the probability scales linearly with the size of the interval within each region.

#### Verifying Linear Scaling

To see how this maintains linear scaling within each region, consider doubling the size of an interval:

1. In $[0, 0.25]$: If we double $(b-a)$, the probability doubles.
2. In $[0.25, 1]$: If we double $(b-a)$, the probability doubles.

This property holds because we're multiplying the fixed normalized weight by a proportion that scales linearly with the interval size.

#### Handling Overlapping Intervals

Of course, not all intervals will lie entirely within a single region with a fixed weight. What happens when we want to calculate the probability for an interval that crosses from one region into another, like $[0, 0.5]$?

We can't apply the same weight across the entire interval because it spans two different regions with different weights. Instead, we break the interval into two pieces: $[0, 0.25] \subseteq [0, 0.25]$ and $[0.25, 0.5] \subseteq [0.25, 1]$. We calculate the probability for each sub-interval separately, then sum them to get the total probability:

$$
\begin{aligned}
P(0 \leq X \leq 0.5) &= P(0 \leq X \leq 0.25) + P(0.25 \leq X \leq 0.5) \\
&= \frac{2}{3} \cdot \frac{(0.25 - 0)}{0.25} + \frac{1}{3} \cdot \frac{(0.5 - 0.25)}{0.75} \\
&= \frac{2}{3} + \frac{1}{9} = \frac{7}{9}
\end{aligned}
$$

This way, we can also check that the total probability of the entire interval is $1$, as expected:

$$
P(0 \leq X \leq 1) = \frac{2}{3}\cdot \frac{0.25}{0.25} + \frac{1}{3} \cdot \frac{0.75}{0.75} = \frac{2}{3} + \frac{1}{3} = 1
$$

This approach of using normalized weights and proportions allows us to create non-uniform distributions while maintaining the crucial property of linear scaling within defined regions. It forms the basis for more complex probability distributions and sets the stage for the continuous probability density functions we'll explore next.

### From Discrete Bias to Continuous Density

We've seen how we can introduce bias by assigning different weights to different parts of an interval. Let's take this idea further and see how it naturally leads us to the concept of probability density functions.

#### Increasing the Number of Regions

Instead of dividing our interval $[0, 1]$ into just two parts, let's divide it into $n$ equal parts, where $n$ is a large number. We'll assign decreasing weights to each segment as we move from left to right.

Let's define our weights as follows:

$$
\begin{aligned}
w_1 &= \frac{n}{1 + 2 + \cdots + n} \\
w_2 &= \frac{n-1}{1 + 2 + \cdots + n} \\
&\vdots \\
w_n &= \frac{1}{1 + 2 + \cdots + n}
\end{aligned}
$$

Here, the denominator $1 + 2 + \cdots + n = \frac{n(n+1)}{2}$ ensures that our weights sum to 1, maintaining proper normalization.

Now, the probability that $X$ falls within $[a, b]$ can be expressed as:

$$
P(a \leq X \leq b) = \begin{cases}
\frac{n}{1 + 2 + \cdots + n} \cdot \frac{(b - a)}{1/n} & \text{if } 0 \leq a \leq b \leq \frac{1}{n}, \\
\frac{n-1}{1 + 2 + \cdots + n} \cdot \frac{(b - a)}{1/n} & \text{if } \frac{1}{n} \leq a \leq b \leq \frac{2}{n}, \\
\vdots \\
\frac{1}{1 + 2 + \cdots + n} \cdot \frac{(b - a)}{1/n} & \text{if } \frac{n-1}{n} \leq a \leq b \leq 1, \\
0 & \text{otherwise.}
\end{cases}
$$

#### Condensing the Notation

We can condense this notation using indexing. Let $i$ be the index of the segment containing $[a, b]$. Using the identity $1 + 2 + ... + n = \frac{n(n+1)}{2}$, we can write:

$$
P(a \leq X \leq b) = \begin{cases}
\frac{n-i+1}{\frac{n(n+1)}{2}} \cdot \frac{(b - a)}{1/n} & \text{if } \frac{i-1}{n} \leq a \leq b \leq \frac{i}{n}, \\
0 & \text{otherwise.}
\end{cases}
$$

This condensed form captures the same information more succinctly.

#### The Challenge of Increasing $n$

As we increase $n$, say from 10 to 100 to 1000, we encounter a problem: our piecewise function becomes increasingly complex. Calculating probabilities for intervals that span multiple segments becomes tedious and error-prone.

For instance, to find $P(0.15 \leq X \leq 0.6)$, we'd need to:
1. Identify which segments $0.15$ and $0.6$ fall into
2. Sum the probabilities for all complete segments between them
3. Calculate partial probabilities for the segments containing $0.15$ and $0.6$

This process becomes unwieldy as $n$ grows large.

#### The Limit Case: Continuous Variation

When we see a partition that can be made finer, our first instinct should be to consider what happens as $n$ approaches infinity. If something meaninful comes out, then we can apply tools of calculus! In this limit:
1. Each segment becomes infinitesimally small
2. The discrete weights transform into a continuous function

Instead of discrete weights, we now have a continuous function $f(x)$ that gives the **probability density** at each point $x \in [0, 1]$, which is the standard name for what we previously called "normalized weights". Indeed, density is precisely the ratio between mass and volume, or in our mathematical framework, the ratio between probability mass and measure.

Then, $f(x)$ is called a **Probability Density Function (PDF)**.

Here’s how this works: for a very small interval $[x, x + dx]$, the probability that $X$ lies within that interval is approximately $f(x) \, dx$. The function $f(x)$ represents the probability per unit length, much like how a histogram gives the frequency per bin in a discrete case.

In our example, as $n \to \infty$, our weight function approaches:

$$
f(x) = \lim_{n \to \infty} \frac{n-nx+1}{\frac{n(n+1)}{2}} \cdot n = 2(1-x)
$$

#### The Integral Form: Summing Infinitesimal Probabilities

To calculate the probability that $X$ lies within an interval $[a, b]$, we can’t just sum up discrete pieces anymore, because the probability density changes continuously. Instead, we sum up the infinitesimal probabilities over every tiny piece of the interval. Mathematically, this is exactly what an **integral** does:

\[
P(a \leq X \leq b) = \lim_{n \to \infty} \sum_{i=1}^{n} f(x_i) \Delta x \quad \longrightarrow \quad P(a \leq X \leq b) = \int_a^b f(x) \, dx.
\]

This expression tells us that the total probability in the interval $[a, b]$ is the **integral** of the probability density function $f(x)$ over that interval. The integral is simply a way of adding up the infinitesimally small probabilities across every point in the interval, giving us the total probability for that range.

For our example:

$$
P(a \leq X \leq b) = \int_a^b 2(1-x) \, dx = [2x - x^2]_a^b = (2b - b^2) - (2a - a^2)
$$

This integral form allows us to calculate probabilities for any interval $[a, b]$ smoothly, without the need for piecewise calculations.

- [ ] Todo: Expected value, variance, standard deviation
- [ ] Gaussian distribution
- [ ] CDF (motivate when PDF does not exist, etc.)

---

## The Path to Modern Probability Theory

We've seen how elementary probability theory and geometric probability each have their limitations. Now, let's take our first step towards modern probability theory by examining some perplexing problems that challenged mathematicians in the 19th and 20th centuries.

### Motivating Examples: When Intuition Fails

#### The Cantor Set: A Dust of Probability

Let's begin with a seemingly simple question: Can a set have zero length but an uncountable number of points? The Cantor set, discovered by Georg Cantor in 1883, provides a startling answer.

Here's how we construct it:

1. Start with the interval $[0,1]$.
2. Remove the middle third, leaving $[0,\frac{1}{3}] \cup [\frac{2}{3},1]$.
3. Repeat this process infinitely, removing the middle third of each remaining interval.

What's left is the Cantor set. Let's explore its properties:

1. **Measure**: The total length removed is:

    \[
    \frac{1}{3} + \frac{2}{9} + \frac{4}{27} + ... = \sum_{n=1}^{\infty} \frac{2^{n-1}}{3^n} = 1
    \]

   So, the Cantor set has zero length (or measure).

2. **Cardinality**: Despite having zero length, the Cantor set is uncountable! We can prove this by showing a one-to-one correspondence with real numbers in $[0,1]$.

This paradoxical nature of the Cantor set challenges our intuition about probability. If we try to assign probabilities based on length, we'd give the Cantor set a probability of $0$. Yet, it contains as many points as the entire interval $[0,1]$!

#### The Vitali Set: A Measure of Doubt

Now, let's examine another perplexing example that further challenges our intuitive notions of probability and measure.

Imagine we want to assign probabilities to subsets of the real line between $0$ and $1$. Seems straightforward, right? We might think we could use the length of the subset as its probability. But in 1905, Giuseppe Vitali showed that this intuitive approach breaks down in a spectacular way.

Vitali constructed a subset of $[0,1]$ that doesn't have a well-defined "length" in any meaningful sense. Here's a simplified version of his argument:

1. Consider the equivalence relation on $[0,1]$ where two numbers are equivalent if their difference is rational.
2. Use the Axiom of Choice to select one representative from each equivalence class.
3. The resulting set (call it $V$) has a peculiar property: if you shift $V$ by any rational number (modulo 1), the shifted sets are all disjoint, and their union covers $[0,1]$.

Now, if we try to assign a "length" (or measure) $m(V)$ to this set $V$, we run into a contradiction:

- The shifted sets are all disjoint, so their measures should add up.
- The shifted sets cover $[0,1]$, so their measures should sum to 1.
- But there are countably infinitely many rational numbers in $[0,1]$.

This leads to the equation: $\aleph_0 \cdot m(V) = 1$, where $\aleph_0$ is the cardinality of the rational numbers.

This can't be resolved properly. If we set $m(V)$ to anything greater than $0$, then the left-hand side blows up to infinity. So, we can only set the measure to zero, $m(V) = 0$. Yet, if $V$ has measure zero, how can its shifts cover the entire interval?

### The Need for a New Foundation

These paradoxes shook the foundations of probability theory. If we can't consistently assign probabilities (or measures) to all subsets of our sample space, how can we develop a rigorous theory?

The solution came in the form of measure theory and $\sigma$-algebras. Instead of trying to assign probabilities to every possible subset, we define a collection of "measurable" sets that play nicely with our probability measure.

Let's think about what we need to build a consistent theory of probability:

1. **A sample space**: We need a set of all possible outcomes. Let's call this $\Omega$.

2. **A way to describe events**: We want to assign probabilities to events, which are subsets of $\Omega$. But the Vitali set showed us we can't work with all subsets. We need a collection of "well-behaved" subsets.

3. **A probability measure**: Once we have our well-behaved subsets, we need a function that assigns probabilities to them.

Let's explore each of these components in more detail.

#### The Sample Space $\Omega$

The sample space is straightforward: it's just the set of all possible outcomes of our experiment or random process. For a coin flip, it might be $\Omega = \{\text{Heads}, \text{Tails}\}$. For our $[0,1]$ interval example, it's $\Omega = [0,1]$.

#### Events: The $\sigma$-algebra $\mathcal{F}$

Here's where things get interesting. We can't assign probabilities to all subsets of $\Omega$, so we need to choose a collection of subsets that:

1. Includes all the sets we care about in practice.
2. Is closed under the operations we need for probability theory (like taking complements and unions).
3. Excludes problematic sets like the Vitali set.

This collection is called a $\sigma$-algebra, often denoted $\mathcal{F}$. Let's build it up step by step:

1. We want $\Omega$ itself to be in $\mathcal{F}$ (the event "something happens").
2. If an event $A$ is in $\mathcal{F}$, we want its complement $\Omega \setminus A$ to be in $\mathcal{F}$ too ("not A" should be an event if "A" is).
3. If we have a sequence of events $A_1, A_2, \ldots$ in $\mathcal{F}$, we want their union $\bigcup_{i=1}^{\infty} A_i$ to be in $\mathcal{F}$ as well.

These requirements lead us to the formal definition of a $\sigma$-algebra:

> A $\sigma$-algebra $\mathcal{F}$ on $\Omega$ is a collection of subsets of $\Omega$ that:
> 1. Contains $\Omega$
> 2. Is closed under complementation: if $A \in \mathcal{F}$, then $\Omega \setminus A \in \mathcal{F}$
> 3. Is closed under countable unions: if $A_1, A_2, \ldots \in \mathcal{F}$, then $\bigcup_{i=1}^{\infty} A_i \in \mathcal{F}$

This definition solves our Vitali set problem: we simply don't include such problematic sets in our $\sigma$-algebra $\mathcal{F}$. In practice, we often use the Borel $\sigma$-algebra, which includes all the sets we typically care about in probability theory while excluding pathological cases.

#### The Probability Measure $P$

Now that we have our well-behaved collection of events, we need a way to assign probabilities to them. This is where the probability measure $P$ comes in. We want $P$ to:

1. Assign a non-negative real number to each event in $\mathcal{F}$.
2. Assign 1 to the entire sample space $\Omega$ (something must happen).
3. Be additive for disjoint events (the probability of "A or B" should be the sum of their individual probabilities if A and B can't happen simultaneously).

This leads us to the formal definition of a probability measure:

> A probability measure $P$ on $(\Omega, \mathcal{F})$ is a function $P: \mathcal{F} \to [0,1]$ such that:
> 1. $P(A) \geq 0$ for all $A \in \mathcal{F}$
> 2. $P(\Omega) = 1$
> 3. For any sequence of disjoint events $A_1, A_2, \ldots \in \mathcal{F}$, $P(\bigcup_{i=1}^{\infty} A_i) = \sum_{i=1}^{\infty} P(A_i)$

### Putting It All Together: The Probability Space

Now we can see why we need all three components: $\Omega$, $\mathcal{F}$, and $P$. Each plays a crucial role:

- $\Omega$ defines what can happen.
- $\mathcal{F}$ defines what we can measure.
- $P$ defines how likely each measurable event is.

Together, they form a probability space $(\Omega, \mathcal{F}, P)$, which gives us a rigorous foundation for probability theory.

### Why This Matters: Resolving Paradoxes and Enabling New Mathematics

This framework resolves the paradoxes we encountered earlier:

1. For the Cantor set, we can now say it's a measurable set with probability (measure) zero, while acknowledging its uncountable nature.
2. The Vitali set, being non-measurable, simply isn't assigned a probability in our framework.

Moreover, this approach opens up new avenues for mathematical exploration:

1. It allows us to work with continuous probability distributions rigorously.
2. It provides a foundation for stochastic processes and advanced probability theory.
3. It connects probability theory with other areas of mathematics, like functional analysis and ergodic theory.

This framework might seem abstract, but it's crucial for building a consistent theory of probability. It allows us to:

1. Define probability measures that behave sensibly (e.g., countable additivity).
2. Develop a theory that works for both discrete and continuous probability spaces.
3. Prove important theorems (like the law of large numbers) in a rigorous way.
4. Avoid paradoxes that arise from carelessly applying probabilistic reasoning to ill-defined scenarios.

In our next section, we'll explore how this framework helps us tackle more complex problems and leads us towards the full measure-theoretic foundation of modern probability theory. We'll see how concepts like random variables and expectation fit into this structure, and how it allows us to handle sophisticated scenarios in probability and statistics.

# From Random Variables to Sample Spaces

In elementary probability courses, we often think of random variables as direct samples from our sample space. For instance, when rolling a die, we might define a random variable $X$ as the number that comes up. This intuitive approach works well for simple scenarios, but let's explore why it falls short as our problems become more complex.

### The Intuitive Approach

Consider a simple experiment: rolling a fair six-sided die. We might define our probability space as:

- Sample space: $\Omega = \{1, 2, 3, 4, 5, 6\}$
- Events: All subsets of $\Omega$
- Probability measure: $P(\{i\}) = \frac{1}{6}$ for each $i \in \Omega$

In this context, we could define a random variable $X$ as the outcome of the roll. This direct mapping from outcomes to values is straightforward and intuitive.

### When Simplicity Falters

Now, let's complicate our experiment slightly. Suppose we're interested in the sum of two dice rolls. We could define a new sample space:

$\Omega' = \{(i,j) : i,j \in \{1,2,3,4,5,6\}\}$

And define our random variable $Y$ as the sum of the two values. This still works, but our sample space has grown considerably. What if we want to model more complex scenarios?

1. **The average of 100 dice rolls**: Our sample space would become enormous.
2. **Continuous outcomes**: What if we're measuring the time between events, which could be any positive real number?
3. **Abstract outcomes**: How do we handle experiments where the outcomes aren't naturally numeric, like the color of a randomly chosen flower?

Our simple approach of directly equating random variables with sample space outcomes quickly becomes unwieldy or even impossible to implement.

### The Function Perspective

To address these challenges, we need a more flexible approach. Instead of thinking of random variables as direct samples from the sample space, what if we define them as functions on the sample space?

Let's revisit our die-rolling example with this new perspective:

1. Our sample space $\Omega$ remains $\{1, 2, 3, 4, 5, 6\}$.
2. We define a random variable $X: \Omega \to \mathbb{R}$ where $X(\omega) = \omega$.

This might seem like a trivial change, but it opens up powerful possibilities. For instance, we can now easily define a random variable for the sum of two dice rolls:

3. $Y: \Omega \times \Omega \to \mathbb{R}$ where $Y(\omega_1, \omega_2) = \omega_1 + \omega_2$

Notice how we didn't need to change our original sample space. We simply defined a new function on the product of our original space with itself.

This functional approach offers several advantages:

1. **Flexibility**: We can work with a simple sample space and define complex random variables on it.
2. **Composability**: We can easily compose random variables to create new ones. For example, if $X$ and $Y$ are random variables, we can define $Z = X + Y$ without changing our underlying probability space.
3. **Abstraction**: We can focus on the properties of the random variable itself, without worrying about the details of the underlying sample space.

It's worth noting that by this new definition, "random variables" are neither random nor variables - they're deterministic functions on the sample space. The name has stuck due to historical underpinnings, but it's important to understand the shift in perspective is now totally distinct from the old one.

### Generalizing Further

This functional view allows us to handle more abstract scenarios as well. For instance, if we're interested in the color of a randomly chosen flower, we could define:

$C: \Omega \to \{\text{red}, \text{blue}, \text{yellow}\}$

Where $\Omega$ might represent all the flowers in a field, and $C$ maps each flower to its color.

We can even handle continuous outcomes. If we're measuring the time $T$ until an event occurs, we might have:

$T: \Omega \to [0,\infty)$

Where $\Omega$ represents all possible scenarios, and $T$ maps each scenario to the time until the event occurs.

### From Functions to Measures

This functional approach to random variables naturally leads us to the concept of pushforward measures, which we'll explore in more depth later. The key idea is that a random variable $X: \Omega \to E$ allows us to "push forward" our probability measure $P$ on $\Omega$ to a new measure $P_X$ on $E$:

$P_X(A) = P(X^{-1}(A))$ for subsets $A$ of $E$

This operation allows us to transfer probabilities from our abstract sample space to the space where our outcomes of interest live.

### Why This Matters

This approach of defining random variables as functions and decoupling them from the sample space offers several advantages:

1. **Generality**: This approach works for any measurable space, not just real numbers. We can define random variables taking values in complex spaces like function spaces or abstract algebraic structures.

2. **Connection to measure theory**: By viewing random variables as measurable functions, we can leverage the powerful tools of measure theory in probability.

3. **Consistency**: This framework ensures that our probability assignments are consistent and well-defined, avoiding paradoxes like those we encountered with geometric probability.

4. **Unification**: It provides a unified treatment of discrete and continuous probability, as well as more exotic probability spaces.

In our next section, we'll explore how this framework allows us to handle more sophisticated probabilistic concepts, and how it enables us to tackle complex problems in probability and statistics.

## References and Further Reading {#references}

### Probability Theory and Measure Theory {#references-probability-theory-and-measure-theory}

1. [David Pollard - A User's Guide to Measure Theoretic Probability (Chapter 1: Motivation)](http://www.stat.yale.edu/~pollard/Courses/600.spring06/Handouts/Chapter1.pdf)
2. [Michael Betancourt - Probability Theory (for Scientists and Engineers)](https://betanalpha.github.io/assets/case_studies/probability_theory.html)
3. [Matthew N. Bernstein - Demystifying measure-theoretic probability theory (part 1: probability spaces)](https://mbernste.github.io/posts/measure_theory_1/)
4. [Wikipedia - Probability Theory](https://en.wikipedia.org/wiki/Probability_theory)
5. [Wikipedia - Random Variables](https://en.wikipedia.org/wiki/Random_variable)
6. [Wikipedia - Measure Theory](https://en.wikipedia.org/wiki/Measure_theory)

### Dimension of measures {#references-dimension-of-measures}

1. [3Blue1Brown (Grant Sanderson) - Fractals are typically not self-similar](https://m.youtube.com/watch?v=gB9n2gHsHN4)
2. [Wikipedia - Minkowski–Bouligand dimension](https://en.wikipedia.org/wiki/Minkowski–Bouligand_dimension)
3. [Wikipedia - Hausdorff dimension](https://en.wikipedia.org/wiki/Hausdorff_dimension)

Back to [Note - Non-integer dimensions](#note-non-integer-dimensions)