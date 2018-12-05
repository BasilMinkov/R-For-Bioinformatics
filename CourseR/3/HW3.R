# Wassily Minkow, HW3

#####################################

# 1.1 

typeof(mtcars) # list => data frame 

# 1.2

typeof(mtcars[, 2]) # double => vector 

# 1.3

n_cyl = mtcars[c("Fiat 128"), c("cyl")]
n_cyl # 4

# 1.4

mtcars[mtcars$cyl == n_cyl, ]

# 1.5 

mtcars[mtcars$cyl == min(mtcars$cyl), ]

# 1.6 

cm = cor(mtcars)
cm

# 1.7

typeof(cm) # double => matrix

# 1.8 

cm[c("mpg"),] < -0.7 # cyl, disp, hp, wt

#####################################

# 2.1 

df = rnorm(100, mean = 40, sd = 10)

# 2.2 

df3 = df[seq(1, length(df), 3)]

# 2.2 

df5 = df[-seq(1, length(df), 5)]

# 2.3 

df[as.integer(df)%%2 == 0]

#####################################

# 3

# G stands for generation. Integer is the number of parent in generation. 
# 0 means, that is the current generation for that leave. 
# -1 means, that the leaf will give birth to leaf of this generation.

df = data.frame("G1"=c(1, 1, 1, 1, 1), "G2"=c(1, 1, 1, 2, 2), "G3"=c(0, 1, 1, 0, 0), "G4"=c(-1, 0, 0, -1, -1), "Leaf"=c("a", "b", "c", "d", "e"))
df

df$Leaf
df[df$G2 == 1, ]
df[df$G3 == 1, ]
