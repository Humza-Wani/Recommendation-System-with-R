library("recommenderlab")
library(caTools)
library("devtools")
install_github("mhahsler/recommenderlab")
library("mhahsler/recommenderlab")
library(devtools)
library(Matrix)
#movie rating data
data<- read.csv(file.choose())
View(data)
View(data[-c(1,2)])
data1 <- data[-c(1,2)]
colnames(data1)=c("title","author","publisher","rating")
colnames(data1)
#metadata about the variable
str(data1)
#rating distribution
hist(data1$rating)
data_mat <- as(data,"RatingMatrix")
model1 <- Recommender(data_mat,"POPULAR")
#Predictions for two users 
recommended_items1 <- predict(model1, data_mat[1:3], n=5)
as(recommended_items1,'list')
View(recommended_items1)
## Popularity model recommends the same movies for all users , we need to improve our model using # # Collaborative Filtering

#User Based Collaborative Filtering]
data2 <- as(data1,"realRatingMatrix")
recomm_model2 <- Recommender(data_mat, method="UBFC")
#Predictions for two users 
recommended_items2 <- predict(recomm_model2, data_mat[1:3], n=1)
as(recommended_items2,'list')
?Recommender
help("Recommender")
