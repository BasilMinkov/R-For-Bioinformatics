# 1 

n_th = function(vector, n=1) return(sort(vector, decreasing = T)[n])

n = 50
n_th(runif(100, 1, 100), n)

# 2

norm1 = function(matrix, dim=2, stat=mean, fun='/',...) sweep(matrix, dim, apply(matrix, dim, stat,...), fun) # normalise

m = matrix(rnorm(100, 50, 10), ncol=10)
m

norm1(m, dim=2, stat=max)

# 3 

m = matrix(rnorm(100, 50, 10), ncol=10)
m

stats = function(x) quantile(x, c(0.75))

norm1(m, dim=2, stat = quantile,prob=0.75)

         