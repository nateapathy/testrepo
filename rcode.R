#Import hmresp file into data frame
#Step1: Make sure you have pulled down the latest version of the repo
#Step2: Create data frame for hmresp file
hmresp <- read.csv(~/LOCALFILEPATH/testrepo/hmresp.csv)
View (hmresp)
hist(hmresp$BMI)
hist(hmresp$Mental_State)
hist(hmresp$Mental_State, 
     main="Histogram for Mental State Rating", 
     xlab="Mental State Rating out of 10", 
     border="black", 
     col="blue")
#THE PROBABILITY WEIGHTING FUNCTION FROM PRELEC, 1998
#https://goo.gl/jvcN0M

curve((exp(-(-log(x))^0.95)), lwd = 2, main = "The Probability Weighting Function",
      xlab = "p", ylab = "w(p)")
curve((exp(-(-log(x))^0.85)), add=TRUE, col = "blue", lwd = 2)
curve((exp(-(-log(x))^0.75)), add=TRUE, col = "red", lwd = 2)
curve((exp(-(-log(x))^0.65)), add=TRUE, col = "green", lwd = 2)
curve((exp(-(-log(x))^0.55)), add=TRUE, col = "yellow", lwd = 2)
curve((exp(-(-log(x))^0.45)), add=TRUE, col = "orange", lwd = 2)
curve((exp(-(-log(x))^0.35)), add=TRUE, col = "purple", lwd = 2)
curve((exp(-(-log(x))^0.25)), add=TRUE, col = "pink", lwd = 2)
curve((exp(-(-log(x))^0.15)), add=TRUE, col = "brown", lwd = 2)
curve((exp(-(-log(x))^0.05)), add=TRUE, col = "gray", lwd = 2)



