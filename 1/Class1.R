
# Print "hello world" to console. 
print("hello world")

# Get info about function.
?rnorm 

# Random generation for the normal distribution. Generates 300 values.
d = rnorm(300)

# Plot values.
plot(d)

# 
d[1:10]
summary(d)
hist(d)
den=density(d)

plot(den, ylim=c(0,max(y,den$y)))
x = seq(-3, 3, length.out = 100)
y = dnorm(x)
hlines(x, y, col='red')

y = rnorm(length(d), mean = d + 1, sd=abs(d))
plot(d, y)

dnorm(300, log = T)

d = cbind(d, y) # concat two arrays
d[1:4,]

par(mfrow=c(2,2))
plot(d, xlab="original data", ylab = "new data")
abline(lm(d[,2]~ d[,1]), col='red')

par(mfrow=c(1,1))
dev.off()

plot(density(d[,2])) #
lines(density(d[,1]), col='red') #

mean(d[,2])

# d = cbind(rnorm(300), rnorm(300))
t.test(d[,1], d[,2])$p.value
wilcox.test(d[,1], d[,2])$p.value

####

fisher.test(table(first = d[,1] > 0, second = d[,2] > 0))
cor(d[,1], d[,2], m = 'sp')
cor(1:2, 2:3)
options(digits = 8) # 
cor.test(d[,1], d[,2], m = 'sp')$p.value

###
getwd()
setwd('../')

write.table(d, file = 'test.tab', sep = '\t')
ls()
rm(d)
d = read.table('test.tab')
save.image('all.RData')
rm(list = ls())
ls()
load('all.RData')
save(d,x,file="")
saveRDS(d, "d.RData")

new.d = readRDS('d.RData')

####
pdf('image1.pdf', width = 6, height = 6)
png('image1.png', width = 400, height = 400)
plot(d)
dev.off()
