# --- 1.10 Exercise - Install iNZight  ----------
# install.packages(c('iNZightPlots', 'FutureLearnData'), dependencies = TRUE,
#                 repos = c('http://r.docker.stat.auckland.ac.nz/R', 'https://cran.rstudio.com'))

library(iNZightPlots) # Load the iNZightPlots package
library(FutureLearnData) # Load the FutureLearnData package (contains all the datasets for the course)
data(package="FutureLearnData") # Tell me about all the data sets in FutureLearnData
data(nhanes_1000) # Make the data set nhanes_1000 in FutureLearnData available for analysis
nhanes_1000[1:10, 1:8] # Show me the first 10 rows and 8 columns of nhanes_1000
head(nhanes_1000) # Show me the top rows of nhanes_1000
tail(nhanes_1000) # Show me the bottom rows of nhanes_1000
names(nhanes_1000) # Give me the names of all of the variables in nhanes_1000
?names
iNZightPlot(Race3, data=nhanes_1000) # Plot the variable named Race3 in nhanes_1000
iNZightPlot(Height, data=nhanes_1000) # Plot the variable named Height in nhanes_1000
getPlotSummary(Height, data=nhanes_1000) # Get me a Summary of the variable named Height in nhanes_1000


# --- 1.10 Practice - Install iNZight  ----------
names(nhanes_1000) # Give me the names of all of the variables in nhanes_1000
iNZightPlot(Race3, Height, data=nhanes_1000) # Race3 is a dimension and Height is a measure
iNZightPlot(Height, Race3, data=nhanes_1000) # Does not matter what order, it will create the same graph
# It creates a Box-and-whisker plot for every dimension
# Slice by Race3 and dice by Height --Measure is always X and Dimension is Y
# Height by Race3 --Measure by Dimension -- X by Y
iNZightPlot(Pulse, Height, data=nhanes_1000) # Pulse is a measure and Height is a measure
iNZightPlot(Height, Pulse, data=nhanes_1000) # First value is X and Second value is Y
# It creates a Scatter Plot
iNZightPlot(Race3, Gender, data=nhanes_1000) # Race3 is a dimension and Gender is a dimension
iNZightPlot(Gender, Race3, data=nhanes_1000) # First value is X and Second value is Y
# It creates a Histogram plot with proportion (%)
# https://datavizcatalogue.com/methods/histogram.html


# --- 1.15 Exercise - Load data into iNZight  ----------
library(FutureLearnData) # Load the package FutureLearnData
data(package= "FutureLearnData") # give me info about the data in the package FutureLearnData
# I can copy and paste from this to get the names of data sets exactly right
data(olympics100m) # data(dataset name) makes it available for use
olympics100m # saying the name of something causes it to display in console
View(olympics100m) # to open table as a tab --Be careful it is View (uppercase V)
# OK to do here as this particular dataset is small
# Otherwise use commands from Exercise 1.10 for displaying small parts of the data set
# Olympics100m # this name is wrong because of the capital "O" so will give an error
# data(package= “FutureLearnData”) # curly quotation marks “ from Word, not straight ones, ", so error
# This whole block of lines can be copied and pasted as code. Try it

# Import the file Census at School-500.csv
cas_500 = read.csv(file.choose(), header = TRUE) # file.choose() is telling R to throw up a browser window that 
# will allow you to navigate to wherever you have stored
# header = TRUE tells R that this file has a header line containing the names of the variables
cas_500[1:5, 1:9]
names(cas_500)
library(iNZightPlots)
iNZightPlot(armspan, data= cas_500)
# Now import the file olympics100m.txt
Olymp_imp = read.table(file.choose(), header = TRUE, sep="\t") # We include sep="\t" to tell R to look for tab
# characters as the separators between data fields
iNZightPlot(YEAR, TIME, data= Olymp_imp)
?read.table
?read.csv
?iNZightPlot


















