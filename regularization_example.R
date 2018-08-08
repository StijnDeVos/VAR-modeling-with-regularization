library(glmnet)

# Some fake data:
x1 <- rnorm(100)
x2 <- rnorm(100, mean = -1, sd = 3)*x1
y <- 1 + x1 + 2*x2 + rnorm(100, sd = 2)
data <- data.frame(x1 = x1, x2 = x2, y = y)
pairs(data)

# simple linear regression without regularization:
simple_lm <- lm(y ~ x1 + x2)
coefficients(simple_lm)

# regression using elastic-net regularization:
cv <- cv.glmnet(x = cbind(x1, x2), y = y)

# This is the optimal value for lambda according to cross-validation:
cv$lambda.min

# fitting a penalized regression model using the optimal value for lambda:
penalized_lm_opt <- glmnet(x = X, y, lambda = cv$lambda.min)
coef(penalized_lm_opt)
