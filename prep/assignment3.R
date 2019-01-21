cars <- read.csv('Cars 2005.csv')
head(cars)
hist(cars$Price)

table(cut(cars$Price, seq.int(0, max(cars$Price), 10000)))
# other methods
sum(is.na(ifelse(cars$Price < 10000 | cars$Price > 20000, cars$Price, NA)))
sum(!is.na(ifelse(cars$Price >= 10000 & cars$Price <= 20000, cars$Price, NA)))
min(cars$Price)
max(cars$Price)
mean <- mean(cars$Price)
median <- median(cars$Price)
abline(v=mean,col="red")
legend(50000, 240, c('mean'), col=c('red'), lty=1:1, cex=0.8)

# fit a normal distribution
x <- log(cars$Price)
hist(x, probability = TRUE)
library(MASS)
fit <- fitdistr(x, "normal")
fit
para <- fit$estimate
para
curve(dnorm(x, para[1], para[2]), col = 2, add = TRUE)
library(lattice)
densityplot(x)
ggplot(cars, aes(x, stat(density))) + geom_histogram(binwidth = 0.1)

with(cars, plot(x, Liter, pch=16))
lm(cars$Liter ~ x)
abline(lm(cars$Liter ~ x))

library(ggplot2)
ggplot(cars, aes(x, Liter,color=Leather)) + geom_point()

head(cars)
cars_new <- data.frame(table(cars$Type, cars$Leather))
cars_new
colnames(cars_new) <- c('Type', 'Leather', 'value')

barplot(table(cars$Type), horiz = FALSE)
head(cars)

ggplot(cars_new, aes(x=Type, y=value, fill=Leather)) + geom_bar(stat='identity') + coord_flip()
boxplot(cars$Price ~ cars$Type)

ggplot(cars, aes(Type, Price)) + geom_boxplot()
library(dplyr)
cars <- mutate(cars, Leather=as.character(Leather))
cars
ggplot(cars, aes(x=Price, fill=Leather)) + geom_histogram()
ggplot(cars, aes(x=Price, fill=Leather)) + geom_histogram(position='dodge')

install.packages("quantreg")
library('quantreg')
data(Mammals, package="quantreg")

head(Mammals)

new_mammals <- Mammals %>% filter(hoppers==FALSE, specials==FALSE)
sqlogweight <- (log(new_mammals$weight))^2
culogweight <- (log(new_mammals$weight))^3
qulogweight <- (log(new_mammals$weight))^4
penlogweight <- (log(new_mammals$weight))^5
model0 <- lm(formula = log(new_mammals$speed) ~ log(new_mammals$weight))
summary(model0)
model1 <- lm(formula = log(new_mammals$speed) ~ log(new_mammals$weight) + sqlogweight)
summary(model1)
model2 <- lm(formula = log(new_mammals$speed) ~ log(new_mammals$weight) + sqlogweight + culogweight)
summary(model2)
model3 <- lm(formula = log(new_mammals$speed) ~ log(new_mammals$weight) + sqlogweight + culogweight + qulogweight)
summary(model3)
model4 <- lm(formula = log(new_mammals$speed) ~ log(new_mammals$weight) + sqlogweight + culogweight + qulogweight + penlogweight)
summary(model4)

x = log(new_mammals$weight)
y = log(new_mammals$speed)
plot(x, y, xlab='log(weight)', ylab='log(speed)', cex=0.7,pch=16)

curve(-0.03305*x^2+0.29468*x+3.44746, add=TRUE,col=1)
curve(-0.003734*x^3-0.008023*x^2+0.329974*x+3.203065, add=TRUE,col=2)
curve(0.0009424*x^4-0.0118066*x^3-0.0164454*x^2+0.4453853*x+3.2093888, add=TRUE,col=3)
curve(-9.455e-05*x^5+2.043e-03*x^4-1.238e-02*x^3-3.784e-02*x^2+4.702e-01*x+3.282e+00, add=TRUE,col=4)

y1 = -0.03305*x^2+0.29468*x+3.44746
y2 = -0.003734*x^3-0.008023*x^2+0.329974*x+3.203065
y3 = 0.0009424*x^4-0.0118066*x^3-0.0164454*x^2+0.4453853*x+3.2093888
y4 = -9.455e-05*x^5+2.043e-03*x^4-1.238e-02*x^3-3.784e-02*x^2+4.702e-01*x+3.282e+00
plot(x, y-y1, ylab ='residual', cex=0.7, pch=16)
plot(y, y-y1, ylab ='residual', cex=0.7, pch=16)
qqnorm(y-y1)
qqline(y-y1)

plot(x, y-y2, ylab ='residual', cex=0.7, pch=16)
plot(y, y-y2, ylab ='residual', cex=0.7, pch=16)
qqnorm(y-y2)
qqline(y-y2)

plot(x, y-y3, ylab ='residual', cex=0.7, pch=16)
plot(y, y-y3, ylab ='residual', cex=0.7, pch=16)
qqnorm(y-y3)
qqline(y-y3)

plot(x, y-y4, ylab ='residual', cex=0.7, pch=16)
plot(y, y-y4, ylab ='residual', cex=0.7, pch=16)
qqnorm(y-y4)
qqline(y-y4)

ggplot(Mammals, aes(log(weight), log(speed), color=hoppers)) + geom_point()
head(Mammals)
Mammals$weight[which.max(Mammals$speed)]

new_mammals <- Mammals %>% filter(hoppers==TRUE, specials==FALSE)
plot(log(new_mammals$weight), log(new_mammals$speed), xlab='log(weight)', ylab='log(speed)', cex=0.7,pch=16)

# sample code
data(Mammals)
attach(Mammals)
x <- log(weight)
y <- log(speed)
plot(x,y, xlab="Weight in log(Kg)", ylab="Speed in log(Km/hour)")
points(x[hoppers],y[hoppers],pch = "h", col="red")
points(x[specials],y[specials],pch = "s", col="blue")
others <- (!hoppers & !specials)
points(x[others],y[others], col="black",cex = .75)
fit <- rqss(y ~ qss(x, lambda = 1),tau = 0.5)
plot(fit)

