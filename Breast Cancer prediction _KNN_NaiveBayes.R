
rd_bst<-read.csv(file.choose())

str(rd_bst)
rd_bst$X<-NULL
rd_bst$id<-NULL

rd_bst$diagnosis<-ifelse(rd_bst$diagnosis=='B',0,1)

library(corrr)
library(corrplot)
CorrelationResults = cor(rd_bst)
corrplot(CorrelationResults)

#Taking data in train and test sets
set.seed(1234)
samp <- sample(nrow(rd_bst),0.75*nrow(rd_bst))
train <- rd_bst[samp,]
test <- rd_bst[-samp,]


#knn model
library(class)
y_pred<-knn(train=train,test = test,cl=train$diagnosis,k=5)

#confusion matrix
cm<-table(test$diagnosis,y_pred)

#accuracy
mean(test$diagnosis==y_pred)

#we can see that the tumor is miglant with 91% accuracy



#Visualization

knn_values<-function(val,name){
  y_pred<-knn(train=train,test = test,cl=train$diagnosis,k=5)
  
  #feature scaling
  train[-1]<-scale(train[-1])
  test[-1]<-scale(test[-1])
  
  plot.df = data.frame(test, predicted = y_pred)
  
  plot.df1 = data.frame(x = plot.df$radius_mean, 
                        y = plot.df$concave.points_mean, 
                        predicted = plot.df$predicted)
  
  find_hull = function(df) df[chull(df$x, df$y), ]
  library(plyr)
  boundary = ddply(plot.df1, .variables = "predicted", .fun = find_hull)
  
  library(ggplot2)
  ggplot(plot.df,aes(radius_mean,concave.points_mean, color = predicted, fill = predicted)) +
    geom_point(size = 5) + 
    geom_polygon(data = boundary, aes(x,y), alpha = 0.5)+ggtitle(name)

}


knn_values(5,"2-class classification k=5")
knn_values(3,"2-class classification k=3")


#naive bayes

rd_bst$diagnosis<-factor(rd_bst$diagnosis,levels = c(0,1))
#Taking data in train and test sets
set.seed(1234)
samp <- sample(nrow(rd_bst),0.75*nrow(rd_bst))
train <- rd_bst[samp,]
test <- rd_bst[-samp,]


library(e1071)
nav<-naiveBayes(train,train$diagnosis)

nav_pred<-predict(nav,newdata = test)  

#confusion matrix
cm_nav<-table(test$diagnosis,nav_pred)

#accuracy
mean(test$diagnosis==nav_pred)

#after using Naive Bayes we get an accuracy of around 95.80% which is very much better then KNN