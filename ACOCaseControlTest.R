# pull data from Data.CMS.Gov API for 2015 ACO Performance
install.packages("pacman")
library(pacman)
install.packages("RSocrata")
p_load(RSocrata,plyr,RColorBrewer)
library(RSocrata)

# 2015 Performance Data
msspaco15perf <- read.socrata("https://data.cms.gov/resource/rmpx-bjq8.json")
colnames(msspaco15perf) <- paste(colnames(msspaco15perf), "15",sep = "_")
names(msspaco15perf)[names(msspaco15perf) == 'aco_num_15'] <- 'aco_num'

# 2015 Public Use File
msspaco15puf <- read.socrata("https://data.cms.gov/resource/rgk7-vd6w.json")
colnames(msspaco15puf) <- paste(colnames(msspaco15puf), "15",sep = "_")
names(msspaco15puf)[names(msspaco15puf) == 'aco_num_15'] <- 'aco_num'

# 2014 Performance Data
msspaco14perf <- read.socrata("https://data.cms.gov/resource/kcsi-wmjs.json")
colnames(msspaco14perf) <- paste(colnames(msspaco14perf), "14",sep = "_")
names(msspaco14perf)[names(msspaco14perf) == 'aco_num_14'] <- 'aco_num'

# 2014 Public Use File
msspaco14puf <- read.socrata("https://data.cms.gov/resource/4f82-xtk8.json")
colnames(msspaco14puf) <- paste(colnames(msspaco14puf), "14",sep = "_")
names(msspaco14puf)[names(msspaco14puf) == 'aco_num_14'] <- 'aco_num'

# Create merged data frame that includes both performance data and PUF data for analysis
msspaco2015 <- merge(msspaco15perf,msspaco15puf, by="aco_num")
msspaco2014 <- merge(msspaco14perf,msspaco14puf, by.x = "aco_doing_business_as_dba_or_legal_business_name_lbn_14", by.y = "aco_name_14") 
msspaco1415 <- merge(msspaco2015,msspaco2014, by="aco_num")
msspaco1415$lossflag <- ifelse(msspaco1415$total_benchmark_minus_assigned_beneficiary_expenditures_15 < 0, c("1"), c("0"))
# ACO 2015 MSSP Case Control Study
library(Epi)
## Set seed for the random number generator
set.seed(20140111)
## Generate a nested case-control study
acocc <- ccwc(entry = msspaco1415$initial_start_date_15, exit = 0,
              fail     = msspaco1415$lossflag,    # Status on exit (1 = Fail, 0 = Censored)
              origin   = 0,    # Origin of analysis time scale
              controls = 2,      # The number of controls to be selected for each case
              data     = msspaco1415,   # data frame
              include  = msspaco1415$n_pcp_15, # List of other variables to be carried across into the case-control study
              match    = msspaco1415$n_ab_15,  # List of categorical variables on which to match cases and controls
              silent   = TRUE
)
## Show first 10 observations
head(acocc, 10)

## Construct conditional logistic model
resClogit <- clogit(formula = Fail ~ scale(energy) + strata(Set), data = dietcc)
summary(resClogit)