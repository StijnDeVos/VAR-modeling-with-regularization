library(glmnet)

x1 <- rnorm(100)
x2 <- rnorm(100, mean = -1, sd = 3)*x1
y <- 1 + x1 + 2*x2 + rnorm(100, sd = 2)
data <- data.frame(x1 = x1, x2 = x2, y = y)
pairs(data)

simple_lm <- lm(y ~ x1 + x2)
coefficients(simple_lm)

X = matrix(NA, ncol = 2, nrow = 100)
X[, 1] <- data$x1
X[, 2] <- data$x2
penalized_lm <- glmnet(x = X, y)
cv <- cv.glmnet(x = X, y = y)

