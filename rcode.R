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
