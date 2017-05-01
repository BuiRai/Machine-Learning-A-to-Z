# Logistic Regression

# -------------------------- Importing the dataset ---------------------------------
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[,3:5]

# ------------  Splitting the dataset into the Training set and Test set # ---------
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
trainingSet = subset(dataset, split == TRUE)
testSet = subset(dataset, split == FALSE)

# ------------------------------ Feature Scaling -----------------------------------
trainingSet[, 1:2] = scale(trainingSet[, 1:2])
testSet[, 1:2] = scale(testSet[, 1:2])

# Fitting Logistic Regression to the Training set
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = trainingSet)
