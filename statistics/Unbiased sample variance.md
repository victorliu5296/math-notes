# Dividing sample variance by one less than the sample size

So I was looking at the statistics course on Khan Academy, and he said that the sample variance is "biased" if we directly divide by the sample size, in the sense that it underestimates the true population variance. To compensate, we divide by one less than the sample size. I asked ChatGPT for more detailed explanations, and here is an algebraic derivation of the biased sample variance estimator using expected value.

--- 

Let's calculate the expected value of the biased estimator of the sample variance, $` S^2_{\text{biased}} `$, and show how it relates to the true population variance $ \sigma^2 $.

### 1. **Restating the Biased Estimator**:

The biased sample variance estimator is given by:

$$
S^2_{\text{biased}} = \frac{1}{n} \sum_{i=1}^n (X_i - \bar{X})^2
$$

where $ \bar{X} $ is the sample mean:

$$
\bar{X} = \frac{1}{n} \sum_{i=1}^n X_i
$$

### 2. **Objective**:

We want to find the expected value $ \mathbb{E}[S^2_{\text{biased}}] $ and see how it relates to the population variance $ \sigma^2 $.

### 3. **Expanding the Squared Terms**:

We start by expanding the squared difference:

$$
S^2_{\text{biased}} = \frac{1}{n} \sum_{i=1}^n \left(X_i - \bar{X}\right)^2
$$

Expanding the square:

$$
\left(X_i - \bar{X}\right)^2 = X_i^2 - 2X_i\bar{X} + \bar{X}^2
$$

So,

$$
S^2_{\text{biased}} = \frac{1}{n} \sum_{i=1}^n \left(X_i^2 - 2X_i\bar{X} + \bar{X}^2\right)
$$

Breaking this down:

$$
S^2_{\text{biased}} = \frac{1}{n} \left(\sum_{i=1}^n X_i^2 - 2\bar{X}\sum_{i=1}^n X_i + \sum_{i=1}^n \bar{X}^2\right)
$$

Since $ \sum_{i=1}^n X_i = n\bar{X} $, the equation simplifies to:

$$
S^2_{\text{biased}} = \frac{1}{n} \left(\sum_{i=1}^n X_i^2 - 2n\bar{X}^2 + n\bar{X}^2\right)
$$

This further simplifies to:

$$
S^2_{\text{biased}} = \frac{1}{n} \left(\sum_{i=1}^n X_i^2 - n\bar{X}^2\right)
$$

$$
S^2_{\text{biased}} = \frac{1}{n} \sum_{i=1}^n X_i^2 - \bar{X}^2
$$

### 4. **Taking the Expectation**:

Now, let's find the expectation $ \mathbb{E}[S^2_{\text{biased}}] $:

$$
\mathbb{E}[S^2_{\text{biased}}] = \mathbb{E}\left[\frac{1}{n} \sum_{i=1}^n X_i^2 - \bar{X}^2\right]
$$

Using the linearity of expectation:

$$
\mathbb{E}[S^2_{\text{biased}}] = \frac{1}{n} \sum_{i=1}^n \mathbb{E}[X_i^2] - \mathbb{E}[\bar{X}^2]
$$

### 5. **Evaluating Each Term**:

- **First Term**: Since each $ X_i $ is an independent random variable with variance $ \sigma^2 $ and mean $ \mu $,

$$
\mathbb{E}[X_i^2] = \text{Var}(X_i) + \mathbb{E}[X_i]^2 = \sigma^2 + \mu^2
$$

So,

$$
\frac{1}{n} \sum_{i=1}^n \mathbb{E}[X_i^2] = \frac{1}{n} \sum_{i=1}^n (\sigma^2 + \mu^2) = \sigma^2 + \mu^2
$$

- **Second Term**: The second term $ \mathbb{E}[\bar{X}^2] $ can be expanded using the variance formula:

$$
\mathbb{E}[\bar{X}^2] = \text{Var}(\bar{X}) + \mathbb{E}[\bar{X}]^2
$$

Since variance is a degree 2 homogeneous operator, we know:

$$
\text{Var}(\bar{X}) = \text{Var}\left(\sum_{i=1}^n \frac{1}{n} X_i \right) = \frac{1}{n^2} \text{Var}\left(\sum_{i=1}^n X_i \right)
$$

Since each $ X_i $ is independent of each other, $ \text{Var}\left(\sum_{i=1}^n X_i \right) = \sum_{i=1}^n \text{Var}(X_i) $. Therefore, we can bring out the summation, and based on the assumption that $ \text{Var}(X_i) = \sigma^2 $, we have:

$$
\frac{1}{n^2}\text{Var}\left(\sum_{i=1}^n X_i \right) = \frac{1}{n^2} \sum_{i=1}^n \text{Var}(X_i) = \frac{1}{n^2} \sum_{i=1}^n\sigma^2 = \frac{1}{n^2} n\sigma^2 = \frac{\sigma^2}{n}
$$

And $ \mathbb{E}[\bar{X}] = \mu $, so:

$$
\mathbb{E}[\bar{X}^2] = \frac{\sigma^2}{n} + \mu^2
$$

### 6. **Substituting Back**:

Substitute these into our expectation:

$$
\mathbb{E}[S^2_{\text{biased}}] = (\sigma^2 + \mu^2) - \left(\frac{\sigma^2}{n} + \mu^2\right)
$$

Simplifying:

$$
\mathbb{E}[S^2_{\text{biased}}] = \sigma^2 \left(1 - \frac{1}{n}\right)
$$

$$
\mathbb{E}[S^2_{\text{biased}}] = \frac{n-1}{n} \sigma^2
$$

### 7. **Conclusion**:

The expectation of the biased sample variance estimator is:

$$
\mathbb{E}[S^2_{\text{biased}}] = \frac{n-1}{n} \sigma^2
$$

This shows that $ S^2_{\text{biased}} $ underestimates the true population variance $ \sigma^2 $ by the factor $ \frac{n-1}{n} $. As $ n $ increases, this bias becomes smaller, but for smaller $ n $, the bias is more significant.

---

Now, based on these calculations, we try to have the expectation of the sample variance correspond with the population variance. This way, we are "more correct on average". So, we define the unbiased sample variance estimator as:

$$
S^2_{\text{unbiased}} := \frac{n}{n-1}S^2_{\text{biased}} = \frac{1}{n-1} \sum_{i=1}^n (X_i - \bar{X})^2
$$

Nice! Finally, the expectation of the unbiased sample variance estimator is:

$$
\mathbb{E}[S^2_{\text{unbiased}}] = \sigma^2
$$
