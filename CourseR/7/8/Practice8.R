# 1

N = 10000
M = 5
healthy = matrix(rnorm(N*M,mean=0,sd=1), N, M) 

# 2

N1 = 500
N2 = 9500
M = 5
cancer = rbind(matrix(rnorm(N1*M,mean=3,sd=1), N1, M), matrix(rnorm(N2*M,mean=0,sd=1), N2, M))

# 3

p.values = 1:10000
for (i in 1:10000) p.values[i] = t.test(healthy[i,], cancer[i,])$p.value
sum(p.values < 0.05)

# 4

TP = 500
FP = sum(p.values[501:length(p.values)] >= 0.05) 
FN = sum(p.values[501:length(p.values)] < 0.05)

FDR = FP/(FP+TN)
FDR

# 5 

co.p.values = p.adjust(p.values, method="BH") 

new.p = max(p.values[co.p.values < 0.05])
sum(p.values < new.p)

# 6 

co.p.values = p.adjust(p.values, method="bonferroni") 

new.p = max(p.values[co.p.values < 0.05])
sum(p.values < new.p)

