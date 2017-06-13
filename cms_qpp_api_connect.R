#connect to the CMS QPP API
# https://qpp.cms.gov/api/
#use GET command to pull down some data from the API
#use the JSONlite package
library(jsonlite)
aci_test <- fromJSON(qpp.cms.gov/api/v1/aci/jason)
