#set working directory
setwd("C:/R/Mindful Healing")

#install and load necessary packages
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

#import data
mindful <- read.csv("mindful_data.csv", header = TRUE)

#check structure of data
str(mindful)

#remove unwanted columns
mindful <- select(mindful, -CustID, -StartDate, -EndDate)

#convert response variable to factor
mindful$Result <- as.factor(mindful$Result)

#generate descriptive summary
summary(mindful)

#check for missing values
sum(is.na(mindful))

#create training and testing datasets
mindful_train <- sample_frac(mindful, 0.7)
mindful_test <- anti_join(mindful, mindful_train, by = "Subject")

#fit a logistic regression model
model1 <- glm(Result ~ Gender + Age + Stress + Meditation, data = mindful_train, family = "binomial")
summary(model1)

#check model assumptions
plot(model1)

#calculate the AUC
pred <- predict(model1, mindful_test, type = "response")
AUC <- round(pROC::roc(mindful_test$Result, pred), 2)

#construct a confusion matrix
pred_values <- ifelse(pred > 0.50, "Healed", "Not Healed")
confusion_matrix <- table(mindful_test$Result, pred_values)

#plot ROC curve
prob <- predict(model1, mindful_test, type = "response")
roc_curve <- pROC::roc(mindful_test$Result, prob, plot = TRUE, auc.poly = TRUE)

#calculate prediction accuracy
accuracy <- round(mean(pred_values == mindful_test$Result), 2)

#generate boxplot
med_plot <- ggplot(data = mindful, aes(x = Meditation, y = Result)) + geom_boxplot() +
  geom_jitter(aes(fill = Result)) +
  scale_fill_manual(values=c("#FF0000", "#00FF00")) +
  labs(x="Meditation", y="Healing Result")

#save the plots
ggsave(med_plot, file = "boxplot.png")
ggsave(roc_curve, file = "roc_curve.png")