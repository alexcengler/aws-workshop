library(parallel)
library(doParallel)
library(caret)

cl <- makePSOCKcluster(5)
registerDoParallel(cl)


set.seed(1318)
n <- 500
p <- 50
X <- matrix(rnorm(n*p), nrow = n, ncol = p)
colnames(X) <- paste("X", 1:p, sep="")
X <- data.frame(X)
Y <- X[, 1] + sqrt(abs(X[, 2] * X[, 3])) + X[, 2] - X[, 3] + rnorm(n)


rfFit <- function(i, Y, X) {
    out <- randomForest(y = Y[-i], x = X[-i, ], xtest = X[i, ])
    return(out$test$predicted)
}


## All subsequent models are then run in parallel
model <- train(y ~ ., data = training, method = "rf")

## When you are done:
stopCluster(cl)


nCores <- 3 
registerDoParallel(nCores) 

resultSet <- foreach(i = 1:30) %dopar% {
  
  cat('Starting ', i, 'th job.\n', sep = '')
  output <- rfFit(i, Y, X)
  print(output)
  output
}




## doMC - parallel backend for foreach package
## not available on Windows, since it uses the fork system call
## Thus only available on Linux Mac OSx/Unix
## Docs: https://cran.r-project.org/web/packages/doMC/vignettes/gettingstartedMC.pdf

library(foreach)
library(doMC)
registerDoMC()
x <- matrix(runif(500), 100)
y <- gl(2, 50)


## .multicombine=TRUE calls `combine` on the results once (not five times).
rf <- foreach(ntree=rep(25000, 6), .combine=combine, .multicombine=TRUE,
              .packages='randomForest') %dopar% {
    randomForest(x, y, ntree=ntree)
}