# 1

df = rpois(2000, 100);

# 2

ma <- function(arr, n=5)
{
  res = 0
  counter = 1
  i = 1
  while (counter < length(arr))
  {
    res[i] = sum(arr[c(counter:(counter+n))])
    counter = counter + n
    i = i + 1
  }
  res
}

av = 10

y = ma(as.integer(table(df)), n=av)
y = y[c(1:length(y)-1)]
x = as.integer(names(table(df)))[1:length(y)*av]

length(x)
length(y)

par(mfrow=c(1,1))
plot(x, y, t="h", lwd=1)

# 3 

#par(mfrow=c(1,1))
#plot(x, y, t="h", lwd=1 + 3*av, col=gray(((y)/max(y))))

# 4

# Create the function.
mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

abline(v=mean(df), col="blue")
abline(v=median(df), col="red")
abline(vmode(df), col="green")
legend('topleft', col=c("red", "blue", "green"), legend = c('Median', "Mean", "Mode"), title = "Statistics", cex=1, pt.cex=1, lwd=1)

