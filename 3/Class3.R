#####

x = (1:10)^1
x[-(2:3)]
x[-1] - x[-length(x)]

#####

x = list(1:3, 'a', c(T,F,T), c(2.3,1))
str(x)

x = list(list(1,2), 3:4)
str(x)
y = c(list(1,2), 3:4)
str(y)

unlist(y) 

####

x = list(int=1:3, 
         char='a',
         var3=c(T,F,T),
         var4=c(2.3, 1))

names(x)[1:2] = c('var1', 'var2')
x[1:2]
x['var3']
x[c(T,F,T,F)]
x[1]

x[[1]] # identical thing as
x$var1 

####

a = matrix(1:3, ncol=3, nrow=4)
a = matrix(1, ncol=3, nrow=4)
a

length(a)
ncol(a)
nrow(a)
dim(a)

rownames(a) = c("r1", "r2", "r3", "r4")
colnames(a) = c('n1', 'n2', 'n3')
a

attributes(a)

x=1:10
#attr(x, 'dim') = c(5,2)
X = matrix(x,ncol=2)

####
a[1:2,]
a[1:2,c(3,1)]

a[c('r1', 'r4'), c('c2', 'c3')]

x=1:10 
x[11]

a[a[,2]>6,]
dim(a[1,,dropdrop=FALSE])
dim(a[1,])

a > 4
a + 5

a / 1:4

which(a>5, arr.ind = T)

a = matrix(NA, ncol=5, nrow=5)
a
a=rbind(a,1:3)
a=rbind(a,a)
a
a=cbind(a,NA)
a

####
x=data.frame(a = 1:3, c('a', 'b', 'c'), check.names = F)
x
cbind(a = 1:3, c('a', 'b', 'c'))
dim(x)
ncol(x)
nrow(x)
colnames(x)
rownames(x) = c('r1', 'r2', 'r3')
x

is.na(c(NA,1,NA))

x['r1',]
x$a
x[[3]]
as.matrix(x)

options(stringsAsFactors = FALSE)

