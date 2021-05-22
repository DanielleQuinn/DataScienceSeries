# ---- Load Libraries ----
library(lubridate)
library(dplyr)
library(tidyr)

# ---- Import Data ----
data <- read.csv("data/clean_fish.csv")

# ---- Exploring Data Frames ----
View(data) # View data in a new tab
glimpse(data) # Display the structure of the object using {dplyr}

# ---- {tidyverse} ----
# The {tidyverse} is a collection of packages that share an
# underlying design philosophy, grammar, and data structures and
# work with "tidy data", which follows specific rules and best practices

# {dplyr}: data manipulation #
# {ggplot2}: visualizing data #
# {lubridate}: working with dates and times #
# {tidyr}: tidying data
# {broom}: tidying output from models
# {stringr}: working with strings
# {forcats}: working with factors
# {purrr}: functional programming
# {rvset}: web scraping

# https://www.tidyverse.org/packages/

# ---- Subsetting Data with {dplyr} ----
# select() : selects columns from a data frame and outputs as a data frame
# Example: Output the column called year
select(data, year)

## Can you explain why the output is different for each of these?
data$year
select(data, year)

# Goal: Output the columns called site and common_name
select(data, site, common_name)

# Goal: Convert the data frame to a tibble for easier viewing
data_tb <- as_tibble(data)
# A tibble is essentially the same as a data frame, with some extra features
# Today, primarily just the way the output is shown; more user friendly
data
data_tb

# Goal: Output the columns called site and common_name
select(data_tb, site, common_name)

# filter() : filters rows from a data frame
# Example: Output the rows where year is less than or equal to 2000
filter(data_tb, year <= 2000)

# Goal: Output the rows that correspond to data from site D
filter(data_tb, site == "D")

# Goal: Output the rows that correspond to data from pools in site D
filter(data_tb,
       site == "D",
       habitat == "pool")

## What is the output from the following line of code?
filter(data_tb,
       year %in% c(1999, 2001),
       month > 6,
       site == "A",
       common_name == "Creek Chub")

## What is the output from the following line of code?
filter(data_tb,
       between(year, 1999, 2001),
       month > 1,
       month < 4,
       site != "A",
       common_name == "Creek Chub")

# ---- Pipes ----
# Information is put into a pipe %>%
# It comes out the other end and is used as the first argument
# for the function on the other side

# Goal: Find the square root of 81
81 %>% sqrt()
# 81 becomes the argument for sqrt()

# Goal: Output the rows that correspond to data from site A
filter(data_tb, site == "A")

data_tb %>% filter(site == "A")
# data_tb becomes the first argument for filter

# This can also be written as
data_tb %>%
  filter(site == "A")

# Pipes are valuable when we want to perform multiple steps

# Goal: Find the square root of the absolute value of -16
# Nested functions
sqrt(abs(-16))

# Pipes
-16 %>% abs() %>% sqrt()

# Goal: Considering only data collected in 2000
# ouput the columns called year, habitat, and common_name
data_tb %>%
  filter(year == 2000) %>%
  select(year, habitat, common_name)

## Can you explain why this gives the same output?
data_tb %>%
  select(year, habitat, common_name) %>%
  filter(year == 2000)

## What would happen if you tried to run this?
data_tb %>%
  select(habitat, common_name) %>%
  filter(year == 2000)

## Choose any species.
# Output the common_name and count columns associated with that species.
data_tb %>%
  filter(common_name == "Green Sunfish") %>%
  select(common_name, count)

## Output the year, month, and site columns from instances where at least two
## individuals of that species were captured in a pool.
data_tb %>%
  filter(common_name == "Green Sunfish",
         count > 2,
         habitat == "pool") %>%
  select(year, month, site)

# ---- Summarising Data with {dplyr} ----
# summarise() : returns a single value based on the instructions you give it
# Goal: Find the maximum count
data_tb %>%
  summarise(max(count))

# group_by() : splits your data into groups based on the variables you specify
# Example: Group by site
data_tb %>%
  group_by(site)

# Goal: Use group_by() and summarise() together to find the average
# number of fish caught at each site
data_tb %>%
  group_by(site) %>%
  summarise(mean(count))

