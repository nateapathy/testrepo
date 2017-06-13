#Colored Scatterplot
# Charge the plotly library
library(plotly)

# Let's use the diamonds data set :
d <- diamonds[sample(nrow(diamonds), 1000), ]

# Make a basic scatter plot :
plot_ly(d, x = d$carat, y = d$price, text = paste("Clarity: ", d$clarity),
          mode = "markers", color = d$carat, size = d$carat)