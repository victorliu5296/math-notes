---
title: 'Proof of Isoperimetric Problem in R^2'
date: 2024-10-21T21:27:12-04:00
summary: "Proof that a circle encloses the greatest possible area in R^2 for a given perimeter"
math: katex
categories:
  - Variational Calculus
  - Calculus of Variations
tags:
  - Proof
  - Isoperimetric Problem
  - Circle
weight: 100
draft: false
---

# A circle encloses the greatest area for a given perimeter

This is a proof of isometric problem in $\mathbb{R}^2$, showing that the circle is the shape that encloses the greatest area for its given perimeter.

By Victor Liu

Dedicated to Cristian Bocan

2024-08-04

---

## Context

When I was in middle school 3 years ago, specifically towards the second half of my 8th grade school year, we were learning about formulas for the area of different shapes, such as triangles, circles and regular polygons, I was curious as to which shape could contain the most area for a given perimeter. At this time, I was trying to grasp the basics of trigonometry and calculus. 

After playing around for a while, my intuition was that surely, for a given amount of sides, regular polygons enclosed the greatest area, and in the limit, the circle was the shape out of all of these that would maximize the enclosed area for a given perimeter.

I decided that my plan of attack would be to first prove that regular polygons maximized the area for a polygon with a fixed amount of sides, then show that as the number of sides increased, the area to perimeter ratio would increase, meaning that the circle would win out in the limit.

Of course, this wouldn’t be a full proof since it doesn’t cover shapes with any curves at all, but having quite rudimentary knowledge and techniques in my toolbox, I believed this was all that was possible.

I was able to work through a proof that an equilateral triangle would maximize the area for a given perimeter by splitting it up into 2 right-angled triangles and using trigonometry differential calculus techniques to show that indeed, the equilateral triangle was the best triangle for containing area for its perimeter. 

Naively, I thought I would extend this using induction, and I suspect this is possible; however, the proof was so tedious that even for squares, I got so frustrated that I gave up.

In addition, because I was quite new to calculus, I ended up confusing myself by trying to find the global optimum of the function for the area/perimeter ratio of a regular polygon in terms of its number of sides, but if my assumption that this function increases with the number of sides were true, then of course there would be none. So, I got stuck and gave up on that too. What I actually should’ve done is show that the function is always increasing as the number of sides increases, and that would be enough.

I had tried research about it online, but I was so fixated on my personal approach of this problem that I didn’t find any great results. I was looking for things like “circle has the greatest area of regular polygons”, which didn’t really return relevant queries.

