# Regression Discontinuity Test
# From: http://erikgahner.github.io/slides/aas2015-w12-rdd/rdd.html#/slide-38
############### Creation of the dummy data ###############
# Col1: random number between -182 and 182
# Col2: Conditional random number between 1 and 5:
        # For Col1 less than 0, random number between 3 and 5
        # For Col1 greater than 0, random number between 1 and 3
dobcutoff <- sample(-182:182,2000, replace = T)
rd_rgen_discont <- data.frame(dobcutoff)
rd_rgen_discont$highlvl <- ifelse(rd_rgen_discont$dobcutoff < 0,
                                  sample(3:5),sample(1:3))
# Now do the regression discontinuity with this manufactured data
rd_rgen_discont_rdd <- rdd_data(y=rd_rgen_discont$highlvl, 
                           x=rd_rgen_discont$dobcutoff,
                           cutpoint = 0, data=rd_rgen_discont)
rgen_discont <- rdd_reg_lm(rdd_object = rd_rgen_discont_rdd)
print(rgen_discont)
plot(rgen_discont)

######### EXAMPLE WITH EXCEL DUMMY DATA #################
# Read in dummy data; one tab has no discontinuity, one does (about 0)
library(readxl)
rd_no_discont <- read_excel("~/Desktop/rd_test_data.xlsx", sheet = "No Reg Discont")
rd_discont <- read_excel("~/Desktop/rd_test_data.xlsx", sheet = "Reg Discont")
install.packages("rddtools")
library("rddtools")
colnames(rd_no_discont)[3] <- "highlvl"
colnames(rd_discont)[3] <- "highlvl"
rd_no_discont_rdd <- rdd_data(y=rd_no_discont$highlvl, 
                              x=rd_no_discont$dobcutoff,
                              cutpoint = 0, data=rd_no_discont)
reg_no_discont <- rdd_reg_lm(rdd_object = rd_no_discont_rdd)
print(reg_no_discont)
plot(reg_no_discont)

rd_discont_rdd <- rdd_data(y=rd_discont$highlvl, 
                              x=rd_discont$dobcutoff,
                              cutpoint = 0, data=rd_discont)
reg_discont <- rdd_reg_lm(rdd_object = rd_discont_rdd)
print(reg_discont)
plot(reg_discont)