

# 1 

df = read.csv("/Users/wassilyminkow/Scripts/R/CourseR/7/9/hw6.counts.txt", sep="")

# 2

df = as.data.frame(t(apply(df, 2, function(x) x*1e6/sum(x))))

# 3 

df = scale(df)
df[is.nan(df)] = 0
df = as.data.frame(t(df))

# 4 

pca = prcomp(t(df))

dev = round(pca$sdev/sum(pca$sdev)*100,1)

liver_col = colorRampPalette(c("darkorchid1", "darkorchid4"))
liver_col = liver_col(56)
brain_col = colorRampPalette(c("cyan", "cyan4"))
brain_col = brain_col(length(c(56:length(pca$x[,1]))))

cr = cor(df, use = 'pair', method = 'p')

par(mfrow=c(2,3))

# pca and mds

plot(pca$x[,1][c(1:56)],
     pca$x[,2][c(1:56)],
     pch=18,
     cex=c(1:56)/30,
     type="p",
     col=liver_col,
     main='PCA',
     xlab=paste('PC1(', dev[1],'%)',sep=''),
     ylab=paste('PC2 (', dev[2],'%)',sep=''),
     xlim=c(min(pca$x), max(pca$x)),
     ylim=c(min(pca$x), max(pca$x)))

lines(pca$x[,1][c(56:length(pca$x))],
      pca$x[,2][c(56:length(pca$x))],
      type="p",
      pch=19,
      cex = (c(56:length(pca$x[,1]))-55)/30,
      col=brain_col)

plot(pca$x[,3][c(1:56)],
     pca$x[,4][c(1:56)],
     pch=18,
     cex=c(1:56)/30,
     type="p",
     col=liver_col,
     main='PCA',
     xlab=paste('PC3(', dev[3],'%)',sep=''),
     ylab=paste('PC4 (', dev[4],'%)',sep=''),
     xlim=c(min(pca$x), max(pca$x)),
     ylim=c(min(pca$x), max(pca$x)))

lines(pca$x[,3][c(56:length(pca$x))],
      pca$x[,4][c(56:length(pca$x))],
      type="p",
      pch=19,
      cex = (c(56:length(pca$x[,1]))-55)/30,
      col=brain_col)

mds = cmdscale(1-cr, k=4)

plot(mds[,1][c(1:56)],
     mds[,2][c(1:56)],
     pch=18,
     cex=c(1:56)/30,
     type="p",
     col=liver_col,
     main='MDS',
     xlab="MDS1",
     ylab="MDS2",
     xlim=c(min(mds), max(mds)),
     ylim=c(min(mds), max(mds)))


lines(mds[,1][c(56:length(pca$x))],
      mds[,2][c(56:length(pca$x))],
      type="p",
      pch=19,
      cex = (c(56:length(pca$x[,1]))-55)/30,
      col=brain_col)

plot(mds[,3][c(1:56)],
     mds[,4][c(1:56)],
     pch=18,
     cex=c(1:56)/30,
     type="p",
     col=liver_col,
     main='MDS',
     xlab="MDS3",
     ylab="MDS4",
     xlim=c(min(mds), max(mds)),
     ylim=c(min(mds), max(mds)))

lines(mds[,3][c(56:length(pca$x))],
      mds[,4][c(56:length(pca$x))],
      type="p",
      pch=19,
      cex = (c(56:length(pca$x[,1]))-55)/30,
      col=brain_col)

# heatmap

heatmap(cr,
        col=rev(heat.colors(100)),
        distfun=function(x){as.dist(1-x)},
        symm=T)

# 5 

brain_exp = df[,c(1:56)]
liver_exp = df[,c(57:dim(df)[2])]

StudentGoesHard = function(cont, exp) 
{
  t.p.v = sapply(1:dim(brain_exp)[1], function(i) t.test(cont[i,], exp[i,])$p.value)
  return(f.p.v)
}

t.p.v = StudentGoesHard(brain_exp, liver_exp)

