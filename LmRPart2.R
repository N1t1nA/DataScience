#load the iris data 
data(iris)
#head 
head(iris)
#basic plotting 
plot(x=iris$Petal.Length,y=iris$Petal.Width,main = "Iris Petl Lenghth vs width",xlab = "Petal Length (cm)",ylab = "Petal Width (cm)")
#create a linear regression model 
fit<-lm(formula = Petal.Width~Petal.Length, data=iris)
#summary the model
summary(model)
#draw a regression line
lines(x=iris$Petal.Length,y=fit$fitted,col="red",lwd=3 )
#get correlation coefficient
cor(x=iris$Petal.Length,y=iris$Petal.Width)
#predict new values from the model 
predict(object=fit, newdata=data.frame(Petal.Length=c(2,5,7)))