l = list(a=1:10, b=-1:3, c=2:301)
lapply(l,mean)
sapply(l,mean)
t(sapply(l, summary))
l$b[2]=NA
sapply(l, mean)
mean(l$b, na.rm=T)
sapply(l,mean,na.rm=T)
sapply(l, '[', 2)
x=1:10
x[1:2]
'['(x, 1:2)

l
sapply(l, function(x){x[seq(1, by = 3, to = length(x))]})
sapply(l, '[', c(T,F,F))
sapply(l,function(x)prod(abs(x), na.rm=T)^(1/length(x)))

m = matrix(rnorm(100, 10+rep(1:10, each=10)), ncol=10)
m[1:4,1:4]
apply(m,2,mean)
nf = apply(m, 2, max)
nf

sweep(m, 2, nf, '/') # normalise
# also with 'scale'

do.call(plot, list(x=1:10))
do.call(plot, list(x=1:10, y=sin(1:10))) # constructs and executes 
# a function call from a name or a function and a list of arguments to be passed to it.

t = apply(round(m), 1, paste, collapce=', ') 

do.call(rbind, lapply(strsplit(t, ','), as.numeric))

ifelse(runif(10)>0.5, 'Mars', 'Venus')
ifelse(runif(10)>0.5, paste0('Moon ', 1:10), 'Jupyter')

sex = ifelse(runif(10)>0.5, 'Male', 'Female')
height = ifelse(sex=='Male', rnorm(20, 182), rnorm(20, 172))

split(height, sex)

boxplot(height ~ sex)

data = data.frame(sex=sex, height=height, age=rnorm(20,35))
data

t = split(data, data$sex)
t

lapply(t, function(x) x[which.max(x$height), ])

split(as.matrix(data), data$sex)
split.data.frame(as.matrix(data), data$sex)

install.packages("plyr")
library(plyr)

laply(baseball)
laply(baseball, typeof)

laply(baseball, typeof, .progress = 'text')

install.packages('doMC')
library(doMC)

registerDoMC(16)
laply(baseball, typeof, .parallel = T)
system.time(l_ply(1:10, function(i)mean(rnorm(5e6))))
system.time(l_ply(1:10, function(i)mean(rnorm(5e6)), .parallel = T))


