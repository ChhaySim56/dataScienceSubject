#Construct a 5x3 matrix for the value of x
x <- 1:15
matrix(x, nrow = 5, ncol = 3)

#Write a program to generate the following 4x4 matrix
zeroMatrix <- function(r, c){
  return <- matrix(0, nrow = r, ncol = c)
}
print(zeroMatrix(4,4))

#Write a program to generate matrix using cbind(), rbind(), rev(), rep()
bindingGenerator <- function(r, c){
  r1 <- matrix(1:c, 1, c)
  r2 <- matrix(rev(1:c), 1, c)
  r3 <- matrix(rep(r), 1, c)
  return <- rbind(r1, r2, r3)
}  

print(bindingGenerator(3, 8))

#Chose two different(x, y) 4x4 matrix to perform the following arithmetic operations
x <- matrix(1:16, 4, 4)
y <- matrix(17:32, 4, 4)

#x + y
print(x + y)
#x - y
print(x - y)
#x * y
print(x * y)
#x %*% y
print(x %*% y)

#This different between c and d is that c is perform a normal multiplication
#while d is perform a matrix multiplication 

#Inverse y
inv(y)

#find z
print(z <- x / y)

#Transpose of z
print(t(z))

#Diagonal of transpose matrix
print(diag(t(z)))

#Difference between (i) and (ii)
print(matrix(1:9, 3, 3, byrow = TRUE))
print(matrix(1:9, 3, 3))
#(i) is filled col-wise
#(ii) we are not specify, so it filled row-wise

#Function use for inner and outer product in matrix calculate is 

