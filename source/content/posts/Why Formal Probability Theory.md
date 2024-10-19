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

This blog post aims to fill this gap by providing a brief introduction to the foundations of modern probability and a surface-level overview of the concepts. We'll explore the evolution of probability theory, examining the problems and paradoxes that spurred its development. 

Starting from the very basics, we will gradually refine each definition after encountering concrete problems that arise from our naive ones to build up to increasingly sophisticated and abstract concepts. By understanding the "why" behind the theory, these abstract concepts can hopefully become more accessible and meaningful.

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

This intuitive approach forms the basis of classical probability theory:

$P(A) = \frac{\text{number of favorable outcomes}}{\text{total number of possible outcomes}}$

Where $P(A)$ represents the probability of event $A$.

### The Emergence of Combinatorics

As games became more complex, so did the mathematics needed to analyze them. Consider this problem:

You roll two dice. What's the probability of getting a sum of 7?

To solve this, we need to:
1. Count the total number of possible outcomes: $6 \times 6 = 36$
2. Count the favorable outcomes: $(1,6)$, $(2,5)$, $(3,4)$, $(4,3)$, $(5,2)$, $(6,1)$ - six in total
3. Apply our formula: $P(\text{sum of 7}) = \frac{6}{36} = \frac{1}{6}$

This approach works well for discrete problems with a finite number of outcomes. But what happens when we encounter infinity?

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

This problem introduces the idea of using geometric measures (lengths, areas, volumes) to calculate probabilities in continuous spaces. So far, this definition seems to be holding up pretty well for the infinite cases. But, unfortunately, it has its own limitations.

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

1. Disconnected Theories: Our current methods treat discrete and continuous probabilities as entirely separate concepts. This disconnect becomes problematic when we encounter scenarios that don't fit neatly into either category.

2. Assumption of Equally Likely Outcomes: Both our counting and geometric approaches often rely on the assumption that all outcomes are equally likely. This assumption doesn't hold in many real-world scenarios.

3. Inability to Handle Complex Scenarios: As we'll see, there are situations where neither the discrete nor the continuous approach alone is sufficient.

Let's look at some examples that challenge our current understanding:

### The Curious Case of Mixed Distributions

Consider a game where you flip a fair coin. If it's heads, you win \$10. If it's tails, you spin a wheel that gives you a random amount between \$0 and \$20.

How would you describe the probability distribution of your winnings? It's neither purely discrete nor purely continuous. There's a 50\% chance of winning exactly \$10 (discrete), and a 50\% chance of winning an amount from a continuous range.

This mixed distribution challenges our separate notions of discrete and continuous probability. We need a framework that can handle such hybrid scenarios in a unified manner.

### Unequal Probabilities in Discrete Spaces

Let's revisit our die-rolling example, but with a twist. Imagine a weighted die where the probability of rolling a 6 is twice that of any other number.

Our simple counting approach falls short here because the outcomes are no longer equally likely. We need a way to assign different probabilities to different discrete outcomes.

### Continuous Distributions with Varying Densities

Imagine you're a meteorologist studying rainfall patterns in a particular region. You have a map of the area, and you want to predict the likelihood of rain at different locations.

#### The Uniform Approach Falls Short

If rainfall were equally likely everywhere, we could use a simple geometric approach. The probability of rain in any sub-region would just be the area of that sub-region divided by the total area of the map.
But let's consider why this doesn't work in our case:
- Coastal areas might have a higher chance of rainfall due to moisture from the sea.
- Mountainous regions could experience more rainfall due to orographic lifting.
- Some areas might be in a "rain shadow," receiving less precipitation.

### From Counting to Measuring

To address the limitations we've discussed, statisticians introduced several key concepts:

1. Random Variables
2. Probability Mass Functions (PMFs)
3. Probability Density Functions (PDFs)
4. Cumulative Distribution Functions (CDFs)

Before checking out the formal definitions, let's explore our ideas a little bit further.

The fundamental idea is to consider probability as a measure of sets. Whether we're counting discrete outcomes or measuring continuous regions, we're essentially quantifying the "size" of the event relative to the total "size" of possibilities. In the finite setting, we counted the number of favorable outcomes in the rolling of a die. In the geometric setting, we considered lengths of intervals and areas of shapes to define this "relative size".

Measure theory, our ultimate goal to reach, is a modern mathematical framework that allows us to properly formalize this idea. It turns out that there are measures of more suitable dimensions for different types of objects.

For instance, remember when we tried to assign a probability to a subinterval of $[0, 1]$? When we tried to do this via the counting measure, the numerator and denominator both became infinitely large. But when we used the geometric measure, the length of the subinterval is a finite number, and the probability is a ratio of two finite numbers.

