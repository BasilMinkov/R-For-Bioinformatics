par(fig=c(0,0.8,0,0.8), oma=c(0,0,0,0),
    mar=c(2,2,0,0))
x=rnorm(100)
y=rnorm(100, x)
plot(x, y, pch=19)
par(fig=c(0.05, 0.4, 0.5, 0.8), new=TRUE)
plot(density(x), xaxt='n', yaxt='n', main = '', ylab='', xlab = '')

par(fig=c(0,0.8, 0.8, 1), new=TRUE)
boxplot(x, horizontal = T)

par(fig=c(0.8, 1, 0, 0.8), new=TRUE)
boxplot(x, horizontal = F)

dev.off()

boxplot(lapply(1:4, function(i) rnorm(100, i)),
        outline = F,
        notch = T, 
        col = heat.colors(4),
        ylim=c(0,10))

boxplot(lapply(1:4, function(i) rnorm(100, i+3)),
        outline = F,
        notch = T, 
        col = heat.colors(4),
        add=T)

br = seq(-4, 7.5, by=0.1)
x = c(rnorm(1000, 0), rnorm(1000,3))
y = c(rnorm(1000, 0), rnorm(1000,4))
h=hist(y, breaks = br, density=30, col='red')
h=hist(x, breaks = br, add=T)
h$breaks
length(h$breaks)

plot(h)

d = density(x)
plot(d)
h=hist(x, breaks = br, density=30, col='red', freq=F, add=T)

dev.off()

d = density(x, bw=0.1, from=-3.8, to = 6)
h=hist(x, breaks = br, density=30, col='red', freq=F)
# d$y = d$y * length(x) * (h$breaks[2]-h$breaks[1])
lines(d)

m = round(x)
f = rep(c('g1', 'g2'), each=1000)
t = table(m, f)
barplot(t(t), beside = T, col=rainbow(nrow(t)))

pie(t[,1])

x = round(rnorm(1000))
y = round(rnorm(1000, x))

t = table(x, y)
image(log(t+1), col=rev(heat.colors(100)))
image(x=1:nrow(t), y=1:ncol(t), z=t, col=c('gray', 'yellow', 'red'), breaks=c(0,1,15,10000))

x = seq(0, 5, length.out = 100)
y = 1 - exp(-x) + rnorm(100, sd=0.1)
plot(x, y, t='l')
lines(x, smooth(y), col='red', lwd=2)

m = smooth.spline(x, y, df=6)
p = predict(m)
lines(m, col='blue', lwd=2)

x2 = x^2
lm = lm(y ~ x + x2)

lp = predict(lm)
lines(m,col='orange', lwd=2)

x=1:5
y=x^2
plot(x,y)
m = smooth.spline(x, y, df=3)
xx = seq(1, 5, length.out = 100)
p = predict(m,newdata=list(x=xx, x2=xx^2))
p = predict(m)
lines(xx, col='red')

cor = cor(mtcars)
o = order(cor[1,])
image(c[o,o])
heatmap(1-cor, symm=T, col=terrain.colors(1000), distfun = function(x) as.dist(x))

plot(x, y)
pairs(mtcars[, 1:3], pch=19, col='red', 
      panel=function(x,y,...){
        points(x,y,...) 
        abline(lm(y~x),col='blue')})

a = c(0, 0.5, 0.7, 5, 10, 50)
h = rnorm(length(a), 50+a*2.5)
r = rnorm(length(a), 5+a/40)

plot(log(a+1), h, xaxt='n')
at = c(0, 1, 4, 10, 50)
axis(1, log(at+1), paste0(at, 'y'))

points(log(a+1), r/max(r)*max(h), col='red')
at = c(4:6)
axis(4, at/max(r)*max(h), at, col='red')
mtext('radius', 4, 2)

