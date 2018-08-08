library(SparseTSCGM)
library(qgraph)
example_data <- sim.data(model = "ar1", 
                         time = 50,
                         n.obs = 10,
                         n.var = 14)

res_lasso <- sparse.tscgm(data = example_data$data1, 
                          lam1 = NULL, 
                          lam2 = NULL, 
                          nlambda = NULL, 
                          model = "ar1", 
                          penalty = "lasso", 
                          optimality = "bic_mod", 
                          control=list(maxit.out = 10, maxit.in = 100))

res_scad <- sparse.tscgm(data = example_data$data1, 
                         lam1 = NULL, 
                         lam2 = NULL, 
                         nlambda = NULL, 
                         model = "ar1", 
                         penalty = "lasso", 
                         optimality = "bic_mod", 
                         control=list(maxit.out = 10, maxit.in = 100))
par(mfrow = c(1, 2))
qgraph(example_data$gamma, 
       title = "Real network", 
       layout = "circular")

qgraph(res.tscgm$gamma, 
       title = "Estimated network", 
       layout = "circular")
par(mfrow = c(1, 1))
