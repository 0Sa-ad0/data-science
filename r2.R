patientid <- c(1, 2, 3, 4)
age <- c(1, 2, 3, 4)
diabetes <- c("type1", "type2")
status <- c("poor", "rich")
Duration = c(60, 30, 45)

patientdata <- data.frame(patientid, age, diabetes, status)

blood_groups <- c("A", "B", "AB", "O")
(patientdata$blood_group <- sample(blood_groups, nrow(patientdata), replace = TRUE))

print(patientdata)



add_column_after <- function(data, column_name, new_column_name, values, new_row_values, position = "after") {
  insert_position <- which(names(data) == column_name) + ifelse(position == "after", 1, 0)
  
  data <- cbind(data[, 1:insert_position], 
                setNames(data.frame(values), new_column_name),
                data[, (insert_position):ncol(data)])
  
  new_row <- data.frame(new_row_values)
  data <- rbind(data[1:(nrow(data)-1),], new_row, data[nrow(data),])
  
  return(data)
}

patientid <- c(1, 2, 3, 4)
age <- c(1, 2, 3, 4)
diabetes <- c("type1", "type2", "type1", "type2")
status <- c("poor", "rich", "poor", "rich")
patientdata <- data.frame(patientid, age, diabetes, status)

blood_groups <- c("A", "B", "AB", "O")
patientdata <- add_column_after(patientdata, "age", "blood_group", sample(blood_groups, nrow(patientdata), replace = TRUE), c(5, "O", "type3", "poor"), position = "after")

print("Updated Data:")
print(patientdata)




g <- "my first list" 
h <- c(25, 16,18,39)
j <- matrix(1:10, nrow=5)
k <- c("one", "two")
mylist <- list(title=g, ages=h, j, k)
mylist




patientid <- c(1, 2, 3, 4)
age <- c(1, 2, 3, 4)
diabetes <- c("type1", "type2")
status <- c("poor", "rich")
Duration = c(60, 30, 45)

patientdata <- data.frame(patientid, age, diabetes, status)

blood_groups <- c("A", "B", "AB", "O")
patientdata$blood_group <- sample(blood_groups, nrow(patientdata), replace = TRUE)

#print("Data frame before deleting status attribute:")
#print(patientdata)

row_index_to_delete <- 3

patientdata <- patientdata[-row_index_to_delete, ]

patientdata$status <- NULL

print(patientdata)






