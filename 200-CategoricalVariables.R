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


















