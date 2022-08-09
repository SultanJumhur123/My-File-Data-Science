#Set directory and read CSV
setwd('/Users/rienaftelussa/Desktop/Data Analysis/R/Statmul/Final Project')
df <- read.csv('SahamMNCBank.csv')

#Package Loading-----
library(car)
library(mlogit)
library(tidyr)
library(dplyr)
library(corrplot)

#Data Filtering----
df <- df[c(2, 6, 9, 11, 12)] #Selecting Necessary Variable
str(df)

df.filter1 <- subset(df, Change=="Rise", select = c(
  'Open', 'Change', 'Volume', 'Interval_High_Open', 'Interval_Open_From_LastDay'
  )) #Subsetting Rise Variable

df.filter2 <- subset(df, Change=="Fall", select = c(
  'Open', 'Change', 'Volume', 'Interval_High_Open', 'Interval_Open_From_LastDay'
  )) #Subsetting Fall Variable

df.FINAL <- merge(x = df.filter1, y = df.filter2, all = TRUE ) #Merging df.Filter1 & df.Filter2
df.x <- as.numeric(gsub(",", "", df.FINAL$Volume)) #Set the column 'Volume' to numeric on df.x values
df.FINAL$Volume <- df.x #Replacing current value of Volume with df.x value

#Setting Factor
str(df.FINAL)
df.FINAL$Change <- as.factor(df.FINAL$Change)
str(df.FINAL)

#Baseline Category Settings ----
df.FINAL$Change<-relevel(df.FINAL$Change, "Fall")
str(df.FINAL)


#Constructing Model:----
ChangeModel.1 <- glm(Change ~ Volume, data = df.FINAL, family = binomial())
ChangeModel.2 <- glm(Change ~ Volume + Open + Interval_High_Open + Interval_Open_From_LastDay, data = df.FINAL, family = binomial())


summary(ChangeModel.1)
summary(ChangeModel.2)

#Is the model a better fit of the data?: ----
modelChi <- ChangeModel.1$null.deviance - ChangeModel.1$deviance
chidf <- ChangeModel.1$df.null - ChangeModel.1$df.residual
chisq.prob <- 1 - pchisq(modelChi, chidf)
modelChi; chidf; chisq.prob

#compare model1 and model 2 ----
modelChi <- ChangeModel.1$deviance - ChangeModel.2$deviance
chidf <- ChangeModel.1$df.residual - ChangeModel.2$df.residual
chisq.prob <- 1 - pchisq(modelChi, chidf)
modelChi; chidf; chisq.prob

anova(ChangeModel.1, ChangeModel.2)

#----- Testing multicollinearity------
change.cor <- select(df.FINAL, "Open","Volume", "Interval_High_Open", "Interval_Open_From_LastDay")

change.cor <- cor(change.cor)
change.cor
corrplot(change.cor)

vif(ChangeModel.2)
1/vif(ChangeModel.2)
mean(vif(ChangeModel.2))

###############################################
# Pseudo R2s                                  #
###############################################
logisticPseudoR2s <- function(LogModel) {
  dev <- LogModel$deviance 
  nullDev <- LogModel$null.deviance 
  modelN <-  length(LogModel$fitted.values)
  R.l <-  1 -  dev / nullDev
  R.cs <- 1- exp ( -(nullDev - dev) / modelN)
  R.n <- R.cs / ( 1 - ( exp (-(nullDev / modelN))))
  cat("Pseudo R^2 for logistic regression\n")
  cat("Hosmer and Lemeshow R^2  ", round(R.l, 3), "\n")
  cat("Cox and Snell R^2        ", round(R.cs, 3), "\n")
  cat("Nagelkerke R^2           ", round(R.n, 3),    "\n")
}
############End of function ######################
logisticPseudoR2s(ChangeModel.1)
logisticPseudoR2s(ChangeModel.2)
mean1 <- c(0.303, 0.342, 0.457)