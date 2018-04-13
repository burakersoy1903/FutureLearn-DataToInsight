# categorical variables: Dimensions
# numeric variables: Measures
# outcome variable: Education is our outcome of interest. 
# predictor variable: Age and gender are our predictor variables.
# separate bar graphs vs. side-by-side bar chart
# revealing gross differences and overall shape vs. detailed differences
# global environment: Data (nhanes_1000, myplot, Temp) vs. Values (filepath)
# Projecting husband: https://xkcd.com/605/
# Plot y=EnergyUsePerPerson by x=CO2emissions
# Plot y=EnergyUsePerPerson versus x=CO2emissions
# (x) gets plotted against the horizontal axis vs. (y) is plotted against the vertical axis
# So we should put the predictor variable first and the outcome variable second.
# iNZightPlot(x,y)
# When we have a trend in our scatter plot, the scatter around the trend tells us how strong a relationship is.


# --- 3.2 Relationships between categorical variables and 3.4 Changes across sub groups ----------
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# Good practice future plots in the videos
# https://www.stat.auckland.ac.nz/~wild/wildaboutstatistics/index.html
# ????????????????????????????????????????????????????????????????????????????????????????????????????

# --- 3.5 Exercise - Relationships between categorical variables ----------
# Clean the global environment
rm(nhanes_1000)
# Setup
library(iNZightPlots)
library(FutureLearnData)
data(nhanes_1000)
names(nhanes_1000)
# Recreate Education.reord
nhanes_1000$Education.reord = factor(nhanes_1000$Education,
                                     levels =
                                         c("8thGrade","9_11thGrade","HighSchool","SomeCollege","CollegeGrad"))
iNZightPlot(Education.reord, data=nhanes_1000)
# Education.reord by Gender (side by side barcharts)
# Side-by-side bar chart
iNZightPlot(Education.reord, Gender, data=nhanes_1000)
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# How to specify color to a variable (female -- pink)
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# Education subset by Gender (also coloured by Gender)
# Separate bar graphs
iNZightPlot(Education.reord, g1=Gender, data=nhanes_1000,
            colby=Gender)
# g1: This variable acts as a subsetting variable
?iNZightPlot
# Display just the female plot
iNZightPlot(Education.reord, g1=Gender, g1.level="female", data=nhanes_1000, colby=Gender)
# Display just the male plot
iNZightPlot(Education.reord, g1=Gender, g1.level="male", data=nhanes_1000, colby=Gender)
# Plot Education.reord subset by AgeDecade
iNZightPlot(Education.reord, g1=AgeDecade, data=nhanes_1000, colby=AgeDecade)
# Filter out unhelpful data (Under 20s)
# Make a subset of the data without “under 20s” & call it Temp
# (This is an example of “filtering” the data)
# (Warning: there is a leading space on all of AgeDecade’s level names– a data bug)
Temp = subset(nhanes_1000, AgeDecade!=" 0-9" & AgeDecade!=" 10-19") # “!=” is read as “is not equal to”
table(Temp$AgeDecade)
# This will remove the empty levels
Temp$AgeDecade=factor(Temp$AgeDecade)
table(Temp$AgeDecade)
# Replot the data using the subset of the data called Temp
iNZightPlot(Education.reord, g1=AgeDecade, data=Temp, colby=AgeDecade)
iNZightPlot(Education.reord, AgeDecade, data=Temp, colby=AgeDecade)
# Let's have some fun!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Interesting chart :D
iNZightPlot(Education.reord, g1=Education.reord, data=nhanes_1000, colby=Gender)
# Stacked bar chart
iNZightPlot(Education.reord, data=nhanes_1000, colby=Gender)
iNZightPlot(Education.reord, data=nhanes_1000, colby=SexEver) #OMG!
iNZightPlot(Education.reord, data=nhanes_1000, colby=HomeOwn) #As expected
iNZightPlot(Education.reord, data=nhanes_1000, colby=MaritalStatus) #8th Grade Really?
# Fun ended!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Optional: Try this new feature (interactive web graphics)
# Here is sample code: This only works with single graphs, not panels containing multiple graphs
# If that is a modern browser like Chrome, Firefox or Safari (but not Internet Explorer) this will 
# then give you an interactive version of the graph that lets you query it in various ways like 
# hovering over bars or clicking them.
# Make a plot and also store the output in myplot
myplot = iNZightPlot(Education.reord, Gender, data=nhanes_1000)
# Specify a location to store an Interactive HTML file. I will call my file "myintplot.html"
# You will have to change the path to the file because this one is to a location on my desktop!
# filepath = "C:/Users/cwil119/Desktop/myintplot.html"
filepath = "C:/Users/dch6712/Documents/R_Inventory/FutureLearn-DataToInsight/InteractiveWebGraphics/myintplot.html"
exportHTML(myplot, filepath)
browseURL(filepath) #open the file up in my default browser
# Chrome: file:///C:/Users/dch6712/Documents/R_Inventory/FutureLearn-DataToInsight/InteractiveWebGraphics/myintplot.html


