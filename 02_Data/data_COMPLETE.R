# ---- Project Description ----
# This project is used for ...
# It was last updated by ... on ...

R.version.string

# ---- Load packages ----
library(lubridate)
library(stringr)
library(dplyr)

# Note: If an error is produced saying there is no such package
# it means you need to install the package using install.packages()

# ---- Importing Data ----
# List the files & folders that are available in your project
list.files()

# List the files and folders available in the "data" folder
list.files("data")

# Comma Separated Values (.csv)
data <- read.csv("data/fish.csv")

# Tab Delimited Values (.txt)
taxonomy <- read.delim("data/taxonomy.txt")

# ---- Exploring Data Frames ----
View(data) # View data in a new tab
View(taxonomy)

dim(data) # Number of rows and columns
nrow(data) # Number of rows
ncol(data) # Number of columns

head(data) # Display the first six rows
tail(data) # Display the last six rows
names(data) # Display the names of each column

summary(data) # Summarise each column
str(data) # Display the structure of the object
glimpse(data) # Display the structure of the object using {dplyr}

# ---- Factors ----

##########################################################################
## By default ...                                                        #
## R < 4.0 character columns in imported data are treated as FACTORS     #
## R >= 4.0 character columns in imported data are treated as CHARACTERS #
##########################################################################

# Factors are variables that have levels / categories / groups

class(data$habitat) # If R < 4.0, this will be a factor. If R >= 4.0, this will be a character.

# Step One: Do we want to treat this variable as a factor or a character?

# Step Two: Do we need to change it?
class(data$habitat)

# Step Three: If so...

## Change a character column to a factor
class(data$habitat)
data$habitat <- as.factor(data$habitat)
class(data$habitat)
levels(data$habitat) # What levels (categories) do we have?
str(data) # How does this change the structure?

## Change a factor column to a character
class(data$habitat)
data$habitat <- as.character(data$habitat)
class(data$habitat)

# WARNING: What happens if you tried to switch from a factor to a number?
test_sites <- as.factor(c(34, 34, 35, 35, 36, 36)) # Create a new object to test this out on
test_sites # This is what it looks like
class(test_sites) # It is a factor
levels(test_sites) # It has three levels
as.numeric(test_sites) # Why do you think this happens?

# If you use R >= 4.0 you are less likely to run into trouble with factors!

# ---- Joining Data ----
# How might we want to combine these data sets?
head(data)
head(taxonomy)

# Demonstration Using Test Data
test_survey1 <- data.frame(person = c("A", "B", "C", "D"),
                           colour = c("red", "blue", "green", "blue"))

test_survey2 <- data.frame(person = c("A", "B", "C", "E", "F", "G"),
                           animal = c("dog", "dog", "cat", "horse", "dog", "cat"))

test_survey1
test_survey2

# Functions in the _join(x, y) family add columns from y to x, matching rows based on the key(s)

# left_join(x, y)   : keeps all rows that appear in x
left_join(test_survey1, test_survey2)

# inner_join(x, y)   : keeps all rows that appear in BOTH x and y
inner_join(test_survey1, test_survey2)

# full_join(x, y)   : keeps all rows that apear in EITHER x or y
full_join(test_survey1, test_survey2)


## Which join do we want to use to combine our two data frames?
head(data)
head(taxonomy)

left_join(data, taxonomy)

# Make this change permanent
data <- left_join(data, taxonomy)

# ---- Converting Cases ----
# Is there anything we might want to do to clean up the scientific names?
data$scientific_name

# Convert to lower case
str_to_lower(data$scientific_name)

# Convert to title case
str_to_title(data$scientific_name)

# Convert to sentence case
str_to_sentence(data$scientific_name)

# Make the change permanent by overwriting the existing column
head(data) # Still in upper case
data$scientific_name <- str_to_sentence(data$scientific_name)
head(data) # Converted to title case

# ---- Write (Save) Changes to a New File ----
write.csv(data, "data/clean_fish.csv", row.names = FALSE)
