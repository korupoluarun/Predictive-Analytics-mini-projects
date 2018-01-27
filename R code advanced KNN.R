#Predictive analytics using R
#Cancer diagnosis using human cells data
#Attributes such as cell size and cell Shape, DNA Amount, Nuclei count, cell division

# Step 1: Import the data (source: UCI Machine Learning repository)
# https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.names

setwd("C:/Users/ak00497977/Desktop/R/Datasets")
getwd()

cell_data <- read.csv("cancer.txt", stringsAsFactors = FALSE)

# Structure of data set

str (cell_data)

# Step 2:  Naming the variables

  #  Attribute                     

  #  1. Sample code number            id number
  #  2. Clump Thickness               1 - 10
  #  3. Uniformity of Cell Size       1 - 10
  #  4. Uniformity of Cell Shape      1 - 10
  #  5. Marginal Adhesion             1 - 10
  #  6. Single Epithelial Cell Size   1 - 10
  #  7. Bare Nuclei                   1 - 10
  #  8. Bland Chromatin               1 - 10
  #  9. Normal Nucleoli               1 - 10
  # 10. Mitoses                       1 - 10 
  # 11. Class                         (2 for benign, 4 for malignant)


names(cell_data) <- c("id","clump_thickness", "cell_size", "cell_shape", "marginal_adhesion", "epithelial_cell_size", "bare_nuclei","bland_chromatin", "normal_ne
                    ucleoli", "mitoses", "benign_class" )


str(cell_data)


#Summary of dataset

summary(cell_data)


# Step 3: Preparing the data for predictive analytics
# Exclude the ID attribute, so we would work with 10 attributes

cell_data$id <- NULL
str(cell_data)

#convert the data in bare_nuclei attribute into numerical values using as.numeric() function

cell_data$bare_nuclei <- as.numeric(cell_data$bare_nuclei)

#Remove missing values if any exist, rows are excluded

cell_data <- cell_data[complete.cases(cell_data),]
str(cell_data)

# Data Transformation step of assiging "benign" & "malignant" to classes 2 & 4

# Using a factor () function

cell_data$benign_class <- factor(ifelse(cell_data$benign_class == 2, "benign", "malignant"))

str(cell_data)


#Step 4  building a predictive model
#Split the data into 75:25 or 80:20 or 90:10 ratio for Train and Test halves
#The last column contains the actual diagnosis, we need to seperate it

training_cell_data <- cell_data[1:477, 1:9]
test_cell_data <- cell_data [478:682, 1:9]

taining_cell_data_outcome <- cell_data[1:477, 10]
test_cell_data_outcome <- cell_data [478:682, 10]

#invoke the classification library Class
# KNN alogorithm allows pattern recognition and is used in supervised learning

library(class)
prediction_outcome <- knn(train = training_cell_data, test = test_cell_data,cl = taining_cell_data_outcome,k = 21)


# Step 5 Analysing the power of outcome while comparing with the test data
# using cross tabulation
# what we observe is a perfect score when compared with the test data)

prediction_outcome

table(test_cell_data_outcome,prediction_outcome)















