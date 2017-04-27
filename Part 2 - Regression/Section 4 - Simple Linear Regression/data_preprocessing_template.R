# Simple Linear Regression

# -------------------------- Importing the dataset ---------------------------------
dataset = read.csv('Salary_Data.csv')
# dataset = dataset[,2:3]

# ------------  Splitting the dataset into the Training set and Test set # ---------
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
trainingSet = subset(dataset, split == TRUE)
testSet = subset(dataset, split == FALSE)

# ------------------------------ Feature Scaling -----------------------------------
# trainingSet[, 2:3] = scale(trainingSet[, 2:3])
# testSet[, 2:3] = scale(testSet[, 2:3])

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = trainingSet)
summary(regressor)

