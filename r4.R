mydata <- read.csv("C:/Users/student/Pictures/data.csv", header = TRUE, sep = ",")
mydata

install.packages("dplyr")
library(dplyr)

mydata1 = select(mydata, age)
mydata1

colSums(is.na(mydata1))
which(is.na(mydata1$age))
remove <- na.omit(mydata1)

mydata1
