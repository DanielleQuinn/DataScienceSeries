# Load packages ----
library(ggplot2)
library(dplyr)

# Import data ----


# The grammar of graphics ----
# Any visualization has three components:
# 1. a data set (What are you trying to look at?)
# 2. a coordinate system (The most common are x and y axes)
# 3. a geom (How do you want to visualize the data set on the coordinate system?)

## Getting started with geom_point() ----
# Goal: Create a scatterplot
## x: year
## y: count

# Initialize ggplot()


# 1. Specify a data set


# 2. Specify a coordinate system


# 3. Specify a geom
# Option 1: coordinate system is part of ggplot()


# Option 2: coordinate system is part of geom_()


## geom_histogram() ----
# Goal: Create a histogram
## x: area


## geom_density() ----
# Goal: Create a density plot
## x: area


## geom_bar() ----
# Goal: Create a bar plot
## x: habitat


## Exercise 1 ----
# Reproduce the figure called figure1.png


# Reproduce the figure called figure2.png


## geom_boxplot() ----
# Goal: Create a boxplot
## x: site
## y: area


# Goal: Create a boxplot
## x: year
## y: area

## What happens if a continuous variable is used on the x axis?

# Option 1: force year to be categorical


# Option 2: add a group argument


## geom_violin() ----
# Goal: Create a violin plot
## x: site
## y: area


# Combining geom_() layers ----
# Goal: Create a scatterplot, overlayed with a violin plot
## x: site
## y: area
# Start with geom_point()


# Add geom_violin()


# Change geom_point() to geom_jitter()


# This syntax is less typing


# Add alpha argument to geom_() to set transparency


## Exercise 2 ----
# Reproduce the figure called figure3.png


# Adding colour ----
# Goal: Create a scatterplot
## x: year
## y: count


# Goal: Make points blue  

## Can you explain why this happens?!


## Exercise 3 ----
# Specify a colour from the full R colour palette
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

# Specify a colour using a hexidecimal code
# https://htmlcolorcodes.com/

# Doing more with colour ----
# Continuous variable
# Goal: Make the color of each point based on the month


# Categorical variable
# Goal: Make the color of each point based on site


# Exercise 4 ----
# Reproduce the figure called figure4.png


# Reproduce the figure called figure5.png
# Hint: try the "fill" argument


# ggplot() as an object ----
# Store ggplot() plots as an object


# Labeling variables ----
# Goal: Add labels on x and y axis
# Option 1


# Option 2


# Themes ----
# Goal: Tidy up the background colours


## Try out some of the other built-in themes!


## You can build your own themes, or adjust
## specific components of existing themes to
## customize your own figures

# Exercise 5 ----
# Reproduce the figure called figure6.png


# Facetting ----
# Goal: Add a layer to plot3 that creates a 
# separate panel for each habitat type


# Goal: Arrange the panels as a single column


# Goal: Create a grid with one panel for each
# combination of habitat and site


# Capstone exercise ----
# Reproduce the figure called myfigure.png

# Tip: Make a list of what needs to be done and tackle ONE thing at a time.

# Here is a list of things you'll need to do
# See how many you can accomplish!

# We haven't seen all of these yet! Don't hesitate to consult resources:
# http://www.cookbook-r.com/Graphs/

# Data preparation:
# (1) create a summary table of the average, minimum, and maximum number of
# Central Stonerollers caught by year, habitat, and site
# (2) filter these results to only consider records from pools sampled between
# 1999-2012

# Components of the plot:
# (1) Scatterplot with year on x axis and mean on y axis
# (2) X axis label is "Year"
# (3) Y axis label is "Mean Number Caught"
# (4) Theme is black and white
# (5) Point colour is based on site
# (6) Points are triangles
# (7) Facet your plot based on site
# (8) Stack all facet panels into one column
# (9) Draw a line connecting the points
## Hint: geom_line()
# (10) Draw a dashed line represented the maximum number captured per year
## Hint: Just like col and shape, there is an argument called linetype
# (11) Draw a dashed line representing the minumum number captured per year
# (12) Allow the y axis limits to be based only on the points within them
## Hint: Look at R Cookbook ggplot2 under "Facets"
# (13) Specify the colors to be used as red, blue, purple, orange, and black
## Hint: Look at R Cookbook ggplot2 under "Colors" > "Palettes Manually Defined"
# (14) Name the legend "Site ID"
## Hint: You can specify this in the name argument of the function used in step (13) 
# (16) Add a title: "Central Stonerollers in Pools (1999 - 2012)"
## Hint: ggtitle()
# (17) Store your finished plot in an object called myfigure
# (18) Save your plot to your working directory
## Hint: ggsave()
## Bonus: Make the plot 7 inches wide and 9 inches high

