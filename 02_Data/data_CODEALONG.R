# ---- Packages ----
# Packages are user-created collections of objects, functions, and datasets that
# can be installed to RStudio and used to accomplish common tasks

# Download and install the dplyr package (one time)

# Load the dplyr package to your current session (every time)

# Best practice: add libraries at the top of your script

# ---- Import Parks Data ----
# Look at the names of the files available in your working directory

# parks.csv is in "comma separated values" format

# ---- QA/QC Techniques I: Exploring Data ----
# Explore Data: preview
     # Print the first six rows
     # Print the last six rows
     # View the data in a separate tab

# Explore Data: structure
     # How many rows?
     # How many columns?
     # How many rows and columns?
     # Print column names

# Explore Data: class
     # Print data structure

# ---- Interacting with Data Frames ----
# Interact with Data: columns as vectors
# Columns can be extracted as vectors using $
# objectname$component

# Interact with Data: indexing
# [*] represents the position of each value in an object

# vectors: one dimensional; one position required

# data frames: two dimensional, two positions required
     # Look at the value in the third row, second column of the data frame
     # Select the column based on column name

## Goal: Find the tenth value in the park_code column
## (a) indexing from a vector

## (b) indexing from a data frame using a numeric value to select the column

## (c) indexing from a data frame using a character value to select the column


# ---- QA/QC Techniques II: Assessing Data ----
# Assessing Data: numeric variables
     # Summary statistics

# Assessing Data: character variables
     # Print unique state values
     # How many unique state values?

# Simple Tables
     # Count occurrences of each state

# Simple Visualizations: Univariate
     # Histogram of acres
     # Barplot of states

# Simple Visualizations: Multivariate
     # Scatterplots of all variables
     # Scatterplot of acres by year
     # Distribution of acres by state

## Each park should have exactly one row in the data
## Which technique(s) would you use to confirm that no parks are repeated?

# ---- Import Fees Data ----
# fees.txt is in "tab separated values" format

## Explore the data and perform some QA/QC

# ---- Joining Data ----
# There is information in fees that we would like to
# add to the original parks data

# What variable(s) will be used to "match" records?

# dplyr::left_join(x, y) : return all rows from x and all 
# columns from x and y, matching each row based on 
# column names in common

# Create a new object that contains this updated data set

# QA/QC to confirm that this has worked

# ---- Import Coordinate Data ----
# coords.csv is in "comma separated values" format

## Explore
# Use functions learned above to explore the data
## QA/QC-
# Use techniques learned above to assess the data

## Join and update parks_updated object

# ---- Exporting Data ----
# Before exporting the data, it's always a good idea
# to do another round of QA/QC on the data frame you want to save

# NEVER overwrite your original data file #

# Export as a .csv

# Export as a .txt
