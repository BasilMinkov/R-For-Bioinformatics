# Wassily Minkow, HW1

# Import data

df <- read.csv("/Users/wassilyminkow/Scripts/R/CourseR/1/hw1.txt", sep="")
gen_names <- colnames(df)

# Tasks

# 1. List of gene pairs with significant linear correlation: CPY14 VS RMD4

# T-test of the correlation may help to find out, whether there is a significant linear correlation.

paste(c(gen_names[1], "VS", gen_names[2]), collapse=" ")
cor.test(df[,1], df[,2], m = 'sp')
paste(c(gen_names[1], "VS", gen_names[3]), collapse=" ")
cor.test(df[,1], df[,3], m = 'sp')
paste(c(gen_names[2], "VS", gen_names[3]), collapse=" ")
cor.test(df[,2], df[,3], m = 'sp')

# Now it can be seen, there is a strong correlation (0.8351275) between CPY14 and RMD4 with p-value < 
# 2.2e-16. It is the only significant result.
# Now we can also prove it by plotting scatter plots with the regression.

par(mfrow=c(1,3))
title <- paste(c("Correlation p-value = ", toString(cor.test(df[,1], df[,2], m = 'sp')$p.value)), collapse=" ")
plot(df[,1], df[,2], xlab=gen_names[1], ylab=gen_names[2], sub=title, main=paste(c(gen_names[1], "VS", gen_names[2]), collapse=" "))
abline(lm(df[,2]~ df[,1]), col='red')
title <- paste(c("Correlation p-value = ", toString(cor.test(df[,1], df[,3], m = 'sp')$p.value)), collapse=" ")
plot(df[,1], df[,3], xlab=gen_names[1], ylab=gen_names[3], sub=title, main=paste(c(gen_names[1], "VS", gen_names[3]), collapse=" "))
abline(lm(df[,3]~ df[,1]), col='red')
title <- paste(c("Correlation p-value = ", toString(cor.test(df[,2], df[,3], m = 'sp')$p.value)), collapse=" ")
plot(df[,2], df[,3], xlab=gen_names[2], ylab=gen_names[3], sub=title, main=paste(c(gen_names[1], "VS", gen_names[3]), collapse=" "))
abline(lm(df[,3]~ df[,2]), col='red')

# The first graph is the additional prove to the linear dependence of CPY14 and RMD4.

# 2. List of gene pairs with the significant differences in mean: CPY14 and RMD4; RMD4 and htVWQ.
# First we can see the difference in mean accross the sets.

for (i in 1:3){
  print(gen_names[i])
  print(summary(df[,i]))
}

# Here we can see, that CPY14 mean value is close to htVWQ one, but two other pairs have some
# stronger difference in the mean. 
# It can also be seen on the boxplot. 

par(mfrow=c(1,1))
boxplot(df, main="Gene Expression Boxplot")

# But we can not evaluate the significance. We can use Welch Two Sample t-test to do it. 

t.test(df[,1], df[,2])
t.test(df[,1], df[,3])
t.test(df[,2], df[,3])

# Here we solve the multiple comparison problem.

p.adjust(c(t.test(df[,1], df[,2])$p.value, t.test(df[,1], df[,3])$p.value, t.test(df[,2], df[,3])$p.value))

# Here we can see that there are significant differences between CPY14 and RMD4; 
# and between RMD4 and htVWQ.
# But let's look at the densities of the sets. 

den1=density(df[,1])
den2=density(df[,2])
den3=density(df[,3])
par(mfrow=c(1,1))
plot(den1,type="l",col="red")
lines(den2,col="green")
lines(den3,col="blue")

# It seems that the distribution of the sets is not normally distributed. So, in this case, we
# would better use Wilcox test to compute significance. 

wilcox.test(df[,1], df[,2])
wilcox.test(df[,1], df[,3])
wilcox.test(df[,2], df[,3])

# And here we also solve the multiple comparison problem. 

p.adjust(c(wilcox.test(df[,1], df[,2])$p.value, wilcox.test(df[,1], df[,3])$p.value, wilcox.test(df[,2], df[,3])$p.value))

# According to these tests we can see the significant difference between all the datasets. But the 
# strongest one is anyway between 1st and 2nd; between 2st and 3rd.