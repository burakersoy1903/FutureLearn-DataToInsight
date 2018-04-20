# Relationships between numeric & categorical variables
# Relationships between categorical & categorical variables
# Relationships between numeric & numeric variables
# Linear trends vs. Quadratic curves vs. Cubic curves vs. Smoothers with Slider
# Strong association (very little scatter compared to the movement in the trend) vs. weak (lots of scatter around the trend)
# Association vs. Correlation
# Correlation is a measure of how close the points are to lying on a straight line
# Correlation vs. Causation
# http://www.tylervigen.com/spurious-correlations
# Perceptual problems
# Overprinting vs. Jittering vs. Transparency vs. Size vs. Running quantiles
# Discreteness or Separateness
# More variables vs. Colour vs. Subsetting
# The Grammar of Graphics (Statistics and Computing)
# Visualization tools: Jittering, Transparency, Size, Running quantiles, Colour, Subsetting


# --- 4.1 More relationships ----------
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# Good practice future plots in the videos
# https://www.stat.auckland.ac.nz/~wild/wildaboutstatistics/index.html
# More Relationships (Introduction to week's coverage)
# min 1:10
# min 1:20
# ????????????????????????????????????????????????????????????????????????????????????????????????????


# --- 4.7 Exercise - Techniques for scatterplots ----------
# Setup
library(iNZightPlots)
library(FutureLearnData)
data(nhanes_1000)
# Plot Weight vs Age
iNZightPlot(Age, Weight,data=nhanes_1000)
# Add a trend line
iNZightPlot(Age, Weight, data=nhanes_1000, trend="linear")
# Get some summary information (result depends on trends fitted)
getPlotSummary(Age, Weight, data=nhanes_1000, trend="linear")
getPlotSummary(Age, Weight, data=nhanes_1000, trend="linear", summary.type="inference")
# Add more trend curves and a smoother
# The value given for the smooth (between 0 and 1) controls the level of smoothing.
# Bigger numbers correspond to more smoothing.
iNZightPlot(Age, Weight, data=nhanes_1000, trend=c("linear","quadratic", "cubic"), smooth=.25)
# Make all the lines thicker, all solid lines, and change line colours
iNZightPlot(Age, Weight, data=nhanes_1000, trend=c("linear","quadratic", "cubic") , smooth=.25, lwd=2,
            lty.trend=list(linear=1,quadratic=1,cubic=1),
            col.trend=list(linear="red", quadratic="yellow", cubic="blue"),
            col.smooth="green")
# Scatter plot coloured by Height and with Transparency
# alpha (0 to 1) controls transparency. Smaller for more transparent
iNZightPlot(Age, Weight, data=nhanes_1000, colby=Height, alpha=.3)
# Make the points smaller
iNZightPlot(Age, Weight, data=nhanes_1000, colby=Height, alpha=.3, cex.pt=.2)
# Create a median smoother in black
iNZightPlot(Age, Weight, data=nhanes_1000, colby=Height, alpha=.3, quant.smooth=.5, col.smooth="black")
# Create a median and quartile smoothers all in black
iNZightPlot(Age, Weight, data=nhanes_1000, colby=Height, alpha=.3,
            quant.smooth=c(.25,.5,.75), col.smooth="black")
# Let's have some fun!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Running quantiles
iNZightPlot(Age, Weight, data=nhanes_1000, colby=Height, alpha=.3,
            quant.smooth=c(.10,.25,.5,.75,.90), col.smooth="black")
# Fun ended!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# perceptual problems
iNZightPlot(Age, HomeRooms, data=nhanes_1000)
# Jitter in the vertical (y) direction
iNZightPlot(Age, HomeRooms, data=nhanes_1000, jitter="y")
# Let's have some fun!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
inzpar()
inzpar
?inzpar
# Fun ended!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Optional: Try this new feature (interactive web graphics)
# Make a plot and also store the output in myplot
myplot3 = iNZightPlot(Age, Weight, data=nhanes_1000, trend=c("linear", "quadratic"))
# Specify a location to store an Interactive HTML file. I will call my file "myintplot.html"
# You will have to change the path to the file because this one is to a location on my desktop!
filepath3 = "C:/Users/dch6712/Documents/R_Inventory/FutureLearn-DataToInsight/InteractiveWebGraphics/myintplot3.html" 
exportHTML(myplot3, filepath3)
browseURL(filepath3) #open the file up in my default browser
# Chrome: C:\Users\dch6712\Documents\R_Inventory\FutureLearn-DataToInsight\InteractiveWebGraphics\myintplot3.html
# To add extra variables, e.g. Country …
exportHTML(myplot3, filepath3, data=nhanes_1000, extra.vars = c("ID", "Gender"))


