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
