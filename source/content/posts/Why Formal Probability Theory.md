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

## A Brief History of Probability and Its Theory

Probability theory quickly ran into philosophical and mathematical challenges that spurred its development. Let's explore a famous paradox that shook the foundations of probability theory:

The "St. Petersburg paradox," proposed by Nicolas Bernoulli in 1713, goes like this:

Imagine a casino game where a fair coin is tossed repeatedly until it lands on tails. The pot starts at $2 and doubles every time heads comes up. When the coin lands on tails, the game ends and you win the pot. How much would you pay to play this game?

Intuitively, most people would only pay a small amount. But if we calculate the expected value using elementary probability theory, we get:

$E = \frac{1}{2} \cdot 2\$ + \frac{1}{4} \cdot 4\$ + \frac{1}{8} \cdot 8\$ + ... = \$1 + \$1 + \$1 + ... = \infty$

This paradox challenged mathematicians to reconcile probability theory with real-world decision making, leading to concepts like utility theory and risk aversion.

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

## The Bridge Between Discrete and Continuous: A New Perspective

As we've seen, both the counting approach for discrete probabilities and the geometric approach for continuous probabilities have their strengths and limitations. But what if we could find a unified framework that encompasses both? Let's explore some intriguing examples that highlight the need for a more comprehensive approach.

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

Now, consider selecting a random point in a circular target. If the target has concentric rings of different colors, and you're more likely to hit the outer rings due to your throwing technique, how do we calculate the probability of hitting each color?

Our geometric approach assumes uniform probability across the area, which doesn't apply here. We need a way to represent varying probabilities across a continuous space.

### From Counting to Measuring

These examples highlight a fundamental idea: probability as a measure of sets. Whether we're counting discrete outcomes or measuring continuous regions, we're essentially quantifying the "size" of the event relative to the total "size" of possibilities.

To formalize this idea and address the limitations we've discussed, statisticians introduced several key concepts:

1. Random Variables
2. Probability Mass Functions (PMFs)
3. Probability Density Functions (PDFs)
4. Cumulative Distribution Functions (CDFs)

Before checking out the formal definitions, let's explore our previous definitions to see what properties we would like to preserve.

In both cases, as we have discussed, we would like to assign a probability as a ratio of the "size" of the favorable outcomes to the total "size" of all possible outcomes.

In this case, the largest possible probability is $1$ when we say every outcome is favorable, and the smallest possible probability is $0$ when we say no outcomes are favorable. Then, other probabilities lies in between these two extremes.

We will keep this in mind as we explore the formal definitions.

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

So, our new defintions are more flexible, allowing us to assign probabilities to unevenly weighted outcomes.

#### Continuous Example

Now, let's consider a continuous example. As we've discussed previously with our paradox of picking a single number in an infinite set, we cannot meaningfully assign a probability to a single point in a continuous space. Instead, we need to assign probabilities to **intervals**.

For example, while the probability of a person being exactly 170.000000... cm tall is zero, the probability of their height falling between 169.5 cm and 170.5 cm is meaningful and can be calculated.

In our initial example of picking a single number in an equally likely unit interval, the probability of picking a number between $0 \le a \le b \le 1$ would be

$$\frac{b - a}{1} = b - a$$

Based on this definition, if $a = b$ (in other words, we are picking a single point), then we assign a probability of $0$. This seems strange at first because picking that point is still possible, and is a very popular counterintuitive result of definitions in probability theory. So, having probability $0$ in the continuous case doesn't mean it's impossible as in the finite case, simply that we can't assign a meaningful probability without blowing up to infinity.

If we once again consider this probability of lying within an interval as a "mass", then we define the the probability that the random variable lies within a certain interval:

\[
P(a \leq X \leq b) := b - a
\]

Once again, this agrees with our previous valid examples. Let's try to define it for a biased example now.

Let's say that we have a tendency toward smaller values, so that the probability of lying within the first half of the unit interval is $\frac{2}{3}$ while the probability of lying within the second half is $\frac{1}{3}$. In this case, we have to change our distribution:

