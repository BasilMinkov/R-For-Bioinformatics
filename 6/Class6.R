library(ape)
dna = paste(read.dna("/Users/wassilyminkow/Scripts/R/CourseR/4/sequence.fasta", format="fasta", as.character=TRUE), collapse = "")
dna1 = unlist(strsplit(dna, split = ""))

tr = c(a="t", t="a", g="c", c="g")
dna2 = tr[dna1]
dna1[c(1:10)]
dna2[c(1:10)]

####

x = seq(0,5, length.out = 20)
y = 1 - exp(-x)
y = rnorm(length(y), y, 0.1)
plot(x, y)
par(mfrow=c(2,3))

types = c("p", "l", "b", "s", "S", "h")
sapply(types, function(t) plot(x, y, t))

par(mfrow=c(1,1))
plot(x, y, log='xy')       

par(mfrow=c(1,1))
plot(1, t='n', xlim=c(0,1), ylim=c(0,6))
for (i in 1:6) lines(0:1, c(i,i), lty=i, lwd=i)
plot(1, t='n', xlim=c(0,1), ylim=c(0,6))
for (i in 1:6) lines(0:1, c(i,i), lty=i, lwd=i, type="b")

x = rep(1:10, times=10)
y = rep(1:10, each=10)
plot(x,y)

plot(x,y, pch=0:24, col="#0000FF")
plot(x,y, pch=0:24, col="#0080FF")
plot(x,y, pch=0:24, col="#0000FF80")
rgb(0,1,1,alpha=0.5)
col2rgb("#0000FF80", alpha=T)
heat.colors(10)
rainbow.colors(10)
col = rainbow(10)
?brewer.pal.info

plot(x, y, col=col, pch=19, cex=3)

plot(1, t="n", xlim=c(0,100), ylim=c(0,100))
lines(0:100, 90+sin(0:100/10)*10)
x = 0:10 * 10
y = 90 + cos(0:10)*10
points(x, y, pch=19)
segments(x, y-3, x, y+3)
text(x,y,paste0("x=", x), adj=c(-0.2, 1))

polygon(c(0,10,20), c(0,20,0), col="#0000FF80", border="#FF0080")
x=seq(0,2*pi, length.out =  200)
polygon(30+10*sin(x), 30+10*cos(x), col="red", den=10, angle=-45)
rect(40, 40, 60, 60)
abline(h=0:5*20)
abline(h=0:5*50, lty=2, col="red")
abline(v=0:5*50, lty=2, col="green")
grid()
dev.off()

plot(1)
par(tck=-0.01, mgp=c(1.3, 0.2, 0), mar=c(2.5, 2.5, 1.5, 0))
plot(1, xlab = 'x-axis', ylab='y-axis', main="Main\nsubmain")
legend('topleft', col=c("red", "blue"), legend = c('Dog', "Cat"), title = "Animals", cex=2, pt.cex=3, lwd=2)

plot(1)
par(mfrow=c(2, 4))
layout.show(8)
par(mfcol=c(2, 4))
layout.show(8)
m = matrix(c(1,1,2,1,1,2,3,4,5, ncol=3))
m = 

