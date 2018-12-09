TRUE == T
FALSE == F

a <- TRUE
3 -> a

a < -5 #  
a <-5 # 

NA # absent value
NULL # empty object
length(NA) # = 1
length(NULL) # = 0
x = 1:10
x[1] = NA
x[1] = NULL

a = 1
a = 'a'
a = "a"

new.var = 1

a = c(T, T)
length(a)
typeof(a)

vec = c(1, "1", TRUE)
typeof(vec)

T + F
T + 1.1 
as.character(1) + "a" # does not work
"a" + "a" # does not work

f = factor(c("f", "m", "f"))
f
f = factor(c("f", "m", "f"), levels = c("f", "m", "l"))
f
typeof(f) # int
table(f)
table(c("f", "f", "f"))

x = 1:10

attr(x, 'my.attr') = "new attr"
x
attr(x, "name") = paste0('name', 1:10) # better not to use. use name
x

names(x)[1] = 'new.name'
x = c(a=1, b=4, c=-1, d=-5, d=10)
x
names(x)

###
x[c(1,5,1)]
x
x[c("d")]
x
table(names(x))
table(table(names(x)))
x<0
x[x<0]
x
x[c(T,F)] # call in one lke a matrix of 0 and 1: 1 0 1 0 1
which(x<0)

x = runif(100, 0, 5)
sort(x)
y=sin(x)
plot(x,y,t='l')
o = order(x, decreasing = T)
o[1:10]
plot(x[o],y[o],t='l')

###

10 * 4
10^2
10**2
10%%3
10%/%3
10/3

10 != 3

T & F
T | F
T || F
c(T,T) || c(F,T)

1:10 + 1:5

###
i=0
while(i<4){
  print(i)
  i = i + 1
}
while(i<4){print(i); i = i + 1}

for (i in 1:10){
  cat(i, " hey ")
}

a = 1
a
a[2] = 10
a
a[10] = 2
a

sum(1:10 != 1:10)

a = character(10)

a = numeric(0)
system.time({for (i in 1:6000000){a[i] = i}})

a = numeric(6000000)
system.time({for (i in 1:6000000){a[i] = i}})