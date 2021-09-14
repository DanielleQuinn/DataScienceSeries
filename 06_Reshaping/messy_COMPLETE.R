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
data <- read.delim("data.txt")

## Explore data ----
dim(data) # Number of rows and columns
head(data) # First six rows
tail(data) # Last six rows
names(data) # Column names
str(data) # View the structure of the data frame
glimpse(data) # View the structure of the data frame using dplyr

## Subset data ----
## We want to synthesize all of the amphibian records from National Parks
## and only keep records that have been Approved
unique(data$category)
unique(data$record_status)

data <- read.delim("data.txt") %>%
  # 1. filter to only include approved amphibian data
  filter(category == "Amphibian",
         record_status == "Approved")

# Dataset 2: Acadia National Park Data ----
## Import data ----
acadia <- read.delim("ACAD.txt")

## Compare data sets ----
head(acadia, n = 4)
head(data, n = 4)

## What needs to change before we can combine these data frames?
# Change variable names to lower case
# Unite record and id variables to single variable
# Fill in order and family with appropriate values

## Goal: Apply these changes as a single workflow

## Change variable names to lower case ----
# dplyr::rename_with() : rename columns based on a function
## see also: {janitor} for more options

tolower("HELLO")

acadia <- read.delim("ACAD.txt") %>%
  # variable names to lower case
  rename_with(tolower)

head(acadia, n = 4)

## Unite record and id variables to single variable ----
# Goal: Create a column called record_id containing
# the values of record and id, separated by "-"

### Option 1 ----
# dplyr::mutate() and paste()
paste("A", "B", sep = "-")

acadia <- read.delim("ACAD.txt") %>%
  # 1. variable names to lower case
  rename_with(tolower) %>%
  # 2. create record.id variable
  mutate(record_id = paste(record, id, sep = "-"))

head(acadia, n = 4)

## Why does this create more work for us?

### Option 2 ----
# tidyr::unite() - unites two columns to create one new one in its place
acadia <- read.delim("ACAD.txt") %>%
  # 1. variable names to lower case
  rename_with(tolower) %>%
  # 2. create record_id variable
  unite(record_id, c(record, id), sep = "-")

head(acadia)

## Fill order and family with appropriate values ----
# The NAs can be filled in based on the previous values
acadia %>% select(order, family)

# tidyr::fill() - fills missing values in a column using the previous entry
acadia <- read.delim("ACAD.txt") %>%
  # variable names to lower case
  rename_with(tolower) %>%
  # create record.id variable
  unite(record_id, c(record, id), sep = "-") %>%
  # fill missing order and family values
  fill(order, family)

acadia %>% select(order, family)

## Bind data and acadia data sets ----
# Review first few rows
head(data, n = 4)
head(acadia, n = 4)

# Check matching names
names(data)
names(acadia)

# Check cohesive structure
glimpse(data)
glimpse(acadia)

# dplyr::bind_rows() - bind data frames by row (i.e. stack)
newdata <- read.delim("ACAD.txt") %>%
  # variable names to lower case
  rename_with(tolower) %>%
  # create record_id variable
  unite(record_id, c(record, id), sep = "-") %>%
  # fill missing order and family values
  fill(order, family) %>%
  # bind with original data
  bind_rows(data)

# Review changes
data %>%
  summarise(parks = n_distinct(park_name))

newdata %>%
  summarise(parks = n_distinct(park_name))


# Dataset 3: Redwood National Park Data ----
## Import data ----
redwood_records <- read.delim("REDW_records.txt") 
redwood_species <- read.delim("REDW_species.txt")

## Compare data sets ----
head(newdata)
head(redwood_records)
head(redwood_species)

glimpse(newdata)
glimpse(redwood_records)
glimpse(redwood_species)

View(newdata)
View(redwood_records)
View(redwood_species)

## Take a few minutes to explore these two data frames
### How are the data structured?
### Can this data be combined with the larger data set?
### What are some problems?
### What steps would you need to take to successfully combine these data sources?

## Reshaping data ----
head(redwood_records)

# tidyr::pivot_longer() : convert from wide to long format

redwood_records <- read.delim("REDW_records.txt") %>%
  # 1. pivot from wide to long layout
  pivot_longer(cols = -record_id, names_to = "scientific_name", values_to = "oasr")

head(redwood_records)

## Drop unused records ----
# tidyr::drop_na() : drop all rows that contain any NAs
redwood_records <- read.delim("REDW_records.txt") %>%
  # 1. pivot from wide to long layout
  pivot_longer(cols = -record_id, names_to = "scientific_name", values_to = "oasr") %>%
  # 2. drop rows with NAs
  drop_na()

head(redwood_records)

## Separate information found in oasr ----
# oasr represents occurrence, abundance, seasonality, and report_status

# tidyr::separate() : separate a string from one column into multiple columns
redwood_records <- read.delim("REDW_records.txt") %>%
  # 1. pivot from wide to long layout
  pivot_longer(cols = -record_id, names_to = "scientific_name", values_to = "oasr") %>%
  # 2. drop rows with NAs
  drop_na() %>%
  # 3. separate oasr into four variables
  separate(oasr,
           into = c("occurrence", "abundance", "seasonality", "record_status"), 
           sep = '-')

head(redwood_records)

## Re-assess data ----
# lapply() : apply function to each column
# print unique values of each column
redwood_records %>% lapply(unique)

## What is wrong with this data?

## Change "NA" to NA ----
# NAs are not being recognized as missing values, instead as the word "NA"