\[
P(a \leq X \leq b) = \begin{cases}
\frac{2}{3} (b - a) & \text{if } 0 \leq a \leq b \leq \frac{1}{2} \\
\frac{1}{3} (b - a) & \text{if } \frac{1}{2} \leq a \leq b \leq 1 \\
0 & \text{otherwise}
\end{cases}
\]

You might notice that every value is scaled by (b - a). We'll come back to this in a moment.

The burning question is: what if the interval overlaps on both the first and second halves? For example, what if we take the interval $[0.25, 0.75]$? What is the probability of lying within this interval?

We can break it up into two pieces: $[0.25, 0.5]$ and $[0.5, 0.75]$. The probability of lying within $[0.25, 0.75]$ is then:

\[
P([0.25, 0.75]) = \frac{2}{3} \cdot (0.5 - 0.25) + \frac{1}{3} \cdot (0.75 - 0.5) = \frac{1}{4}
\]

This is the same as the probability of lying within $[0.25, 0.5]$ and $[0.5, 0.75]$ combined. If we look at the structure of the calculation, it's very reminiscent of the calculation for an average value.

Let's take a brief detour to discuss the **expected value** of a random variable. We will come back later in detail. For now, an expected value is a weighted sum of the possible values of a random variable, weighted by the probability of each value. This example hints at a very close relationship between expected values and probability. In later sections, we'll see how a formal approach can be used to properly explain this relationship.


For continuous random variables, we use a probability density function (PDF) instead. Density, as in "probability per unit length", or per unit area, or per unit volume, allows us to calculate the probability of an interval (or more generally, a set) based on its "size".




### Cumulative Distribution Functions: Unifying Discrete and Continuous

To further bridge the gap between discrete and continuous probabilities, we introduce the concept of a cumulative distribution function (CDF). The CDF $F_X(x)$ gives the probability that the random variable $X$ takes on a value less than or equal to $x$:

$F_X(x) = P(X \leq x)$

This function works for both discrete and continuous random variables, providing a unified way to describe probability distributions.

For our discrete coin flip example:

$F_X(x) = \begin{cases}
0 & \text{if } x < 0 \\
\frac{1}{4} & \text{if } 0 \leq x < 1 \\
\frac{3}{4} & \text{if } 1 \leq x < 2 \\
1 & \text{if } x \geq 2
\end{cases}$

For the continuous bus waiting time example:

$F_Y(y) = 1 - e^{-\lambda y}$ for $y \geq 0$

These concepts - random variables, PMFs, PDFs, and CDFs - provide a more flexible and unified approach to probability. They allow us to:

1. Handle both discrete and continuous scenarios
2. Represent unequal probabilities in discrete spaces
3. Describe varying densities in continuous spaces
4. Deal with mixed distributions

However, as we delve deeper into probability theory, we encounter scenarios that challenge even these more advanced concepts. In the next section, we'll explore these challenges and see how they lead us to the need for an even more general theory of probability.

### The Need for a More General Theory

As we delve deeper into probability theory, we encounter scenarios that challenge even these more advanced concepts. For instance:

1. What about random variables that are neither purely discrete nor purely continuous?
2. How do we rigorously define probability for infinite sample spaces?
3. Can we develop a theory that works consistently for all types of random phenomena?

These questions lead us to the doorstep of measure theory, the foundation of modern probability theory. In the next section, we'll explore how measure theory provides a rigorous framework that unifies and extends all the concepts we've discussed so far.

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

# From Sample Spaces to Random Variables

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

## References and Further Reading

1. [David Pollard - A User's Guide to Measure Theoretic Probability (Chapter 1: Motivation)](http://www.stat.yale.edu/~pollard/Courses/600.spring06/Handouts/Chapter1.pdf)
2. [Probability Theory](https://en.wikipedia.org/wiki/Probability_theory)
3. [Michael Betancourt - Probability Theory (for Scientists and Engineers)](https://betanalpha.github.io/assets/case_studies/probability_theory.html)
4. [Random Variables](https://en.wikipedia.org/wiki/Random_variable)