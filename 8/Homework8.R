# 1.

df = read.csv("/Users/wassilyminkow/Scripts/R/CourseR/1/counts5.txt", sep="")
df = df/dim(df)[1]

# 2. 

a = function(i) {
  tryCatch(t.test(df[i, c(1:4)], df[i, c(5:8)])$p.value, error=function(x) return(1))
}

t.p.v = dim(df)[1]
t.p.v = sapply(1:dim(df)[1], a)
t.p.v[is.na(t.p.v)] = 1

# 3. 

n_perm = 100
perm.t.p.v = matrix(0, nrow = n_perm, ncol = dim(df)[1])

b = function(i) {
  tryCatch(t.test(df[i, s[c(1:4)]], df[i, s[c(5:8)]])$p.value, error=function(x) return(1))
}

for (perm in 1:n_perm){
  print(perm)
  s = sample(c(1:8))
  perm.t.p.v[perm, ] = sapply(1:dim(df)[1], b)
}

for (i in 1:dim(df)[1]){
  perm.p.v[i] = sum(perm.t.p.v[,i] < t.p.v[i])/100
}

FP = sum(t.p.v<0.05)/sum(perm.p.v>0.05)
TP = sum(t.p.v<0.05)/sum(perm.p.v<0.05)

FDR = FP/(FP+TP) 
