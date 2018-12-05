# 1

fac = function(n){
  ans = 1
  if (n %% 1 != 0){
    stop("Not int")
    }
  
  for (i in 1:n){
    ans = ans * i
  }
  return(ans)
}

fac(3)

# 2

har.av = function(arr){
  length(arr)/(sum(1/(arr)))
}

for (i in 1:ncol(mtcars)) print(har.av(mtcars[, i]))

# 3

calcPolynomial = function(x, coefs)
{
  n = length(coefs)
  ans = 0
  for (i in 1:n){
  ans = ans + x^(i-1)*coefs[i]
  }
  return(ans)
}

calcPolynomial(1, c(4,3,2,1))

# 4 

getPolynomials = function(coefs)
{
  function(x) {
    n = length(coefs)
    ans = 0
    for (i in 1:n){
      ans = ans + x^(i-1)*coefs[i]
    }
    return(ans)
  }
}

coefs = c(4,3,2,1)
p = getPolynomials(coefs)
p(1:10)
