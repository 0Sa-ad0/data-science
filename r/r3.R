var1 = readline(prompt = "enter any value: ")
var2 = readline(prompt = "enter any num: ")

var2 = as.integer(var2)
print(var1)
print(var2)


x = scan()
print(x)

x = scan(what=" ")
print(x)


mydata <- data.frame(age=numeric(0), gender= character(0), weight= numeric(0))
mydata <- edit(mydata)


mydata <- read.csv("C:/Users/student/Pictures/data.csv", header=TRUE, sep = ",")
mydata
names(mydata)
gender <- c("Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female")
mydata$gender <- gender
mydata$gender <- factor (mydata$gender, levels = c("Male", "Female"), labels = c(1,0))
print(mydata)
str(mydata)
summary(mydata)
print(standard_deviation <- sd(mydata$age))
install.packages("dplyr")
library("dplyr")
mydata %>% summarise_if(is.numeric,sd)
install.packages("matrixStats")
library(matrixStats)
mydata$age = rowSds (as.matrix(mydata[,c(2,3)]))
mydata$age
