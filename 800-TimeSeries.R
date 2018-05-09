# time series data
# seasonal patterns --seasonality
# identifying and estimating patterns --> forecasting
# assumes that there are no missing-data holes in the series
# seasonal decomposition
# trend vs raw data
# seasonal swing vs. residuals
# additive decomposition
# multiplicative decomposition
# forecasting
# confidence bands
# Holt-Winters method
# Holt-Winters is a good general purpose forecasting method, when the trend is basically monotone.
# comparing series --scales


# --- 8.6 Exercise - Time Series for a single variable ----------
# Install the iNZightTS package
# install.packages(c('iNZightTS'), dependencies =
#                      TRUE, repos =
#                      c('http://r.docker.stat.auckland.ac.nz/R',
#                        'https://cran.rstudio.com'))
# Load the Time Series Library
library(iNZightTS)
library(FutureLearnData)
# List the course datasets and select dataset
data(package="FutureLearnData")
data(week8_AverageVisitorsQuarterly)
head(week8_AverageVisitorsQuarterly)
# Create Time Series object for the Australian series
Australia = iNZightTS(week8_AverageVisitorsQuarterly, var=2)
# Plot the data -- t controls smoothing
rawplot(Australia , t=25)
# Now experiment with different values of t
# If you are on Windows and using R alone (not RStudio) try …
rawplot(Australia , t=25, animate=TRUE)
# Seasonal plot – additive
seasonplot(Australia)
# Seasonal plot – multiplicative
seasonplot(Australia, multiplicative=TRUE)
# Decomposition plot
decompositionplot(Australia, t=20)
# Recomposed plot
decomp=decompositionplot(Australia, t=20)
recompose(decomp, animate=FALSE)
# If you are on Windows and using R alone (not RStudio) try …
# recompose(decomp, animate=TRUE) # Got a fatal error be careful!!!
# Calculate a forecast
forecastplot(Australia)
# Let’s establish this pattern for another country
China = iNZightTS (week8_AverageVisitorsQuarterly, var=3)
rawplot(China , t=20)
decompositionplot(China, t=20)


# --- 8.10 Exercise - Time Series analysis for more than one series ----------
# Set up
library(iNZightTS)
library(FutureLearnData)
data(week8_AverageVisitorsQuarterly)
# See the variables in this dataset
head(week8_AverageVisitorsQuarterly)
# See how these work …
c(2,5,9)
c(2,4:6, 8)
# Create Time Series object for the set of countries
Aus_USA =
    iNZightTS(week8_AverageVisitorsQuarterly,
              var=c(2,9))
# Separate plots for Aus_USA
multiseries(Aus_USA, t=20)
# Create Time Series object for the whole set of countries we want to look at
ALL = iNZightTS(week8_AverageVisitorsQuarterly,
                var=c(2:9))
# Separate plots for ALL
multiseries(ALL, t=20)
# Separate plots for Aus_USA
compareplot(Aus_USA, t=30)
# Separate plots for ALL
compareplot(ALL, t=30)


