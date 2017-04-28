# Multiple Linear Regression

# Data Preprocessing Template

# -------------------------- Importing the dataset ---------------------------------
dataset = read.csv('50_Startups.csv')
# dataset = dataset[,2:3]

# Encoding categorical data, New York = 1, California = 2 and Florida = 3
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

# ------------  Splitting the dataset into the Training set and Test set # ---------
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
trainingSet = subset(dataset, split == TRUE)
testSet = subset(dataset, split == FALSE)

# ------------------------------ Feature Scaling -----------------------------------
# trainingSet[, 2:3] = scale(trainingSet[, 2:3])
# testSet[, 2:3] = scale(testSet[, 2:3])

# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ .,
               data = trainingSet)
summary(regressor)
