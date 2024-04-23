install.packages("readr")
install.packages("caret")
install.packages("infotheo")
library(readr)
library(caret)
library(infotheo)


dataset <- read_csv("C:/Users/SAAD/Downloads/DS-lab-task/name_gender_dataset.csv")
head(dataset)

missing_values <- is.na(dataset) | dataset$Gender == ""
missing_counts <- colSums(missing_values)
print(missing_counts)

contingency_table_name_gender <- table(dataset$Name, dataset$Gender)
chi_square_test_name_gender <- chisq.test(contingency_table_name_gender, correct = TRUE)
print(chi_square_test_name_gender)

anova_model <- aov(Count ~ Name, data = dataset)
anova_result <- anova(anova_model)
print(anova_result)

anova_model_probability <- aov(Probability ~ Name, data = dataset)
anova_result_probability <- anova(anova_model_probability)
print(anova_result_probability)

pearson_corr <- cor(dataset$Count, dataset$Probability, method = "pearson")
spearman_corr <- cor(dataset$Count, dataset$Probability, method = "spearman")
print(paste("Pearson correlation coefficient:", pearson_corr))
print(paste("Spearman correlation coefficient:", spearman_corr))

name_ranks <- seq_along(dataset$Name)
name_ranks
kendall_count <- cor(name_ranks, dataset$Count, method = "kendall")
kendall_probability <- cor(name_ranks, dataset$Probability, method = "kendall")
print(paste("Kendall's W for Name and Count:", kendall_count))
print(paste("Kendall's W for Name and Probability:", kendall_probability))

mutual_info <- mutinformation(dataset$Name, dataset$Gender)
print(paste("Mutual Information between Name and Gender:", mutual_info))

