x <- c(1,2,3,4,5)
y <- c(28.3, 16, 11, 24, 13.2)
cbind(x,y)
#########
alligator = data.frame(
  lnLength = c(3.87, 3.61, 4.33, 3.43, 3.81, 3.83, 3.46, 3.76,
               3.50, 3.58, 4.19, 3.78, 3.71, 3.73, 3.78),
  lnWeight = c(4.87, 3.93, 6.46, 3.33, 4.38, 4.70, 3.50, 4.50,
               3.58, 3.64, 5.90, 4.43, 4.38, 4.42, 4.25))
print(alligator)
plot(lnWeight ~ lnLength, data = alligator,
       xlab = "Snout vent length (inches), log scale",
       ylab = "Weight (lbs), log scale",
       main = "Alligators in Central Florida")
#create a linear model for the two variables
# lm(dependent ~ independent, data = dataframename)
gatormod1 = lm(lnWeight ~ lnLength, data = alligator)
#creates a linear model for these two variables
summary(gatormod1)
#this will show me all of the data about my linear model; same as SPSS
#now we have to see if the assumptions of linear regression are OK for this data
#look at some information about residuals (errors)
plot(resid(gatormod1) ~ fitted(gatormod1),
       xlab = "Fitted Values",
       ylab = "Residuals",
       main = "Residual Diagnostic Plot",
       panel = function(x, y, ...)
       {
         panel.grid(h = -1, v = -1)
         panel.abline(h = 0)
         panel.xyplot(x, y, ...)
       }
)


