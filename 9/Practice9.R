# 1. 

df = read.csv("/Users/wassilyminkow/Scripts/R/CourseR/1/counts5.txt", sep="")
df = df[apply(df, 1, function(row) all(row !=0 )),]
# df = df/dim(df)[1]

# 2. 

cont = sapply(1:dim(df)[1], function(x) sum(df[x, c(1:4)]))
exp = sapply(1:dim(df)[1], function(x) sum(df[x, c(5:8)]))

FisherGoesHard = function(cont, exp) 
  {
  cs = sum(cont) 
  ss = sum(exp)
  f.p.v = sapply(1:length(exp), function(i) fisher.test(t(matrix(c(cont[i], exp[i], cs-cont[i], ss - exp[i]), ncol=2)))$p.value)
  return(f.p.v)
}

f.p.v = FisherGoesHard(cont, exp)

# 3. 

adj.f.p.v = p.adjust(f.p.v, "BH")

sum(adj.f.p.v < 0.05)

# 4.

n_perm = 10 

perm.f.p.v = matrix(0, length(exp), n_perm)

for (perm in 1:n_perm){
  print(perm)
  s = sample(c(1:8))
  p_cont = sapply(1:dim(df)[1], function(x) sum(df[x, s[c(1:4)]]))
  p_exp = sapply(1:dim(df)[1], function(x) sum(df[x, s[c(5:8)]]))
  perm.f.p.v[, perm] = FisherGoesHard(p_cont, p_exp)
}

for (i in 1:length(f.p.v)){
  p.p.v[i] = sum(perm.f.p.v[i, perm] < f.p.v[i])/length(f.p.v)
}

# 5. 

thr = max(adj.f.p.v[adj.f.p.v <= 0.05])

# sum(p.p.v < thr)

apply(perm.f.p.v<thr,2,sum)