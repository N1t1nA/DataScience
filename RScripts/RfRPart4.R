#Random forest using data
??randomForest
library(rpart)
#install.packages("rpart.plot")
library(rpart.plot)
install.packages("randomForest")
library(randomForest)

##read data, just include the path to your csv file
df<-read.csv( "C://Users//nitinahu//Documents//R//RScripts//Invoice.csv"  ,header=T)
head(df)
summary(df)

is.na(df) ## checks for NULL 

s<-sample(150,100)

df_train <- df[s,]
head(df_train)
df_test <- df[-s,]
head(df_test)



##Random Forest
rfm <- randomForest(on_time ~ ., df_train)
rfm
p<- predict(rfm,df_test)
head(p)

table(df_test[,9],p)## setting 9 is used because the tableas df_test and df_train had 9 columns
mean(df_test[,9]==p)
importance(rfm)