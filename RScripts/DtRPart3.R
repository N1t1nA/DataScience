#predict with ML 
library(MicrosoftML)
library(RevoTreeView)
# Load Data
data(iris)
#set a seed to make randomness reproducible
set.seed(42)

#Randomly sample 100 of 150 row indexes
indexes <-sample(
  x=1:150, size = 100)
# inspect the random indexes
print(indexes)

#create a training set from indexes
train<-iris[indexes, ]

#create a test set from remaining indexes
test<-iris[-indexes,]

#install package tree
#install.packages("tree")

#load the decision tree package
library(tree)


#train a decision tree model 
model<-tree(formula = Species~., data=train)
#model<-rxDTree(formula = Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=train)

#Inspect the model 
summary(model)

#visualize the decision tree model
plot(model)
#plot(createTreeView(model))
#zipTreeView(createTreeView(model),'IrisData.zip',flags = "a",zip = "C:/Program Files/7-Zip/7z.exe")
text(model)

#load the color brewer library
library(RColorBrewer)

#create a color pallette
?brewer.pal
palette <-brewer.pal(3,"Dark2")

#create a scatterplot colored by species 
plot(x=iris$Petal.Length,
     y=iris$Petal.Width,
     pch=19,
     col=palette[as.numeric(iris$Species)],
     main="Iris Petal Lengh vs. Width",
     xlab = "Petal Length(cm)",
     ylab = "Petal Width (cm)")
     
# plot the decision boundaries 
partition.tree(tree=model,
               label="Species",
               add=TRUE)

#predict the model 
predictions<-predict(
  object = model, 
  newdata = test,
  type = "class")
                     
#create a confusion matrix
table(
  x=predictions,
  y=test$Species)

#load the caret package 
install.packages("caret")
install.packages("e1071")
library(caret)

#evaluate the prediction results 
confusionMatrix(
  data=predictions,
  reference = test$Species
)

#set working directory 
setwd("C:/Users/nitinahu/Documents/R/RScripts")

#save the model 
save(model, file="Tree.RData")