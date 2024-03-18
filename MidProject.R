install.packages("mice")
install.packages("readxl")
library(readxl)
library(mice)
dataset<-read_excel("E:/DataScience/Dataset_midterm_Section(C).xlsx")
dataset
dataset <- dataset[, -c(10, 11, 12)]
dataset
names(dataset)
colSums(is.na(dataset))
md.pattern(dataset)
unique_values <- unique(dataset$Infection)
unique_values
correction_map <- list("yesss" = "yes","yoo" = "no")
dataset$Infection <- ifelse(dataset$Infection %in% names(correction_map),
unlist(correction_map[as.character(dataset$Infection)]), dataset$Infection)

most_frequency_value<- table(dataset$Infection)
most_frequency_value
sort_most_frequence_value<-sort(most_frequency_value,decreasing = TRUE) 
sort_most_frequence_value
mode_sort_most_frequency_value<-names(sort_most_frequence_value)[1]
mode_sort_most_frequency_value
dataset$Infection[is.na(dataset$Infection)]<-mode_sort_most_frequency_value
missing_values <- sum(is.na(dataset$Infection))
missing_values


dataset$Age[is.na(dataset$Age)]<- round(mean(dataset$Age,na.rm = TRUE),3)
boxplot(dataset$Age, main='Box Plot for AGE')
q1<-quantile(dataset$Age,0.25)
q1
q3<-quantile(dataset$Age,0.75)
q3
iqr<-q3-q1
iqr
outliers_age<- dataset$Age < (q1-1.5*iqr)| dataset$Age > (q3+1.5*iqr)
outliers_age
dataset$Age <- ifelse(outliers_age,NA,dataset$Age)
dataset$Age[is.na(dataset$Age)]<-round(mean(dataset$Age,na.rm = TRUE),3)
boxplot(dataset$Age, main='Box Plot for AGE')



most_frequency_value_Smoking<- table(dataset$Smoking) 
most_frequency_value_Smoking

sort_most_frequence_value_Smoking<-sort(most_frequency_value_Smoking,decreasing = TRUE) 
sort_most_frequence_value_Smoking

mode_sort_most_frequency_value_Smoking<-as.numeric(names(sort_most_frequence_value_Smoking)[1])
mode_sort_most_frequency_value_Smoking
dataset$Smoking[is.na(dataset$Smoking)]<-mode_sort_most_frequency_value_Smoking

missing_values <- sum(is.na(dataset$Smoking))
missing_values

boxplot(dataset$Smoking, main='Box Plot for Smoking')


missing_values <- sum(is.na(dataset$SystolicBP))
missing_values
boxplot(dataset$SystolicBP, main='Box Plot for SystolicBP')

dataset$DiastolicBP[is.na(dataset$DiastolicBP)]<- round(mean(dataset$DiastolicBP,na.rm = TRUE),3)
missing_values <- sum(is.na(dataset$DiastolicBP))
missing_values
boxplot(dataset$DiastolicBP, main='Box Plot for DiastolicBP')


boxplot(dataset$BS, main='Box Plot for BS')

q1<-quantile(dataset$BS,0.25)
q1
q3<-quantile(dataset$BS,0.75)
q3
iqr<-q3-q1
iqr
outliers_BS<- dataset$BS < (q1-1.5*iqr)| dataset$BS > (q3+1.5*iqr)
dataset$BS <- ifelse(outliers_BS,NA,dataset$BS)
dataset$BS[is.na(dataset$BS)]<-round(mean(dataset$BS,na.rm = TRUE),3)
boxplot(dataset$BS, main='Box Plot for BS')


dataset$BodyTemp[dataset$BodyTemp < 0] <- NA
dataset$BodyTemp[is.na(dataset$BodyTemp)]<-round(mean(dataset$BodyTemp,na.rm = TRUE),3)
missing_values <- sum(is.na(dataset$BodyTemp))
missing_values

boxplot(dataset$BodyTemp, main='Box Plot for BodyTemp')
boxplot(dataset$HeartRate, main='Box Plot for HeartRate')


most_frequency_value_RiskLevel<- table(dataset$RiskLevel) 
most_frequency_value_RiskLevel

sort_most_frequence_value_RiskLevel<-sort(most_frequency_value_RiskLevel,decreasing = TRUE) 
sort_most_frequence_value_RiskLevel

mode_sort_most_frequency_value_RiskLevel<-(names(sort_most_frequence_value_RiskLevel)[1])
mode_sort_most_frequency_value_RiskLevel

dataset$SystolicBP_normalized <- round((dataset$SystolicBP - min(dataset$SystolicBP)) / (max(dataset$SystolicBP) - min(dataset$SystolicBP)),3)
dataset

value_mapping <- c("no" = 1, "yes" = 2, "marginal" = 3)
dataset$Infection <- value_mapping[dataset$Infection]
dataset


hist(dataset$Age,main = "Age Distribution",xlab = 'Age',col = 'lightblue')


mean_age <- mean(dataset$Age, na.rm = TRUE)
median_age <- median(dataset$Age, na.rm = TRUE)


get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

mode_age <- get_mode(dataset$Age)


barplot(c(mean_age, median_age, mode_age), 
        names.arg = c("Mean", "Median", "Mode"), 
        col = c("red", "green", "blue"),
        main = "Mean, Median, and Mode of Age",
        ylab = "Value",
        ylim = c(0, max(dataset$Age, na.rm = TRUE) * 1.2))

text(1:3, c(mean_age, median_age, mode_age), 
     labels = round(c(mean_age, median_age, mode_age), 2), 
     pos = 3, offset = 0.5, col = "black")


barplot(table(dataset$RiskLevel),main = "Risk Level Distribution",xlab = "Risk Level",ylab = 'count',col = "red")

dataset


install.packages("openxlsx")
library(openxlsx)

write.xlsx(dataset, "E:/DataScience/modified_dataset.xlsx")


