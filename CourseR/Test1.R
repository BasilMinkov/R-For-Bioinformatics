
euc.dist <- function(x1, x2) sqrt(sum((x1 - x2) ^ 2))

plot.graph = function(x, y, max.col, min.col, max.size, min.size, max.dist)
{
  colfunc <- colorRampPalette(c(min.col, max.col))
  
  dist.mx = matrix(rep(0, n*n), nrow=n, ncol=n)
  col.mx = matrix(rep(0, n*n), nrow=n, ncol=n)
  
  for (i in 1:n){
    for (j in 1:n){
      dist.mx[i,j] = euc.dist(c(x[i], y[i]), c(x[j], y[j]))
    }
  }
  
  t = apply(dist.mx, 2, function(x) length(x[x < max.dist])) -1
  t0 = min(t)
  tn = max(t)
  x0 = min.size
  xn = max.size
  eges = (((xn-x0)/(tn-t0))*t+((x0*tn-xn*t0)/(tn-t0)))
  
    
  lens = sort(dist.mx[dist.mx < max.dist])
  lens = lens[lens != 0]
  cols = colfunc(length(lens))
  
  for (i in 1:length(lens)){
       col.mx[dist.mx == lens[i]] = cols[i]
  }
  col.mx[col.mx == "0"] = "#00000000"
  
  par(mfrow=c(1,1))
  
  plot(x[1], y[1], 
       xlim = c(min(x), max(x)), 
       ylim = c(min(y), max(y)),
       xlab = "X",
       ylab = "Y",
       type="p", cex=eges[1])
  
  for (i in 2:n) {
    lines(x[i], y[i], type="p", cex=eges[i])
  }
  
  for (i in 1:n){
    for (j in 1:n){
    lines(c(x[i], x[j]),  c(y[i], y[j]), type="l", col=col.mx[i, j])
    }
  }
}

###########################

n = 25
max.dist = 0.1
max.col = "red" 
min.col = "blue"
max.size = 5
min.size = 1
x = seq(0, 1, by=0.02)
y = sin(20*x)

plot.graph(x, y, max.col, min.col, max.size, min.size, max.dist)
  
