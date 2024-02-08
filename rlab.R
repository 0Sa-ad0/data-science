i <-1 
while (i<6) {
  print (i)
  i <- i+1
  if (i==4) {
    break
  }
}


i <- 0
while (i<6) {
  i <- i+1
  if (i==2) {
    next
  }
  print (i)
}


for (x in 1:100) {
  print(x)
}


for (x in 1:2) {
  for (y in 1:3) {
    print (x*y)
  }
}


sum <- function() {
  
}


a <- c(1, 2, 3, 4, 5)
b <- c("one", "two", "three")
c <- c(TRUE, FALSE)
cat("a:", a, "\n")
cat("b:", b, "\n")
cat("c:", c, "\n")


x <- c(1,10,4,2,3)
sort (x)

x <- c('c','r','j')
sort (x)

x <- c('c', 'r', 'j')
sort(x, decreasing = TRUE)


x <- c(2,1,4,1.5)
x[1,3]

x <- c(2,1,4,1.5)
x

x <- c(2, 1, 4, 1.5)
x[c(1, 3)]

mymatrix <- matrix(1:20, nrow = 5, ncol = 4)

mymatrix <- matrix(1:20, nrow = 5, ncol = 4, byrow = TRUE)

matrix_data <- matrix(1:20, nrow = 5, ncol = 4, byrow = TRUE)
row_names <- c("Row1", "Row2", "Row3", "Row4", "Row5")
col_names <- c("Col1", "Col2", "Col3", "Col4")
mymatrix <- matrix(matrix_data, nrow = 5, ncol = 4, byrow = TRUE,
                   dimnames = list(row_names, col_names))


cells <- c(1:4)
rnames <- c("r1", "r2")
cnames <- c("c1", "c2")
mymatrix1 <- matrix (cells, nrow = 2, ncol = 2, byrow = TRUE, dimnames = list(rnames, cnames))
print(c(mymatrix1[1, 1], mymatrix1[2, 2]))


print (myarray <- array(1:24, c(2,3,4)))
myarray[1,2,1]






























