### Option 1 ----
# use ifelse() apply changes to all three columns individually
redwood_records <- read.delim("REDW_records.txt") %>%
  # 1. pivot from wide to long layout
  pivot_longer(cols = -record_id, names_to = "scientific_name", values_to = "oasr") %>%
  # 2. drop rows with NAs
  drop_na() %>%
  # 3. separate oasr into four variables
  separate(oasr,
           into = c("occurrence", "abundance", "seasonality", "record_status"), 
           sep = '-') %>%
  # 4. Change "NA" to NA in abundance, occurrence, and record_status
  mutate(abundance = ifelse(abundance == "NA", NA, abundance),
         occurrence = ifelse(occurrence == "NA", NA, occurrence),
         record_status = ifelse(record_status == "NA", NA, record_status))

### Option 2 ----
# use na_if() apply changes to all three columns individually
# dplyr::na_if() : if a value matches the given value, change it to NA
redwood_records <- read.delim("REDW_records.txt") %>%
  # 1. pivot from wide to long layout
  pivot_longer(cols = -record_id, names_to = "scientific_name", values_to = "oasr") %>%
  # 2. drop rows with NAs
  drop_na() %>%
  # 3. separate oasr into four variables
  separate(oasr,
           into = c("occurrence", "abundance", "seasonality", "record_status"), 
           sep = '-') %>%
  # 4. change "NA" to NA in abundance, occurrence, and record_status
  mutate(abundance = na_if(abundance, "NA"),
         occurrence = na_if(occurrence, "NA"),
         record_status = na_if(record_status, "NA"))

### Advanced Options ----
# create temporary data frame to demonstrate with
example <- read.delim("REDW_records.txt") %>%
  pivot_longer(cols = -record_id, names_to = "scientific_name", values_to = "oasr") %>%
  drop_na() %>%
  separate(oasr, into = c("occurrence", "abundance", "seasonality", "record_status"), sep = '-')

# pre-build a function
myfunction1 <- function(x) {ifelse(x == "NA", NA, x)}
myfunction1(c("hello", "NA", "goodbye"))

# (a) apply the pre-built function to each column
example %>%
  mutate(abundance = myfunction1(abundance),
         occurrence = myfunction1(occurrence),
         record_status = myfunction1(record_status))

# (b) apply the pre-built function across specific columns
example %>%
  mutate(across(c(abundance, occurrence, record_status), myfunction1))

# (c) apply the pre-built function to any columns meeting a condition
example %>%
  mutate(across(where(is.character), myfunction1))

# (d) build the function in-line and apply across columns meeting a condition
example %>%
  mutate(across(where(is.character), ~ifelse(. == "NA", NA, .)))

## Assess data for joining ----
# Eventually we want to be able to combine the information from 
# redwood_long and redwood_species

head(redwood_records)
head(redwood_species)

names(redwood_records)
names(redwood_species)

## What variable will be used to "match" records?
## Does anything else need to change for that to happen?

## Remove . in scientific names ----
# scientific_name in redwood_records has . instead of a space

# gsub() : search for a pattern in a string and replace it

# Goal: Replace all "x" in our string with "y"
gsub(pattern = "x", replace = "y", "xoxo")

## What happened?!
gsub(pattern = ".", replacement = " ", "this.is.a.test")
# Regular expressions: "a sequence of characters that specifies a search pattern"
# To learn more about regular expressions: https://r4ds.had.co.nz/strings.html

# . is a special character, so you need to tell R 
# that it is looking for the
# specific . character rather than any alternative 
# meaning the character might have
gsub(pattern = "\\.", replacement = " ", "this.is.a.test")

# Apply this to our data

# Solution:
redwood_records <- read.delim("REDW_records.txt") %>%
  # 1. pivot from wide to long layout
  pivot_longer(cols = -record_id, names_to = "scientific_name", values_to = "oasr") %>%
  # 2. drop rows with NAs
  drop_na() %>%
  # 3. separate oasr into four variables
  separate(oasr,
           into = c("occurrence", "abundance", "seasonality", "record_status"), 
           sep = '-') %>%
  # 4. change "NA" to NA in abundance, occurrence, and record_status and
  mutate(abundance = na_if(abundance, "NA"),
         occurrence = na_if(occurrence, "NA"),
         record_status = na_if(record_status, "NA")) %>%
  # 5. replace . with a space in the scientific_name column
  mutate(scientific_name = gsub(pattern = "\\.", replace = " ", scientific_name))

head(redwood_records)

## Join Redwood data ----
head(redwood_records)
head(redwood_species)

# dplyr::left_join(x, y) : return all rows from x and all columns from x and y
# match each row based on values in corresponding columns
redwood_complete <- redwood_records %>%
  left_join(redwood_species)

glimpse(redwood_complete)
head(redwood_complete)


# Dataset 4: Park Details ----

## Import data ----
parks <- read.delim("parks_updated.txt")
head(parks, n = 4)

# Combine All Datasets ----

## Review data sets ----
# data: biodiversity data + acadia data
head(data, n = 4)
names(data)

# redwood_complete: redwood_records + redwood_species
head(redwood_complete, n = 4)
names(redwood_complete)

# parks: park details
head(parks, n = 4)
names(parks)

## Bind / join data ----
data_complete <- data %>%
  bind_rows(redwood_complete) %>%
  left_join(parks)

glimpse(data_complete)

## Save working data frame ----
write.table(data_complete, "working_data.txt",
            row.names = FALSE, sep = "\t")
