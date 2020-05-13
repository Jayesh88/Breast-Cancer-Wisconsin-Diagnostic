# Breast-Cancer-Wisconsin-Diagnostic

# This dataset is solved in Python and R

We conducted an analysis using the to predict whether the cancer is benign or malignant. Dataset can be found at https://www.kaggle.com/uciml/breast-cancer-wisconsin-data

Data set contains details about : i) ID number ii) Diagnosis (M = malignant, B = benign)

Ten real-valued features are computed for each cell nucleus:

a) radius (mean of distances from center to points on the perimeter) 
b) texture (standard deviation of gray-scale values) 
c) perimeter 
d) area 
e) smoothness (local variation in radius lengths) 
f) compactness (perimeter^2 / area - 1.0) 
g) concavity (severity of concave portions of the contour) 
h) concave points (number of concave portions of the contour) 
i) symmetry 
j) fractal dimension ("coastline approximation" - 1)

The mean, standard error and "worst" or largest (mean of the three largest values) of these features were computed for each image, resulting in 30 features. For instance, field 3 is Mean Radius, field 13 is Radius SE, field 23 is Worst Radius.

All feature values are recoded with four significant digits.

Missing attribute values: none

Class distribution: 357 benign, 212 malignant

We Performed two classification Algorithm to check the weather Brest cancer is M = malignant, B = benign:

# 1. K Nearest Neighbour(KNN)

# 2. Naive Bayes
