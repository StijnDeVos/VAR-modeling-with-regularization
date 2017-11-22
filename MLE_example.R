require(glmnet)

N <- 100
x1 = runif(N)
x2 = runif(N)
y = 3 * x1 + 2 * x2 + rnorm(N)
data <- data.frame(x1, x2, y)
mod_example <- lm(y ~ x1 + x2 - 1, data = data)
summary(mod_example)

X <- matrix(NA, ncol = 2, nrow = N)
X[, 1] <- x1
X[, 2] <- x2
fit <- glmnet(X, y, alpha = 0)

tLL <- fit$nulldev - deviance(fit)
k <- fit$df
n <- fit$nobs
AICc <- -tLL+2*k+2*k*(k+1)/(n-k-1)
AICc