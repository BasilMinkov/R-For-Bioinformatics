# pick colours for the cylinders
col = mtcars$cyl
col[col == 4] = 116
col[col == 6] = 143
col[col == 8] = 17
col = colours()[col]

###############

par(mfrow=c(1,1))
plot(mtcars$disp, 
     mtcars$mpg, 
     col="black", 
     bg=col, 
     pch=21,
     cex=2,
     xlab="Displacement",
     ylab="Miles/(US) gallon")

points(mtcars$disp, 
     mtcars$mpg, 
     col=col, 
     pch=16,
     cex=2)

legend('topright', 
       legend = c('4', "6", "8"), 
       title = "# of cylinders", 
       cex=1, 
       pt.cex=1, 
       lwd=1, 
       pch=19,
       lty=NA,
       col=unique(col)[c(2, 1, 3)])

par(mfrow=c(1,1))
plot(1, t="n",
     xlab="Displacement",
     ylab="Miles/(US) gallon",
     xlim=c(0,max(mtcars$disp+50)), 
     ylim=c(0,max(mtcars$mpg+5)))

n_cyl = unique(mtcars$cyl)
cols = unique(col)[c(2, 1, 3)]

for (i in 1:3){
  theta = seq(0, 2 * pi, length=(100))
  x0 = mean(mtcars$disp[mtcars$cyl == n_cyl[i]])
  y0 = mean(mtcars$mpg[mtcars$cyl == n_cyl[i]])
  x = x0 + 2*sd(mtcars$disp[mtcars$cyl == n_cyl[i]]) * cos(theta)
  y = y0 + 2*sd(mtcars$mpg[mtcars$cyl == n_cyl[i]]) * sin(theta)
  code = col2rgb(cols[i])/255
  polygon(x, y, col=rgb(code[1], code[2], code[3], 0.5))
  text(x0, y0,paste0(n_cyl[i]), cex=2)
}

text(400, 30, "diameter is 2SD", cex=2)

###############

par(mfrow=c(1,1))
n_carb = sort(unique(mtcars$carb))
m = c(1:length(n_carb))
s = c(1:length(n_carb))

for (i in 1:length(n_carb)) {
  s[i] = sd(mtcars$mpg[mtcars$carb == n_carb[i]])
  m[i] = mean(mtcars$mpg[mtcars$carb == n_carb[i]])
}
s[is.na(s)] <- 0

plot(n_carb, m, type="b", pch = 19, ylim=c(0,40))
for (i in 1:length(n_carb)) {
  x = c(n_carb[i], n_carb[i])
  y = c(m[i]-2*s[i], m[i]+2*s[i])
  print(x)
  print(y)
  polygon(x, y)
}