Over time, as I stopped making progress, I slowly forgot about this problem, but a year later, I did see a [video](https://www.youtube.com/watch?v=CFBa2ezTQJQ) about the problem that offered an algorithmic approach to convince you of this result. I wasn’t really satisfied since it felt like it was just confirming what I already knew, and wasn’t rigorous enough. But it did revive my interest for the problem.

In the same year of 9th grade, I got in contact with someone in 11th grade at my school who introduced me to the very interesting study of calculus of variations. Although I was studying calculus pretty intensely then, I hadn’t yet learnt about the techniques of differential equations because it seemed too scary to me and I was hyperfixated on solving random integrals from blackpenredpen/Flammable Maths/Michael Penn videos, IIT JEE definite integration techniques, MIT integration bee, etc.

So, I did learnt about the fact that this problem was in fact very well studied and the [Wikipedia page](https://en.wikipedia.org/wiki/Isoperimetric_inequality) on the isoperimetric inequality even described that mathematicians have generalized this fact for any dimensions and even other manifolds and metric spaces. I was satisfied enough that I knew there existed a rigorous proof, and sick enough of the frustration in my previous attempts that I didn’t try to elaborate the details myself.

Nonetheless, with the advent of ChatGPT and other large language models that so greatly facilitate the ability to write equations in LaTeX, it is much more convenient to make a write-up about it. So with their help, here is my solution to the problem. I make the with the idea in mind that I or someone else could eventually formalize this in Lean 4 (at the moment, I am still working on formalizing the Newton-Kantorovich theorem, but the notion of filters for convergence is still a burden for me to wrap my head around, and I think it’ll take a while before I can gain some intuition/feeling for it. I decided to take a break, aka procrastinate, by doing this).

## Solving the problem

First, let’s define our problem carefully:

**Mathematical Statement:**

Given a simple closed curve $C$ in the plane with a fixed perimeter (arc length) $P$, determine the shape of $C$ that maximizes the area $A$ enclosed by $C$.

Now that we have defined the variables in our problem, it’s always useful to have a way to model and describe them. 

As an outline of the solution, we will use define a parameterization for a curve, then set up equations to describe the area and the perimeter based on this parameterization, and finally use the techniques of variational calculus to find the optimal function.

We’ll be using cartesian coordinates first, then polar coordinates.

The only other optimum would be a minimum where the area is 0, any shape found this way with non-zero area should be a maximum.

### Formulation:

1. **Let $C$ be a simple closed curve starting at the origin parameterized by $(x(t), y(t))$ for $t \in [0, L]$, where $L$ is the arc length of the curve, such that:**

$$
x(0)=x(L)=0 \\
y(0)=y(L)=0
$$

1. **Perimeter Constraint:** the perimeter is equal to the integral of the arc length.
    
    $$
    P = \int_0^L \sqrt{\left( \frac{dx}{dt} \right)^2 + \left( \frac{dy}{dt} \right)^2} \, dt
    $$
    

Here, $P$ is the fixed perimeter of the curve $C$.

Now, we may have a formula for the perimeter, but finding the area seems like a hard task. Luckily, we can make use of Green’s theorem, which is a $2$-dimensional generalization of the Fundamental theorem of Calculus and a special case of Stokes’s generalized theorem. This allows us to express the area based on our parameterization of the outside curve.

1. **Area Functional:**
The area $A$ enclosed by the curve $C$ can be expressed using Green's theorem:

$$
A = \frac{1}{2} \int_0^L \left( x \frac{dy}{dt} - y \frac{dx}{dt} \right) dt 
$$

Now, we have a parameterization of our curve, as well as formulas for the perimeter and the area. Again, our objective is to maximize the enclosed area $A$ subject to the perimeter constraint $P$. To achieve this, we craft a functional

$$
F := A - \lambda P
$$

$$
= \frac{1}{2} \int_0^L \left( x \frac{dy}{dt} - y \frac{dx}{dt} \right) dt - \lambda \left( \int_0^L \sqrt{\left( \frac{dx}{dt} \right)^2 + \left( \frac{dy}{dt} \right)^2} \, dt \right)
$$

$$
= \frac{1}{2} \int_0^L \left( x \frac{dy}{dt} - y \frac{dx}{dt} \right) - 2\lambda  \sqrt{\left( \frac{dx}{dt} \right)^2 + \left( \frac{dy}{dt} \right)^2} \, dt
$$

1. **Euler-Lagrange Equations:**
To find the extremal curves, we derive the Euler-Lagrange equations for $x(t)$ and $y(t)$ to minimize $\mathcal{L}$.

Let’s define our Lagrangian $L$ as the integrand of $F$ (we’ll drop out the constant factor of 1/2 since it would get cancelled anyways as the derivative operator is linear):

$$
L := \left( x \frac{dy}{dt} - y \frac{dx}{dt} \right) - \lambda \sqrt{\left(\frac{dx}{dt}\right)^2 + \left(\frac{dy}{dt}\right)^2}
$$

The Euler-Lagrange equations for this problem are then given by:

$$
\frac{\partial L}{\partial x} - \frac{d}{dt} \left( \frac{\partial L}{\partial \left( \frac{dx}{dt} \right)} \right) = 0
$$

$$
\frac{\partial L}{\partial y} - \frac{d}{dt} \left( \frac{\partial L}{\partial \left( \frac{dy}{dt} \right)} \right) = 0
$$

1. **Derivation:**
First, we find the partial derivatives of $L$:
    
    $$
    \frac{\partial L}{\partial x}=\frac{dy}{dt}
    $$
    
    $$
    \frac{\partial L}{\partial y}=-\frac{dx}{dt}
    $$
    
    $$
    \frac{\partial L}{\partial \left( \frac{dx}{dt} \right)} = -y - 2\lambda \frac{\frac{dx}{dt}}{\sqrt{\left(\frac{dx}{dt}\right)^2 + \left(\frac{dy}{dt}\right)^2}}
    $$
    

$$
\frac{\partial L}{\partial \left( \frac{dy}{dt} \right)} = x - 2\lambda \frac{\frac{dy}{dt}}{\sqrt{\left(\frac{dx}{dt}\right)^2 + \left(\frac{dy}{dt}\right)^2}}
$$

The Euler-Lagrange equations become:

$$
\frac{dy}{dt} - \frac{d}{dt} \left( -y - \frac{2\lambda \frac{dx}{dt}}{\sqrt{\left(\frac{dx}{dt}\right)^2 + \left(\frac{dy}{dt}\right)^2}} \right) = 0
$$

$$
-\frac{dx}{dt}-\frac{d}{dt} \left( x - \frac{2\lambda \frac{dy}{dt}}{\sqrt{\left(\frac{dx}{dt}\right)^2 + \left(\frac{dy}{dt}\right)^2}} \right) = 0
$$

Simplifying, we obtain:

$$
\frac{dy}{dt}=\frac{d}{dt}\left(\frac{\lambda \frac{dx}{dt}}{\sqrt{\left(\frac{dx}{dt}\right)^2 + \left(\frac{dy}{dt}\right)^2}} \right)
$$

$$
\frac{dx}{dt}=\frac{d}{dt}\left(\frac{-\lambda \frac{dy}{dt}}{\sqrt{\left(\frac{dx}{dt}\right)^2 + \left(\frac{dy}{dt}\right)^2}} \right)
$$

To make things less cluttered, let’s rewrite

$$
x':=\frac{dx}{dt}, \, y':=\frac{dy}{dt}
$$

Then, integrating both sides, we are left with

$$
y = \frac{\lambda x'}{\sqrt{((x')^2+(y')^2)}}+c_1
$$

$$
x = \frac{-\lambda y'}{\sqrt{((x')^2+(y')^2)}}+c_2
$$

Now, we can re-arrange terms and square both sides, then both equations together to finally obtain the equation of a circle:

$$
(x-c_1)^2+(y-c_2)^2=\lambda^2
$$

Since we said our curve starts and end at the origin, we can write

$$
x^2+y^2=\lambda^2
$$

GG! $\square$

---

## Polar coordinates approach

As a bonus, since we know that the solution is a circle, it turns out that the problem is even simpler to solve using polar coordinates.

So this time, we parameterize with radius $r(\theta)$ and angle $\theta \in [0, \tau]$ where $\tau = 2\pi = 360\degree$ , so that we get:

$$
A = \frac{1}{2}\int_0^{\tau} r(\theta)^2 d\theta
$$

$$
P = \int_0^{\tau}\sqrt{r(\theta)^2+r'(\theta)^2} \, d\theta
$$

Our functional becomes

$$
\begin{aligned}
F &= \frac{1}{2}\int_0^{\tau} r(\theta)^2 d\theta+\lambda\int_0^{\tau}\sqrt{r(\theta)^2+r'(\theta)^2} \, d\theta
\\
&= \int_0^{\tau}\frac{1}{2}r(\theta)^2+\lambda\sqrt{r(\theta)^2+r'(\theta)^2} \, d\theta
\end{aligned}
$$

And Lagrangian

$$

L = r(\theta)^2+2\lambda\sqrt{r(\theta)^2+r'(\theta)^2}
$$

Then, we only have to deal with a single Euler-Lagrange equation!

$$
\frac{\partial L}{\partial r} - \frac{d}{d\theta} \left( \frac{\partial L}{\partial r'(\theta))} \right) = 0
$$

$$
2\left(r+\frac{\lambda r}{\sqrt{r^2+r'^2}}\right)-2\left(\frac{\lambda r'}{\sqrt{r^2+r'^2}}\right)=0
$$

Rearranging and squaring,

$$
r^2(r^2+r'^2)=\lambda^2(r'-r)^2
$$

Now, I’ll let you try this differential equation out. This particular one simplifies very nicely if you substitute $u=r^2$, but if you’re feeling bored, you could just use the quadratic formula directly. In the end, you get that the radius is constant and equal to $\lambda$, and therefore our shape is once again a circle!

(You can verify that plugging in $r =\lambda$ indeed satisfies this differential equation)