# Wassily Minkow, HW2


# Tasks


# 1. Pi estimation. 

# Functions

point.in.circle <- function(x, y){
  logical <- (x-0)**2 + (y-0)**2 <= 1
  return(logical)
}

# Variables 

p.theoretical <- pi # propability theoretical = Scrcl/Ssqr = pi/4
steps <- 100000
dots.x = runif(steps, -1, 1)
dots.y = runif(steps, -1, 1)

# Compute using cycle

counter = 0
for (i in 1:steps){
  counter = counter + point.in.circle(dots.x[i], dots.y[i])
}

# Compute without cycle

counter <- sum(point.in.circle(dots.x, dots.y))

# Compute abs error

p.empirical <- 4*(counter / steps)
paste("Abs Error:", toString(abs(p.empirical - p.theoretical)), sep = " ")


# 2. Absolut difference as sample number plot.

x = seq(10000, 1000000, 5000)
y = 1:length(x)

for (i in 1:length(x)){
  dots.x = runif(x[i], -1, 1)
  dots.y = runif(x[i], -1, 1)
  y[i] <- 4*sum(point.in.circle(dots.x, dots.y)/x[i])
}

par(mfrow=c(1,1))
plot(x, abs(y-pi), t="l", main="Absolut Difference (Sample Number)")
