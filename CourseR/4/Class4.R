r = runif(1)
if (r>0.5){
  print("yes")
}else{
  print("no")
}

repeat{
  cat(i)
  i = i + 1
  if(i > 4) break()
}

my.rbinom = function(n, p=0.5)
{
  if(n < 0) return(NA)
  sum(runif(n) < p)
}

my.rbinom(100, 0.1)
plot(1:10, sin(1:10), type="l")

funs = list(mean, sd, var, median)

for (f in funs) print(f(1:10))

power.factory = function(n)
{
  function(d) d^n
}

p10 = power.factory(10)
p10(2)
plot(1:10, xlab='x-axis')

plotSin = function(x, ...) plot(x, sin(x), ...)
plotSin(1:100/10, t="t", col='red', lwd=3)

1+1
"+"(1,1)
"["(1:20, 3)

####

attributes(mtcars)
class(mtcars)

x = 1:10
class(x) = 'my'
length.my = function(x) runif(1)
length(x)

x = 1:10
y = x ^ 2
m = lm(y~x)
plot(m, which=1)

###

text = c('hello', 'world')
substring(text,1,2)
strsplit(text, 'r|l')
strsplit(text, '')
paste(text[1], text[2], sep='_')
paste0(text[1], text[2], sep='')
paste(text, text)
paste0(text, text)
paste(text, collapse = ' ')

sub('l', 'r', text)

grepl('ll', text)

###

install.packages('ape')
library(ape)
t = nj(matrix(rnorm(100, 1:10), ncol=10))