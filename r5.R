mydata <- read.csv("C:/Users/student/Pictures/data.csv", header = TRUE, sep = ",")
mydata

which(is.na(mydata$age))

which(mydata$city == "")
mydata$city[mydata$city == ""] <- NA

mydata <- na.omit(mydata)

