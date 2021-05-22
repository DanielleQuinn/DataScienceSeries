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


# List the files and folders available in the "data" folder


# Comma Separated Values (.csv)


# Tab Delimited Values (.txt)


# ---- Exploring Data Frames ----
    # View data in a new tab


    # Number of rows and columns
    # Number of rows
    # Number of columns

    # Display the first six rows
    # Display the last six rows
    # Display the names of each column

    # Summarise each column
    # Display the structure of the object
    # Display the structure of the object using {dplyr}

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

# Step Three: If so...

## Change a character column to a factor


## Change a factor column to a character


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


# inner_join(x, y)   : keeps all rows that appear in BOTH x and y


# full_join(x, y)   : keeps all rows that apear in EITHER x or y



## Which join do we want to use to combine our two data frames?
head(data)
head(taxonomy)



# Make this change permanent


# ---- Converting Cases ----
# Is there anything we might want to do to clean up the scientific names?


# Convert to lower case


# Convert to title case


# Convert to sentence case


# Make the change permanent by overwriting the existing column


# ---- Write (Save) Changes to a New File ----
