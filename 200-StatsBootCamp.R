# --- 2.5 Exercise - Categorical variables ----------
# Setup
library(iNZightPlots)
library(FutureLearnData)
data(nhanes_1000)
# names(nhanes_1000) # Give me the names of all of the variables in nhanes_1000

# Plot the variable Race3
# Because Race3 is categorical we get a bar chart
iNZightPlot(Race3, data=nhanes_1000)

# Get a summary for a variable (Race3)
# Equiv. of Get Summary in iNZight
getPlotSummary(Race3, data=nhanes_1000)

# Equivalent of Get Inference in iNZight
getPlotSummary(Race3, data=nhanes_1000,
               summary.type="inference", inference.type="conf")

# Colour by a variable (Race3) (default colour palette)
iNZightPlot(Race3, data=nhanes_1000, colby=Race3)

# Create a new variable Race3.reord to re-order Race3
# with the categories in frequency order
# Factors in R are like DUALS in Qlik -- it holds both the data and numeric order value
levels(nhanes_1000$Race3)
nhanes_1000$Race3.reord =
    factor(nhanes_1000$Race3, levels = c("White",
                                         "Black", "Mexican", "Hispanic", "Asian", "Other") )
levels(nhanes_1000$Race3.reord)
iNZightPlot(Race3.reord, data=nhanes_1000)

# We’ll do this again putting the levels of Education into
# a sensible order
iNZightPlot(Education, data=nhanes_1000)
levels(nhanes_1000$Education)

# Create a new variable to re-order Education
nhanes_1000$Education.reord =
    factor(nhanes_1000$Education, levels =
               c("8thGrade","9_11thGrade","HighSchool",
                 "SomeCollege","CollegeGrad") )
levels(nhanes_1000$Education.reord)
iNZightPlot(Education.reord, data=nhanes_1000)
getPlotSummary(Education.reord, data=nhanes_1000)
iNZightPlot(Education.reord,
            data=nhanes_1000,colby=Education.reord) # Colour by Education.reord

# Now change the colour palette to rainbow colours
iNZightPlot(Education.reord,
            data=nhanes_1000,colby=Education.reord,
            col.fun=rainbow)
library(colorspace)
iNZightPlot(Education.reord,
            data=nhanes_1000,colby=Education.reord,
            col.fun=rainbow_hcl)
library(viridis)
library(viridisLite)
iNZightPlot(Education.reord,
            data=nhanes_1000,colby=Education.reord,
            col.fun=viridis)
iNZightPlot(Education.reord,
            data=nhanes_1000,colby=Education.reord,
            col.fun=magma)
iNZightPlot(Education.reord,
            data=nhanes_1000,colby=Education.reord,
            col.fun=inferno)


# -- 2.7 Numeric variables and 2.9 Feature spotting ----------
names(nhanes_1000)
# How to limit dataset? Like the first 200 values of dataset? (2.7 min 1:42)
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# How to draw a barchart? (2.7 min 5:30)
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# Get a Summary for Pulse
# Good example for larger spread and unimodal/symmetric
# Good mean/median balance, larger spread (quite variable), unimodal, have oddities
iNZightPlot(Pulse, data=nhanes_1000, colby=Age)
getPlotSummary(Pulse, data=nhanes_1000)
# Get a Summary for BPDiaAve
# Good example for oddities --Zeros on the left! Are they errors?
iNZightPlot(BPDiaAve, data=nhanes_1000, colby=Age)
getPlotSummary(BPDiaAve, data=nhanes_1000)
# Get a Summary for UrineVol1
# Good example for positively (right) skewed
iNZightPlot(UrineVol1, data=nhanes_1000, colby=Age)
getPlotSummary(UrineVol1, data=nhanes_1000)
# Get a Summary for Weight
# Good example for bimodal --misture of two different groups 
iNZightPlot(Weight, data=nhanes_1000, plottype="hist")
iNZightPlot(Weight, data=nhanes_1000, colby=Age)
iNZightPlot(Weight, data=nhanes_1000, colby=AgeDecade)
getPlotSummary(Weight, data=nhanes_1000)
# Get a Summary for Height
# Good example for negatively (left) skewed
iNZightPlot(Height, data=nhanes_1000, colby=Age)
iNZightPlot(Height, data=nhanes_1000, colby=AgeDecade)
getPlotSummary(Height, data=nhanes_1000)
# Get a Summary for BMI
# Good example for positively (right) skewed
iNZightPlot(BMI, data=nhanes_1000, colby=Age)
iNZightPlot(BMI, data=nhanes_1000, colby=AgeDecade)
getPlotSummary(BMI, data=nhanes_1000)

