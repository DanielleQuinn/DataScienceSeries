# Script Objectives ----
# Synthesize all of the amphibian data from National Parks by
# merging inconsistently formatted biodiversity data from several sources

# (a) data.txt : biodiversity records from all parks except ACAD and REDW
# (b) ACAD.txt : amphibian records from Acadia National Park
# (c) REDW_records.txt : incomplete records from Redwood National Park
# (d) REDW_species.txt : species information from Redwood National Park
# (e) parks_updated.txt : park details

# Goal: Clean and reshape these files, combine them with our existing data set

# Load Packages ----
library(dplyr)
library(tidyr)

# Tidy Data ----
# The {tidyverse} is a collection of packages that share an
# underlying design philosophy, grammar, and data structures and
# work with "tidy data", which follows specific rules and best practices

# {dplyr}: data manipulation
# {tidyr}: tidying data
# {ggplot2}: visualizing data
# {lubridate}: working with dates and times 
# {broom}: tidying output from models
# {stringr}: working with strings
# {forcats}: working with factors
# {purrr}: functional programming
# {rvest}: web scraping

# https://www.tidyverse.org/packages/

# These packages are effective because we're dealing with "tidy" data

# 1. Each row is an observation
# 2. Each column is a variable
# 3. Each cell contains a maximum of one piece of information

# If the data are not in this format, you'll need to fix it!

# Dataset 1: Biodiversity Data ----
## Import data ----


## Explore data ----

## Subset data ----
## We want to synthesize all of the amphibian records from National Parks
## and only keep records that have been Approved

# Dataset 2: Acadia National Park Data ----
## Import data ----


## Compare data sets ----


## What needs to change before we can combine these data frames?

## Goal: Apply these changes as a single workflow

## Change variable names to lower case ----
# dplyr::rename_with() : rename columns based on a function




## Unite record and id variables to single variable ----
# Goal: Create a column called record_id containing
# the values of record and id, separated by "-"

### Option 1 ----
# dplyr::mutate() and paste()

## Why does this create more work for us?

### Option 2 ----
# tidyr::unite() - unites two columns to create one new one in its place


## Fill order and family with appropriate values ----
# tidyr::fill() - fills missing values in a column using the previous entry


## Bind data and acadia data sets ----
# dplyr::bind_rows() - bind data frames by row (i.e. stack)


# Review changes



# Dataset 3: Redwood National Park Data ----
## Import data ----


## Compare data sets ----


## Take a few minutes to explore these two data frames
### How are the data structured?
### Can this data be combined with the larger data set?
### What are some problems?
### What steps would you need to take to successfully combine these data sources?

## Reshaping data ----
# tidyr::pivot_longer() : convert from wide to long format


## Drop unused records ----
# tidyr::drop_na() : drop all rows that contain any NAs

## Separate information found in oasr ----
# oasr represents occurrence, abundance, seasonality, and report_status

# tidyr::separate() : separate a string from one column into multiple columns


## Re-assess data ----
# lapply() : apply function to each column


## What is wrong with this data?

## Change "NA" to NA ----

### Option 1 ----
# use ifelse() apply changes to all three columns individually


### Option 2 ----
# use na_if() apply changes to all three columns individually
# dplyr::na_if() : if a value matches the given value, change it to NA


### Advanced Options ----
# create temporary data frame to demonstrate with
example <- read.delim("REDW_records.txt") %>%
  pivot_longer(cols = -record_id, names_to = "scientific_name", values_to = "oasr") %>%
  drop_na() %>%
  separate(oasr, into = c("occurrence", "abundance", "seasonality", "record_status"), sep = '-')

# pre-build a function


# (a) apply the pre-built function to each column


# (b) apply the pre-built function across specific columns


# (c) apply the pre-built function to any columns meeting a condition


# (d) build the function in-line and apply across columns meeting a condition


## Assess data for joining ----

## What variable will be used to "match" records?
## Does anything else need to change for that to happen?

## Remove . in scientific names ----
# scientific_name in redwood_records has . instead of a space

# gsub() : search for a pattern in a string and replace it

# Goal: Replace all "x" in our string with "y"

# Apply this to our data

## Join Redwood data ----
# dplyr::left_join(x, y) : return all rows from x and all columns from x and y

# Dataset 4: Park Details ----

## Import data ----

# Combine All Datasets ----

## Review data sets ----
# data: biodiversity data + acadia data

# redwood_complete: redwood_records + redwood_species

# parks: park details

## Bind / join data ----

## Save working data frame ----
