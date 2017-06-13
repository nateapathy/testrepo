#First, we need to load in the XML library that contains the scraper function
library(htmltools)
#Scrape the table
cancerdata <- data.frame( readHTMLTable( 'https://www.guardian.co.uk/commentisfree/2011/oct/28/bad-science-diy-data-analysis', which=1, header=c('Area','Rate','Population','Number')))