# This can be stored as a data frame
mean_counts <- data_tb %>%
  group_by(site) %>%
  summarise(mean(count))
mean_counts

# The column names can be specified in summarise
mean_counts <- data_tb %>%
  group_by(site) %>%
  summarise(average = mean(count))
mean_counts

# Goal: What is the average and sd of counts in each habitat type?
data_tb %>%
  group_by(habitat) %>%
  summarise(average = mean(count),
            sdev = sd(count))

# Goal: What is the average and sd of counts in each habitat type, by year?
data_tb %>%
  group_by(year, habitat) %>%
  summarise(average = mean(count),
            sdev = sd(count))

# Goal: What was the average number 
# of Creek Chub captured at each site?
data_tb %>%
  filter(common_name == "Creek Chub") %>%
  group_by(site) %>%
  summarise(average = mean(count))


# n() : counts occurences in each group using summarise()

# Goal: How many records at each site?
data_tb %>%
  group_by(site) %>%
  summarise(mycount = n())

## When might you use count() vs summarise(n())?
data_tb %>%
  group_by(site) %>%
  summarise(most_recent = max(year),
            total_records = n())


# n_distinct() : count unique values in each group using summarise()

# Goal: In how many unique years was each site sampled?
data_tb %>%
  group_by(site) %>%
  summarise(unique = n_distinct(year))

## Goal: How many total specimens were captured at each site?
data_tb %>%
  group_by(site) %>%
  summarise(total = sum(count))

## Goal: How many unique species were captured at each site?
data_tb %>%
  filter(count > 0) %>%
  group_by(site) %>%
  summarise(richness = n_distinct(common_name))


# ---- Manipulating Data with {dplyr} ----
# mutate() : create a new column
# Goal: Create a column called area, containing simulated sampling areas
# generated using rnorm()
set.seed(123) # This ensures that we all "randomly" generate the same values
myareas <- rnorm(n = nrow(data_tb), mean = 100, sd = 20)

data_tb %>%
  mutate(area = myareas)

# To make this change permanent, overwrite the data frame
data_tb <- data_tb %>%
  mutate(area = myareas)

# mutate() : create a new column based on another column
# Example: Create a column called density
data_tb <- data_tb %>%
  mutate(density = count / area)

glimpse(data_tb)

# Goal: Create a column called "present", that contains TRUE if a
# species was captured and FALSE if a species was not captured
data_tb$count > 0

data_tb <- data_tb %>%
  mutate(present = count > 0)

# Goal: Create a column called "present_v2" that contains "yes" if a 
# species was captured and "no" if a species was not captured
ifelse(data_tb$count > 0, "yes", "no")

data_tb <- data_tb %>%
  mutate(present_v2 = ifelse(count > 0, "yes", "no"))

glimpse(data_tb)

## Goal: Create a column called "records" that contains "new" if the 
# record was collected after 2010 and "old" if it was collected in 2009 or earlier
data_tb <- data_tb %>%
  mutate(records = ifelse(year > 2010, "new", "old"))

glimpse(data_tb)

# ---- Dealing with dates and times with {lubridate} ----
# Goal: Split the date column into year, month, and day columns
# tidyr::separate() : turns a single character column into multiple columns
data_tb <- data_tb %>%
  separate(date, into = c("year", "month", "day"), sep = "-")

# ymd() : takes a string representing year-month-day and converts it to a date
test_value <- "1999-11-21"
test_value
class(test_value)

test_date <- ymd(test_value)
test_date
class(test_date)

# Goal: Combine year, month, and day into a format that can be 
# converted to a date using the individual columns
data_tb <- data_tb %>%
  mutate(date = ymd(paste(year, month, day, sep = "-")))

# ---- Capstone {dplyr} Exercise ----
## Create a summary table called "table1" that contains the
# total, mean, maximum, and minimum number of Central Stonerollers
# captured by year, site, and habitat
table1 <- data_tb %>%
  filter(common_name == "Central Stoneroller") %>%
  group_by(year, site, habitat) %>%
  summarise(total = sum(count),
            mean = mean(count), 
            minimum = min(count),
            maximum = max(count))
table1
