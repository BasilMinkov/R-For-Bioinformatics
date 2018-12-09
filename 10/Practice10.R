# t + a + a^2 + t*a + t*a^2

# 1. 

df = read.csv("/Users/wassilyminkow/Scripts/R/CourseR/Data/hw6.counts.txt", sep="", check.names = F)
sum = df[c("XLOC_111636"), ]
drop = apply(df, 2, function(x) sum(x)) - sum
y = t(rbind(sum, drop))

# 2.

t = matrix(0, nrow = dim(df)[2])
age = matrix(0, nrow = dim(df)[2])
names = rownames(y)

for (i in 1:length(names)){
  ans = strsplit(names[i], split = "_")
  
  age[i] = as.numeric(ans[[1]][2])
    
  if (ans[[1]][1] == "brain") t[i] = 0
  else t[i] = 1
}

a = as.numeric(age)
t = as.numeric(t)

m = y ~ t + I(a^0.25) + I(a^0.5) + t:I(a^0.5) + t:I(a^0.25)

gm = glm(m, family='quasibinomial')
summary(gm)

s = seq(min(a), max(a), length.out = 1000)
pred.brain = predict(gm, type="response", newdata = data.frame(t=rep(0, 1000), a=s))
pred.liver = predict(gm, type="response", newdata = data.frame(t=rep(1, 1000), a=s))

plot(age[1:56], y[1:56,1]/y[1:56,2], col="darkorchid1", pch=18, ylim=c(0, 5e-4))
lines(s, pred.brain, col="darkorchid1")

points(age[-(1:56)], y[-(1:56),1]/y[-(1:56),2], col="cyan", pch=19)
lines(s, pred.liver, col="cyan")

# Dispersion parameter for quasibinomial family taken to be 436.7964