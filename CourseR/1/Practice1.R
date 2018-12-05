###

array1 <- rpois(200, lambda = 0.5)
array2 <- rpois(200, lambda = 3)
summary(array1)
summary(array2)

###

den1 <- density(array1)
den2 <- density(array2)

plot(den1,type="l",col="red", xlim=c(-1, 10))
lines(den2,col="green")

###

d = cbind(array1, array2)
plot(d, xlab="array1", ylab = "array2")
abline(lm(d[,2]~ d[,1]), col='red')
cor(d[,1], d[,2], m = 'sp')
cor.test(d[,1], d[,2], m = 'sp')$p.value

###

write.table(d, file = 'pois.tab', sep = '\t')



