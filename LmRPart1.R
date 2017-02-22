data("airquality")
names(airquality)
plot(Ozone~Solar.R,data=airquality)
#calculate mean ozone concentration (na's removed)
mean.Ozone<-mean(airquality$Ozone,na.rm = T)
#absolute line for mean
abline(h=mean.Ozone)

#use lm to fit a regression line through these data:

model1<-lm(Ozone~Solar.R, data = airquality)
model1

#plot abline

abline(model1, col="red")
plot(model1)

termplot(model1)
summary(model1)