# --- 3.8 Trend, scatter and outliers ----------
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# Good practice future plots in the videos
# https://www.stat.auckland.ac.nz/~wild/wildaboutstatistics/index.html
# ????????????????????????????????????????????????????????????????????????????????????????????????????


# --- 3.9 Exercise - Relationships between numeric variables ----------
# When we call iNZightPlot(x,y) using two numeric variables x and y we will get a scatterplot.
# The 1st variable (x) gets plotted against the horizontal axis and the 2nd variable (y) is plotted
# against the vertical axis. So we should put the predictor variable first and the outcome
# variable second.
# Clean the global environment 
ls() # List all objects in global environment
rm(list = setdiff(ls(), lsf.str())) # Remove all objects except for functions
# It uses setdiff to find the subset of objects in the global environment (as returned by ls()) 
# that don't have mode function (as returned by lsf.str())
# Setup
library(iNZightPlots)
library(FutureLearnData)
data(gapminder_2008)
# Plot y=EnergyUsePerPerson by x=CO2emissions
# Plot y=EnergyUsePerPerson versus x=CO2emissions
# (x) gets plotted against the horizontal axis vs. (y) is plotted against the vertical axis
# So we should put the predictor variable first and the outcome variable second.
iNZightPlot(CO2Emissions, EnergyUsePerPerson, data=gapminder_2008)
# Note the reversal in the order of the names between the call and
# ordinary English usage for what we want to do!
# Label the 4 most extreme points by the variable Country
iNZightPlot(CO2Emissions, EnergyUsePerPerson, data=gapminder_2008, locate.extreme=4, locate=Country)
# Add a trend line
iNZightPlot(CO2Emissions, EnergyUsePerPerson, data=gapminder_2008, trend="linear")
# Changing from the default Axes labels and title
iNZightPlot(CO2Emissions, EnergyUsePerPerson, data=gapminder_2008, 
            xlab="CO2 emissions per person ",
            ylab="Energy use per person", 
            main="Energy use versus CO2 emissions")
# Put on a trend line but coloured red, instead of the default (blue)
iNZightPlot(CO2Emissions, EnergyUsePerPerson, data=gapminder_2008, trend="linear",
            col.trend=list(linear="red"))
# Label specified data points
ids = (1:nrow(gapminder_2008))[gapminder_2008$Country %in% c("Qatar","Iceland","Sweden")]
iNZightPlot(CO2Emissions, EnergyUsePerPerson, data=gapminder_2008, 
            locate.id=ids, locate=Country)
# Let's have some fun!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
library(iNZightPlots)
?iNZightPlot
args(iNZightPlot) # Argument List of a Function
inzpar()
?inzpar
?par
?ggplot2
# Fun ended!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# Good practice future plots in the Observations of scatterplots (page 4)
# Check "Exercises/3.09-exercise-relationships-between-numeric-variables_R_17.pdf"
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# Optional: Try this new feature (interactive web graphics)
# Make a plot and also store the output in myplot
myplot2 = iNZightPlot(CO2Emissions, EnergyUsePerPerson, data=gapminder_2008, trend="linear")
# Specify a location to store an Interactive HTML file. I will call my file "myintplot.html"
# You will have to change the path to the file because this one is to a location on my desktop!
filepath2 = "C:/Users/dch6712/Documents/R_Inventory/FutureLearn-DataToInsight/InteractiveWebGraphics/myintplot2.html"
exportHTML(myplot2, filepath2)
browseURL(filepath2) #open the file up in my default browser
# Chrome: C:\Users\dch6712\Documents\R_Inventory\FutureLearn-DataToInsight\InteractiveWebGraphics\myintplot2.html
# If the plot is truncated make your R plotting window smaller
# To add extra variables, e.g. Country …
exportHTML(myplot2, filepath2, data=gapminder_2008, extra.vars = c("Country", "Populationtotal"))