# --- 4.11 Exercise - Advanced scatterplots for deeper analysis ----------
# Remove all objects except for functions
rm(list = setdiff(ls(), lsf.str()))
# Setup
library(iNZightPlots)
library(FutureLearnData)
data(gapminder)
# Scatterplot of Infantmortaility against ChildrenPerWoman
iNZightPlot(ChildrenPerWoman, Infantmortality, data=gapminder)
# Subset by Year_cat
iNZightPlot(ChildrenPerWoman, Infantmortality, g1=Year_cat, data=gapminder)
# Change size and colour of points
iNZightPlot(ChildrenPerWoman, Infantmortality, g1=Year_cat, data=gapminder, 
            colby=Region, sizeby=Populationtotal)
# Show results for 1972 only
iNZightPlot(ChildrenPerWoman, Infantmortality, g1=Year_cat, g1.level="[1972]", data=gapminder,
            colby=Region, sizeby=Populationtotal)
# Darker background (often easier to see some of the lighter dots)
iNZightPlot(ChildrenPerWoman, Infantmortality, g1=Year_cat, g1.level="[1972]", data=gapminder,
            colby=Region, sizeby=Populationtotal, bg="darkgray")
# Try transparency and smaller points (removed garkgray)
iNZightPlot(ChildrenPerWoman, Infantmortality, g1=Year_cat, g1.level="[1972]", data=gapminder,
            colby=Region, sizeby=Populationtotal, alpha=.45, cex.dotpt=.5)
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# Try subsetting by different years, e.g. g1.level="[1976]",
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# Label some of the extreme points (ask for 4)
iNZightPlot(ChildrenPerWoman, Infantmortality, g1=Year_cat, g1.level="[1972]",data=gapminder,
            colby=Region, sizeby=Populationtotal, alpha=.45, cex.dotpt=.5,
            locate.extreme=4, locate=Country)
# Label some specific countries
ids = (1:nrow(gapminder))[gapminder$Country %in% c("United States of America","China","Brazil", "India")]
iNZightPlot(ChildrenPerWoman, Infantmortality, g1=Year_cat, g1.level="[1972]", data=gapminder,
            colby=Region, sizeby=Populationtotal, alpha=.45, cex.dotpt=.5,
            locate.id=ids, locate=Country)
# Allow a little more room on left to accommodate label
iNZightPlot(ChildrenPerWoman, Infantmortality, g1=Year_cat, g1.level="[1972]", data=gapminder, 
            colby=Region, sizeby=Populationtotal, alpha=.45, cex.dotpt=.5,
            locate.id=ids, locate=Country, xlim=c(0,9))
# Subset by a fourth variable (Region)
iNZightPlot(ChildrenPerWoman, Infantmortality, g1=Year_cat, g2=Region, g2.level="America", data=gapminder, 
            colby=Region)
# Play through the years
for (k in levels(gapminder$Year_cat)) {
    iNZightPlot(ChildrenPerWoman,Infantmortality, g1=Year_cat,
                g1.level=k, data=gapminder, colby=Region,
                sizeby=Populationtotal, alpha=.45, cex.dotpt=.5,
                locate.id=ids, locate=Country)
    Sys.sleep(1)
}


# --- 4.14 Weekly Reflections ----------
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# To get you going, try the dataset Census at School-500.csv which is in the top level of the data folder. 
# Drag armspan, height and rightfoot into “Response”, “Covariate 1” and “Covariate 2”. 
# Drag cellsource into “Group by” and click “Plot in 3D”. A little black graphics window will appear. 
# Enlarge it. Then if you click and drag somewhere on the plot you’ll be able to move things around. 
# Then play with the settings to see what they do.

# Is it possible to share the R version of 3-D plotting? I am sure it won't be a problem 
# to install any missing packages.
# Look in the car package by John Fox
# ????????????????????????????????????????????????????????????????????????????????????????????????????





