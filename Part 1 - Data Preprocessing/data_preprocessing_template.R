# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Data.csv')

# Taking care of missing data
dataset$Age = ifelse(is.na(dataset$Age), 
                      ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                      dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary), 
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Salary)

# Encoding categorical data, 1 = France, 2 = Spain and 3 = Germany
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))
# Encoding categorical data, 0 = No and 1 = Yes
dataset$Purchased = factor(dataset$Purchased,
                         levels = c('No', 'Yes'),
                         labels = c(0, 1))
