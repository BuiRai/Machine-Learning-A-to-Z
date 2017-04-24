# Data Preprocessing Template

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# --------------- Importing the dataset ---------------
dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 3].values

# --------------- Taking of missing data ---------------      
from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values = 'NaN', strategy = 'mean', axis = 0)
imputer = imputer.fit(X[:, 1:3])
X[:, 1:3] = imputer.transform(X[:, 1:3])

# --------------- Encoding categorical data ---------------
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
# Tag with numbers, 0 = France, 1 = Spain and 2 = Germany
labelEncoder_X = LabelEncoder()
X[:,0] = labelEncoder_X.fit_transform(X[:,0])
# Aplying dummy variables 
# (1,0,0) = France,
# (0,1,0) = Germany and
# (0,0,1) = Spain
oneHotEncoder = OneHotEncoder(categorical_features = [0])
X = oneHotEncoder.fit_transform(X).toarray()
# Tag with numbers, 0 = no and 1 = yes
labelEncoder_y = LabelEncoder()
y = labelEncoder_y.fit_transform(y)

# ------- Splitting the dataset into the Training set and Test set -------
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2,
                                                    random_state = 0)

# Feature scaling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)