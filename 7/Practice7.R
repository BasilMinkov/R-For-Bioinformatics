rotate <- function(x) t(apply(x, 2, rev))
cors = rotate(cor(mtcars))
dig = 1

image(cors,xaxt='n', yaxt='n')

ax = seq(0,1,by=1/(ncol(cors)-1))
axis(side=1, at=ax, colnames(cors), las=2)
ay = seq(0,1,by=1/(nrow(cors)-1))
axis(side=2, at=ay, rownames(cors), las=1)

for (i in 1:length(ax)){
  for (j in 1:length(ay)){
    text(ax[i], ay[j], round(cors[i, j], 1), cex=dig)
  }
}

imagePlus = function(cors, dig, ...){
  
  image(rotate(cors),xaxt='n', yaxt='n')
  
  ax = seq(0,1,by=1/(ncol(cors)-1))
  axis(side=1, at=ax, (colnames(cors)), las=2)
  ay = seq(0,1,by=1/(nrow(cors)-1))
  axis(side=2, at=ay, rev(rownames(cors)), las=1)
  
  for (i in 1:length(ax)){
    for (j in 1:length(ay)){
      text(ax[i], ay[j], round(rotate(cors[j, i]), 1), cex=dig, ...)
    }
  } 
}

dev.off()

cors = cor(mtcars)
imagePlus(cors, dig=1)
cors[1:3,1:3]