#### {#note-non-integer-dimensions} 
Without going into technical details, extending this notion of measures of certain dimensions being more suitable for certain types of objects leads to non-integer dimensions to *fractals*. Some exploratory material can be found in the section of [References](#references-dimension-of-measures).

In both cases, as we have discussed, we would like to assign a probability as a ratio of the "size" of the favorable outcomes to the total "size" of all possible outcomes. What properties do we want to preserve based on our previous definitions?

Well, the largest possible probability is $1$ in the case where every outcome is favorable, and the smallest possible probability is $0$ when no outcomes are favorable. Then, other probabilities lies in between these two extremes.

In addition, when we scale a set by a certain factor, the probability of the scaled set should also be scaled by the same factor.

Let's list our discoveries. Suppose we have a set $A$ within a sample space $\Omega$ that serves as the universe of all possible outcomes. For now, our current best approach is setting the probability as a ratio of "size" measures. We will introduce the conventional notation

\[
\mu(A)
\]

to denote the **measure** of a set $A$ in the sample space $\Omega$, which can be things like a count, a length, an area, a volume and more.

Then, we can define the probability of $A$ as:

\[
P(A) := \frac{\mu(A)}{\mu(\Omega)}
\]

The properties of this definition include:

1. $P(\Omega) = 1$ (when all outcomes are favorable)
2. $P(\emptyset) = 0$ (when no outcomes are favorable)
3. $0 \le P(A) \le 1$ (for any $A \subseteq \Omega$)
4. $P(B) = kP(A)$ if $\mu(B) = 2\mu(A)$ (for any $A, B \subseteq \Omega$)

The formal definition of a measure will be covered later. For now, we keep our current beliefs and desired properties in mind as we explore the following sections.

---

### Random Variables: Bridging Discrete and Continuous

A **random variable** is a function that assigns a real number to each outcome in a sample space. This powerful abstraction allows us to treat both discrete and continuous probabilities in a unified manner.

Let's explore this with an example:

#### Discrete Example

Suppose we flip a coin twice. We can define a random variable $X$ as the number of heads observed. Here, $X$ can take on values 0, 1, or 2.

If we consider all possible outcomes, we see that we have the set of outcomes $\{HH, HT, TH, TT\}$. If the coin is fair, then the probability of each outcome is $\frac{1}{4}$. We see that there is $1$ outcome with 0 heads, $2$ outcomes with 1 head, and $1$ outcome with 2 heads.

We can describe this discrete random variable using a probability mass function (PMF):

\[
P(X = k) = \begin{cases}
\frac{1}{4} & \text{if } k = 0 \\
\frac{2}{4} = \frac{1}{2} & \text{if } k = 1 \\
\frac{1}{4} & \text{if } k = 2 \\
0 & \text{otherwise}
\end{cases}
\]

As we can see, the *total probabilities* of each outcome must **sum to 1** for the probability mass function to be valid. So, the probability mass function just lists out the probabilities for each value of the random variable $X$.

So, the definition agrees with our previous valid examples. Now, let's see what more it brings to the table.

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

This significantly changes the PMF, as we now have different probabilities for each outcome.

\[
\begin{cases}
P(X = 0) = \frac{1}{9} \\
P(X = 1) = \frac{2}{9} + \frac{2}{9} = \frac{4}{9} \\
P(X = 2) = \frac{4}{9} \\
0 & \text{otherwise}
\end{cases}
\]

So, our new definitions are more flexible, allowing us to assign probabilities to unevenly weighted outcomes.

---

### Continuous Probability: Moving Beyond Points

In our previous discussions, we've often encountered the paradox of picking a single number from an infinite set. How do we assign a meaningful probability to selecting just one point from a continuum of possibilities? For instance, imagine trying to assign a probability to a person being *exactly* 170.000000... cm tall. Intuitively, this feels impossible—there are infinitely many possible heights, and any one height, considered in isolation, has a probability of zero.

So, what do we do? We shift our focus. Instead of assigning probabilities to **individual points**, we assign probabilities to **intervals**. This is one of the most important conceptual shifts in moving from discrete to continuous probability theory.

#### Example: Heights of Individuals

Let’s say we’re interested in the probability that a person’s height falls between 169.5 cm and 170.5 cm. Unlike the probability of being exactly 170 cm tall, this range is meaningful. The concept of probability now applies to intervals—ranges of outcomes—rather than individual values.

This principle is at the heart of continuous probability: assigning probabilities to intervals of outcomes rather than specific points.

---

### Introducing Bias: Non-Uniform Distributions

Now, let’s add some complexity. What if not all intervals are equally likely? Suppose we have a bias towards smaller values, such that the probability of picking a number in the first quarter of the interval $[0, 0.25]$ is weighted more heavily than the rest of the interval.

Here’s how we’ll do it:

- Assign twice as much weight to values in $[0, 0.25]$ compared to the rest of the interval $[0.25, 1]$.
- Scale probability linearly with the length of the interval.
- Normalize the weights so the total probability is still 1.

To formalize this, let’s assign a weight of $\frac{2}{3}$ to the first quarter and $\frac{1}{3}$ to the rest of the interval. Then, the probability that the number falls between two points $a$ and $b$ depends on whether those points lie in the first quarter, the remainder, or both.

\[
P(a \leq X \leq b) = \begin{cases}
\frac{2}{3} \frac{(b - a)}{0.25} & \text{if } 0 \leq a \leq b \leq 0.25 \\
\frac{1}{3} \frac{(b - a)}{0.75} & \text{if } 0.25 \leq a \leq b \leq 1 \\
0 & \text{otherwise}
\end{cases}
\]

#### What About Overlapping Intervals?

Here’s where things get interesting. What happens if we want to calculate the probability for an interval that crosses from one region into another, like $[0, 0.5]$? We can’t apply the same weight across the entire interval because it spans two different regions with different weights.

Instead, we break the interval into two pieces: $[0, 0.25]$ and $[0.25, 0.5]$. We calculate the probability for each sub-interval separately, then sum them to get the total probability:

\[
P([0, 0.5]) = \frac{2}{3} \cdot (0.25 - 0) + \frac{1}{3} \cdot (0.5 - 0.25) = \frac{1}{3}
\]

This calculation has a familiar structure—it’s similar to calculating an **average** value. We’re weighting the probabilities of the sub-intervals according to their lengths and summing them to get the total probability.

### Pushing the Biased Interval to Its Limits

Let's consider what happens if we make push the bias in our previous example to its limits. Instead of just two pieces, let's divide our interval into smaller and smaller pieces, each with its own probability density.

### Revised Section: Transition to Probability Density Functions (PDFs)

---

#### Multi-Piece Bias: Increasing Complexity

Let’s extend our biased example further by dividing the interval $[0, 1]$ into multiple parts. Suppose the probability density decreases as we move from left to right. For simplicity, let’s divide the interval into $n$ equal pieces, where each piece has a different weight.

For example, if we assign decreasing weights to each segment, the probability that $X$ falls within $[a, b]$ would look something like this:

\[
P(a \leq X \leq b) = \begin{cases}
\frac{n}{1 + 2 + \cdots + n} \cdot \frac{(b - a)}{1/n} & \text{if } 0 \leq a \leq b \leq \frac{1}{n}, \\
\frac{n-1}{1 + 2 + \cdots + n} \cdot \frac{(b - a)}{1/n} & \text{if } \frac{1}{n} \leq a \leq b \leq \frac{2}{n}, \\
\vdots \\
\frac{1}{1 + 2 + \cdots + n} \cdot \frac{(b - a)}{1/n} & \text{if } \frac{n-1}{n} \leq a \leq b \leq 1, \\
0 & \text{otherwise.}
\end{cases}
\]

This example introduces a key idea: we’re assigning different probabilities to different intervals, based on a weighting scheme. The probability for each subinterval depends on its position in the interval and the assigned weight. However, this kind of piecewise calculation quickly becomes cumbersome as we increase the number of segments.

#### The Problem with Increasing $n$

As we increase the number of divisions, say $n = 10$, then $n = 100$, and eventually $n \to \infty$, writing out these piecewise probabilities becomes increasingly difficult. Each segment has its own weight, and calculating probabilities for intervals that span multiple segments becomes tedious and error-prone.

For instance, calculating the probability over an interval like $[0.15, 0.6]$ would require breaking it up across several segments and summing up the corresponding weights for each piece. As $n$ increases, the number of segments increases, and the situation becomes impractically complex.

#### The Limit Case: Continuous Variation

Now, let’s take this idea to its logical extreme. What if, instead of dividing $[0, 1]$ into a finite number of intervals, we allowed the probability density to change **continuously** from left to right? As the number of segments grows without bound, we approach a situation where the probability density is no longer piecewise, but smoothly varying across the entire interval.

So far, we have established that the probability of a given interval depends on 2 things:

1. The length of each subinterval with a defined probability
2. The weight of each defined subinterval

In this limit, we can imagine a function $f(x)$ that gives the **probability density** at every point $x \in [0, 1]$. This function $f(x)$ tells us how “dense” the probability is around each point, much like how mass density describes the distribution of mass in a physical object.

Here’s how this works: for a very small interval $[x, x + dx]$, the probability that $X$ lies within that interval is approximately $f(x) \, dx$. The function $f(x)$ represents the probability per unit length, much like how a histogram gives the frequency per bin in a discrete case.

#### The Integral: Summing Infinitesimal Probabilities

To calculate the probability that $X$ lies within an interval $[a, b]$, we can’t just sum up discrete pieces anymore, because the probability density changes continuously. Instead, we sum up the infinitesimal probabilities over every tiny piece of the interval. Mathematically, this is exactly what an **integral** does:

\[
P(a \leq X \leq b) = \lim_{n \to \infty} \sum_{i=1}^{n} f(x_i) \Delta x \quad \longrightarrow \quad P(a \leq X \leq b) = \int_a^b f(x) \, dx.
\]

This expression tells us that the total probability in the interval $[a, b]$ is the **integral** of the probability density function $f(x)$ over that interval. The integral is simply a way of adding up the infinitesimally small probabilities across every point in the interval, giving us the total probability for that range.

---

## The Path to Modern Probability Theory

We've seen how elementary probability theory and geometric probability each have their limitations. Now, let's take our first step towards modern probability theory by examining a perplexing problem that challenged mathematicians in the early 20th century.

### The Vitali Set: A Measure of Doubt

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

This can't be resolved properly. If we set $m(V)$ to anything greater than $0$, then the left-hand side blows up to infinity. So, we can only set the measure to something infinitesimal, $m(V) = 0$. Yet, if V has measure zero, how can its shifts cover the entire interval?

This paradox shook the foundations of probability theory. If we can't consistently assign probabilities (or measures) to all subsets of our sample space, how can we develop a rigorous theory?

The solution came in the form of $σ$-algebras. Instead of trying to assign probabilities to every possible subset, we define a collection of "measurable" sets that play nicely with our probability measure.

### Building a Better Foundation

The Vitali set paradox reveals that our naive approach to assigning probabilities to all subsets of our sample space is fundamentally flawed. Let's think about what we need to build a consistent theory of probability:

1. **A sample space**: We need a set of all possible outcomes. Let's call this $\Omega$.

2. **A way to describe events**: We want to assign probabilities to events, which are subsets of $\Omega$. But the Vitali set showed us we can't work with all subsets. We need a collection of "well-behaved" subsets.

3. **A probability measure**: Once we have our well-behaved subsets, we need a function that assigns probabilities to them.

Let's explore each of these components in more detail.

#### The Sample Space $\Omega$

The sample space is straightforward: it's just the set of all possible outcomes of our experiment or random process. For a coin flip, it might be $\Omega = \{\text{Heads}, \text{Tails}\}$. For our [0,1] interval example, it's $\Omega = [0,1]$.

#### Events: The σ-algebra $\mathcal{F}$

Here's where things get interesting. We can't assign probabilities to all subsets of $\Omega$, so we need to choose a collection of subsets that:

1. Includes all the sets we care about in practice.
2. Is closed under the operations we need for probability theory (like taking complements and unions).
3. Excludes problematic sets like the Vitali set.

This collection is called a σ-algebra, often denoted $\mathcal{F}$. Let's build it up step by step:

1. We want $\Omega$ itself to be in $\mathcal{F}$ (the event "something happens").
2. If an event $A$ is in $\mathcal{F}$, we want its complement $\Omega \setminus A$ to be in $\mathcal{F}$ too ("not A" should be an event if "A" is).
3. If we have a sequence of events $A_1, A_2, \ldots$ in $\mathcal{F}$, we want their union $\bigcup_{i=1}^{\infty} A_i$ to be in $\mathcal{F}$ as well.

These requirements lead us to the formal definition of a σ-algebra:

> A σ-algebra $\mathcal{F}$ on $\Omega$ is a collection of subsets of $\Omega$ that:
> 1. Contains $\Omega$
> 2. Is closed under complementation: if $A \in \mathcal{F}$, then $\Omega \setminus A \in \mathcal{F}$
> 3. Is closed under countable unions: if $A_1, A_2, \ldots \in \mathcal{F}$, then $\bigcup_{i=1}^{\infty} A_i \in \mathcal{F}$

This definition solves our Vitali set problem: we simply don't include such problematic sets in our σ-algebra $\mathcal{F}$. In practice, we often use the Borel σ-algebra, which includes all the sets we typically care about in probability theory while excluding pathological cases.

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

### Why This Matters

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

It's worth noting that by this new definition, "random variables" are neither random nor variables in the usual sense - they're deterministic functions on the sample space. The name has stuck due to historical development, but it's important to understand the shift in perspective.

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