# --- 2.10 Exercise - Numeric variables ----------
# Setup
library(iNZightPlots)
library(FutureLearnData)
data(nhanes_1000)
# Plot a numeric variable (Pulse)
# Let's talk about: Centre, Spread, Shape, and Oddities (CSSO) :)
iNZightPlot(Pulse, data=nhanes_1000)
# Changing the size of the dots
iNZightPlot(Pulse, data=nhanes_1000, cex.dotpt=.4)
iNZightPlot(Pulse, data=nhanes_1000, cex.dotpt=2)
# Get a Summary for Pulse
getPlotSummary(Pulse, data=nhanes_1000)
# Colour points by Age
iNZightPlot(Pulse, data=nhanes_1000, colby=Age)
# Equivalent of Get Inference for Pulse
getPlotSummary(Pulse, data=nhanes_1000,
               summary.type="inference",
               inference.type="conf")
# Plot a numeric variable (Height)
iNZightPlot(Height, data=nhanes_1000) # Negatively skewed
# Colour points by Age
iNZightPlot(Height, data=nhanes_1000, colby=Age)
# Change colour palette to rainbow
iNZightPlot(Height, data=nhanes_1000, colby=Age,
            col.fun=rainbow)
#  Change Plot type to histogram (Height)
iNZightPlot(Height, data=nhanes_1000, plottype=
                "hist")
#  Control the number of bins (class intervals) 
iNZightPlot(Height, data=nhanes_1000, plottype=
                "hist", hist.bins=10)
#  Get a list of all the other things that can be changed in plots 
inzpar() # This list is complete
?inzpar # This documentation is not complete
?iNZightPlot


# --- 2.12 Comparing groups ----------
# How to draw Children Per Woman by Region 2012?
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# Color by Life Expectancy
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# Color by Infant Mortality
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# Color by Income Per Person on a log scale (log 10)
# ????????????????????????????????????????????????????????????????????????????????????????????????????


# --- 2.13 Exercise - Comparing groups ----------
# Setup
library(iNZightPlots)
library(FutureLearnData)
data(gapminder_2008)
names(gapminder_2008)
# Plot a numeric variable (ChildrenPerWoman)
# Dot plot for ChildrenPerWoman
iNZightPlot(ChildrenPerWoman, data=gapminder_2008)
# Now break out by Region
iNZightPlot(ChildrenPerWoman, Region,
            data=gapminder_2008)
# Get Summary of ChildrenPerWoman broken out by Region
getPlotSummary(ChildrenPerWoman, Region,
               data=gapminder_2008)
# Colour by Region
iNZightPlot(ChildrenPerWoman, Region,
            data=gapminder_2008, colby=Region)
# Try also
# Smaller legend font size
iNZightPlot(ChildrenPerWoman, Region, data=gapminder_2008,
            colby=Region, cex.text=.3)
# No legend
iNZightPlot(ChildrenPerWoman, Region, data=gapminder_2008,
            colby=Region, hide.legend = TRUE)
# Colour by Infantmortality
iNZightPlot(ChildrenPerWoman, Region,
            data=gapminder_2008, colby=Infantmortality)


# --- 2.14 Time travel ----------
# How to Region versus Children per woman subset by Leap Year (2.14 Min 0:40)
# ????????????????????????????????????????????????????????????????????????????????????????????????????
# How to Leap year versus Children per Woman subset by region (2.14 Min 1:58)
# ????????????????????????????????????????????????????????????????????????????????????????????????????


# --- 2.15 Exercise - Time travel ----------
# Setup
library(iNZightPlots)
library(FutureLearnData)
data(gapminder)
names(gapminder)
iNZightPlot(ChildrenPerWoman, Region, data=gapminder)
# Plot ChildrenPerWoman by Region subset by Year_cat
iNZightPlot(ChildrenPerWoman, Region, g1=Year_cat, data=gapminder)
# Remind ourselves how the levels of Year_cat are represented
levels(gapminder$Year_cat)
# Display just the plot for the year 2000
iNZightPlot(ChildrenPerWoman, Region, g1=Year_cat,
            g1.level="[2000]", data=gapminder)
# Do it again for 2004
iNZightPlot(ChildrenPerWoman, Region, g1=Year_cat,
            g1.level="[2004]", data=gapminder)
# Now put it in a loop and do it for every year, i.e. for every level of Year_cat
for (k in levels(gapminder$Year_cat)) iNZightPlot(ChildrenPerWoman,Region, g1=Year_cat,
                                                  g1.level=k, data=gapminder)
# Do not display a new plot UNTIL you have clicked on the on plot window
old.value = devAskNewPage(TRUE) # save current plotting behaviour and ask for new behaviour
for (k in levels(gapminder$Year_cat))
    iNZightPlot(ChildrenPerWoman,Region, g1=Year_cat, g1.level=k, data=gapminder)
devAskNewPage(old.value) # Reset the plotting behaviour back to the way it was before
# Play the plots, but with a 2 second delay between plots
# This time there are 2 lines of code to be run at each step so we have to put them in “{ .. }”
# brackets so that both lines get run
for (k in levels(gapminder$Year_cat)) {
    iNZightPlot(ChildrenPerWoman,Region, g1=Year_cat, g1.level=k,
                data=gapminder)
    Sys.sleep(2)
}













