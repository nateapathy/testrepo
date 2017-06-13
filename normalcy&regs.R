#anderson-darling test for normalcy
# https://www.r-bloggers.com/normality-tests-for-continuous-data/
install.packages("nortest")
library(nortest)
#H0: No observable difference between data and normal distribution
#significant p value rejects the null of no difference, so the data is non-normal
#insignificant p value means it is normally distributed
#HA: Clear observable difference between data and normal distribution
x <- rnorm(100,10,1)
y <- rweibull(100,1,5)
ad.test(x)
ad.test(y)
qqnorm(x)
qqline(x, col = "red")
#does it deviate significantly from a line
qqnorm(y)
qqline(y, col = "red")
#test this on some of our ACO data that we regressed linearly
acodata <- read.csv("/Users/nateapathy/Documents/RProjects/testrepo/aco15data.csv")
View (acodata)
#check normalcy of the pct save loss variable
ad.test(acodata$savelosspct)
# p = 1.423e-06, so non-normally distributed, so not a candidate for a linear reg
# would have to transform it to make it normally distributed. can't log transform because some of the values are negative
qqnorm(acodata$savelosspct)
qqline(acodata$savelosspct, col="blue")
hist(acodata$savelosspct)
#transformation: need something that will transform negative proportion values
savelosspct_tf <- asin(acodata$savelosspct)
savelosspct_z <- (acodata$savelosspct-mean(acodata$savelosspct))/sd(acodata$savelosspct)
savelosspct_cr <- sign(acodata$savelosspct)*(abs(acodata$savelosspct)^(1/3))

ad.test(savelosspct_z) #still non-normal with zscore transformation
shapiro.test(savelosspct_z)
qqnorm(savelosspct_z)
qqline(savelosspct_z, col="blue")

#chi square for saveloss and rural flag
chisq.test(acodata$saveflag, acodata$ruralflag)
