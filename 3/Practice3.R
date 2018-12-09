############################################################

df = matrix(NA, ncol=4, nrow=3)
rownames(df) = c("N1", "N2", "N3")
colnames(df) = c("First name", "Surname", "Age", "Sex")
df

df[1, 1:4] <- c("Vasya", "Minkov", 22, "M")
df[2, 1:4] <- c("Kazimir", "Malevich", 35, "M")
df[3, 1:4] <- c("Ellochka", "Ludoedochka", 20, "F")
df

df[df[, "Surname"] == "Minkov",]

df[df[, "Sex"] == "M",]

df[rownames(df)=="N2"]

####

df = data.frame("Firstname" = c("Vasya", "Petya", "Masha"), "Surname"=c("Minkov", "Petrov", "Marieva"), "Age"=c(12, 13, 14), "Sex"=c("M", "M", "F"))
df

df[df[, "Surname"] == "Minkov",]

df[df[, "Sex"] == "M",]

df[2,]


############################################################

sick = matrix(runif(24*5, 39, 41), ncol=5, nrow=24)
colnames(sick) = c("N1", "N2", "N3", "N4", "N5")
rownames(sick) = c(1:24)
sick[,2] > 40


############################################################

set = runif(100, 0, 7)
set[sin(set)>0]
ms = matrix(set, 10, 10)
ms

ms = ms[ms[, 6] > 4,]
ms

a = 0
for (i in 1:ncol(ms)){
  if (sum(ms[, i] < 1)>0)
}

ms[, a]
