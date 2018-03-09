
## Objective of analysis for the current study

# In this mini project we analyse the classic data set of iris flower species
# The species of IRIS flower recorded in this dataset are VIRGINICA;SERTOSA; VERSICOLOR
# This data set contains observations on sepal length, sepal width, petal length and petal width attributes
# Using the length and width measurments of sepal and petals we can easily distinguish the species of the IRIS flower, since each flower specie has it own unique average length and width measures
# In our analysis we use unsupervised and supervised meachine learning methods to correctly classify the IRIS flower species 


#Install graphical suite
install.packages("ggplot2")

#Install tidyverse
install.packages("tidyverse")

#Load Iris Dataset
library(datasets)

#structure of the data set
str(iris)

#names
names(iris)

#observe the data values
head(iris)
tail(iris)
iris
iris$Species

#summary statistics of Iris flower petal and sepals lengths and widths
summary(iris$Sepal.Length)
summary(iris$Sepal.Width)
summary(iris$Petal.Length)
summary(iris$Petal.Width)

#Plot a scatterplot sepal length vs width and petal length vs width

plot (iris$Petal.Length, iris$Petal.Width)

plot(iris$Sepal.Length, iris$Sepal.Width)

#use ggplot2
library(ggplot2)
ggplot(iris, aes(Petal.Length, Petal.Width, color=Species))+geom_point()


ggplot(iris,aes(Sepal.Length, Sepal.Width, color=Species))+ geom_point() 


#lets apply clustering, set a random number generator
# syntax for KMeans(x, centers, iter.max=10, num.seeds=20)

set.seed(20)
iris_species_clustering <- kmeans(iris[3:4], 3, nstart=20)
iris_species_clustering

#plot the result compare it with species cluster

table (iris_species_clustering$cluster, iris$Species)

#Plot on a graph

iris_species_clustering$cluster <- as.factor(iris_species_clustering$cluster)

ggplot(iris, aes(Petal.Length, Petal.Width, color = iris_species_clustering$cluster))+geom_point()
