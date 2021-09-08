# ---- R Script Fundamentals ----
# This is an R script; it is a document that contains the
# set of instructions that we want to apply

# Input goes here
# Output will appear in the Console

# Note: a "#" indicates a comment; R will not try to interpret this as code

# ---- Running Code ----
# Shortcuts:
## On Windows, Ctrl-Enter to run a line of code
## On Mac Cmd-Enter

# You should see > in the lower left hand corner of the Console window
# If you see + you have missed a piece of code and R is waiting
## Click in the Console and hit Escape to reset
# If you see     R is running a process in the background

# ---- Mathematical Operators ----
# R can be used as a calculator
5 + 6          # + for addition
5 - 9          # -  for subtraction
6 * 7          # * for multiplication
7 / 13         # / for division
2 ^ 5          # ^ for exponent
2 ** 5         # ** for exponent (alternative)
5 %% 2         # %% for modulus ("remainder")
10 %/% 3       # %/% for integer division

(4 + 5)/6      # order of operations is followed

## Where is this applicable?
## Simple to complex arithmatic

# ---- Conditional Operators ----
# Logical statements, return TRUE or FALSE
# == "is equal to"
# > "is greater than"
# < "is less than"
# >= "is greater than or equal to"
# <= "is less than or equal to"
# != "is not equal to"
# ! "is not"

# 5 is equal to 5
5 == 5        

# 5 is equal to 6
5 == 6

# 5 is greater than 6
5 > 6

# 5 is greater than or equal to 6
5 >= 6

# 5 is not equal to 6
!5 == 6
5 != 6

# 5 is equal to 5 AND 7 is greater than 6
5 == 5 & 7 > 6

# 5 is equal to 5 OR 7 is greater than 10
5 == 5 | 7 > 10

## Complete each conditional statement below so it returns TRUE
3 * 5 == 15
1/2 != 1/4
30 == 10 * 3 & 40 * 10 < 405

## Where is this applicable?
## Subsetting data
## Accessing analytical results that meet specific criteria

# ---- Functions ----
# Functions "do things"
# Recognizable by the function name followed by (
# Every ( needs a )
# The information inside the () is called the argument

# FunctionName(argument)

# Goal: Find the square root of 81
# Function name: sqrt
# Argument: 81
sqrt(81)

# Goal: Find the absolute value of 6 - 14
# Function name: abs
# Argument: 6 - 14
abs(6 - 14)

# Functions require specific types of arguments
sqrt("a")

# Getting help with a function
?sqrt

## Try using the functions called log, log10, and exp
# What do each of them do?
log(10)   # computes natural logarithm
log10(10) # computes base 10 logarithm
exp(10)   # computes the exponential function

# Arguments are named, but it's not always neccessary to call them by name
# sqrt() requires an argument named 'x', which we specifiy to be 10
sqrt(x = 10)  # set the x argument as 10
sqrt(10)      # set the first argument as 10

# Some functions use more than one argument
# FunctionName(argument1, argument2, argument3)

# There are required arguments and optional arguments
# Optional arguments have default values
# FunctionName(required_argument1, required_argument2, optional_argument3 = 10)

# Look at the documentation for rnorm()
?rnorm

# Goal: Return 20 random values from a normal distribution
# that has a mean of 0 and a standard deviation of 1
rnorm(n = 20, mean = 0, sd = 1)
rnorm(n = 20)
# mean and sd are optional arguments; by default, rnorm uses mean = 0 and sd = 1

# What if we don't supply a value for the n argument?
rnorm() # produces an error
## What does this error message tell you?

# Goal: Return 20 random values from a normal distribution
# that has a mean of 10 and a standard deviation of 6
rnorm(n = 20, mean = 10, sd = 6)

## Do these accomplish the same task?
rnorm(20, 10, 6)                 # Why might this be a bad idea?
rnorm(mean = 10, n = 20, sd = 6) # Why might this be a bad idea?
rnorm(n = 20, sd = 6)            # Is this okay?

# Performing mutliple steps
# Goal: Find the square root of the absolute value of 4 - 20
# Option 1: Evaluate in two steps
abs(4 - 20) # returns 16
sqrt(16)

# Option 2: Nested functions
# The output of abs(4 - 20) becomes the argument for sqrt()
sqrt(abs(4 - 20))

# Option 3: Pipes (not covered here)
## Detailed lesson on pipelines in Reproducible Workflows in R workshop
# If you have R >4.1 (released May 18, 2021), new feature!
(4 - 20) |> abs() |> sqrt()

# If you have R <4.1, requires additional package and uses different syntax
(4 - 20) %>% abs() %>% sqrt() # This will not work unless you have {dplyr} installed (more later!)

## Where is this applicable?
## Performing complex tasks

# ---- Objects ----
# Objects ("containers", "boxes") store information in your current environment ("room", "desk")

# Some commonly used objects come "built in"
# You create other objects you want to be able to use later

# Goal: Find the value of the object called pi
pi

# Goal: Use pi to accomplish a task
pi * 10

# Goal: Create an object called x that contains the value 15
# Use the assignment operator <-
x <- 15

# Look at the contents of the object called x
x

# R is case sensitive
X            # returns an error

# You can also use -> as an assignment operator
15 -> x      # Can you think of why this might be a bad idea?

# You can also use = as an assignment operator
x = 15       # Can you think of why this might be a bad idea?

## Goal: Make an object called y that contains the value of x plus 3
y <- x + 3
y

# Note: If you update x, y does not update automatically
x <- 150
x
y
# This is different from some programming languages that
# you may have experience with - be careful!

## Without running this code, what do you expect to get as output?
a <- 10
b <- 15
A <- 100
c <- a + b
b <- 50
c

# (a) 115 - no, R is case sensitive
# (b) 25 - correct
# (c) 150 - no, R is case sensitive and object values don't update when other objects are updated
# (d) 60 - no, object values don't update when other objects are updated

# Rules for Naming Objects
## May contain letters (uppercase or lowercase)
## May contain numbers
## May contain . or _
## Must start with a letter
## May not contain spaces

# Advice for Naming Objects
## Keep names short but meaningful
## Avoid (or be very consistent) using capitalization
## Avoid (or be very consistent) using punctuation
## Avoid . (other meanings here and in other programming languages)

# Poor names for objects
AverageCarapaceLengthOfAllCrabsCaught <- 50
w <- 9
results_2020 <- 100
Results.2021 <- 105

# Good names for objects
meanCarapace <- 50
weight <- 9
results2020 <- 200
results2021 <- 105

# ---- Data Classes ----
# Objects can contain different structures of data
# Think of this as the key descriptive characteristic of the item in the container

# Numeric
mynumber <- 13    # create an object
mynumber          # look at the contents of the object
class(mynumber)   # what data class does the object contain?
sqrt(mynumber)

# Numeric actually include two different "types" of numbers
# Integers: integer values
# Doubles: contain decimals
class(10.6)      # numeric
typeof(10.6)     # double

class(5)         # numeric
typeof(5)        # double; this assumes the value is 5.0
typeof(5L)       # integer

# Very rarely do you actually need to worry about this in practice!

# Character
myword <- "hello"   # create an object
myword              # look at the contents of the object
class(myword)       # what data class does the object contain?
sqrt(myword)

# Logical
mytest <- TRUE      # create an object
mytest              # look at the contents of the object
class(mytest)       # whata data class does the object contain?
sqrt(mytest)        # can you think of why this works?
sqrt(FALSE)         # Hint: why is this output different?

# Logical values can be "coerced" (forced to act) as numeric values
# TRUE becomes 1, FALSE becomes 0

# Other common data classes include Factors (categorical groupings) & a variety of Date/Datetime options

# ---- Data Structures ----
# Objects can contain different structures of data
# Think of this as the shape or layout of the container that is used to hold an item

# ---- Data Structures: Scalars ----
# Simplest data structure; 1 element
pi
x
y
myword

# ---- Data Structures: Vectors ----
# >1 element; one dimensional

# Example: Look at a built in object containing the alphabet
letters

# Note: [*] represents the position of each value in the vector

# Use : as a shortcut for vectors of integers
10:100     # returns the integers from 10 to 100, inclusive

# Goal: Put all integers from 2 to 9 into the object called myvector
myvector <- 2:9    # create object
myvector           # look at the contents of the object

# We learned that functions require specific data classes
# Different functions respond differently to data structure
sqrt(myvector)   # applied to each value in the vector
length(myvector) # applied to the entire vector
class(myvector)  # applied to the entire vector

# Each element in myvector is greater than 5
myvector > 5

# Any element in myvector is greater than 5
any(myvector > 5)

# All elements in myvector are greater than 5
all(myvector > 5)

# Vector-specific conditional operator
# a %in% b     "the scalar a is found in the vector b"
11 %in% myvector   # "11 is found in myvector"

# Creating customized vectors - Numeric

# Goal: Create a vector called mynumbers that contains
# the numbers 1, 6, 3, 4, and 10
mynumbers <- c(1, 6, 3, 4, 10) # "c" means "combine" into a vector
mynumbers

## How many elements are in mynumbers?
length(mynumbers)

## Determine if 25 is found in mynumbers
25 %in% mynumbers

## What is the sum of mynumbers?
sum(mynumbers)

# Creating customized vectors - Character

# Goal: Create a vector called fruit that contains the words apple, orange, and kiwi
fruit <- c("apple", "orange", "kiwi")
fruit
class(fruit)

# Goal: Append "banana" to the vector called fruit
fruit <- c(fruit, "banana")
fruit

## Create a vector called aboutme that contains three elements:
# The number of letters in your first name
# The number of siblings you have
# The number of pets you own
aboutme <- c(8, 1, 1)
aboutme
class(aboutme)

## Add an element to the *first position* of aboutme
# that contains your first name
aboutme <- c("Danielle", aboutme)
aboutme
class(aboutme)  # What do you notice?

# ---- Characteristics of Vectors ----
# Vectors are "atomic": they can only contain one class of data

# Implication: You can't mix classes!
eggs <- c(3, 6, 10, "missing value", 12)
class(eggs)  # numeric values will be coerced into characters

# Goal: What is the total number of eggs?
sum(eggs)    # sum() must be used on numeric values

# Goal: Create a new object called numbereggs that contains
# the values from eggs, but forced to act as numeric values
numbereggs <- as.numeric(eggs)
numbereggs   # What do you notice?

# Goal: What is the total/average/minimum/maximum number of eggs?
sum(numbereggs)
mean(numbereggs)
min(numbereggs)
max(numbereggs)

## What do you think is causing this problem?

# ---- Dealing with NAs ----
# Missing values are represented by NA

# Goal: Calculate basic statistics while ignoring the NAs
mean(numbereggs, na.rm = TRUE)     # na.rm is an optional argument in several similar functions
min(numbereggs, na.rm = TRUE)
max(numbereggs, na.rm = TRUE)

# Goal: Assess which values are NAs
# A special function that acts like a conditional operator: is.na()
# is.na(x)    "x is NA"

# Each value of numbereggs is NA
numbereggs == NA     # doesn't work
is.na(numbereggs)       # works

# Each value of numbereggs is not NA
!is.na(numbereggs)   # works

# More complex functions and processes will often deal with
# missing values in a more reasonable way
# Example: visualizations, most statistical tests and models ignore NAs by default

# ---- Bonus Material ----
# ---- Creating a Function ----
# Users can create their own function, which contains a snippet of
# code with instructions to apply using the specified arguments

# newFunction <- function(argument) {do_this_with_argument}

# Create a function named addFour that returns a value + 4
addFour <- function(x) {x + 4}

addFour(100)         # Apply addFour()

## Create a function named sumExtremes that returns the sum of the minimum and maximum values in a set of values
sumExtremes <- function(values) {
     min(values) + max(values)
     }

sumExtremes(1:10)     # Apply sumExtremes()

## Create a function names addTax that finds the total cost by adding tax to the original price
addTax <- function(price, tax) {
     price + price*(tax/100)
     }

addTax(300, 14)

# Modify the addTax() function to use 12 as the default value for tax
addTax <- function(price, tax = 12) {
     return(price + price*(tax/100))
     }

addTax(300)       # Apply addTax() using default value of optional argument
addTax(300, 14)   # Apply addTax() using user defined value of optional argument

# Create a function named isSumGreater that tests if the sum of a set of values is greater than another value
isSumGreater <- function(values, greater_than) {
     sum(values) > greater_than
     }

isSumGreater(c(1, 4, 2, 9), 20)      # Apply isSumGreater()

# ---- IfElse, If, and If-Else Statements ----
# These statements use the results of conditional
# statements (TRUE and FALSE) to determine what to do next

# ifelse(conditional_statement, value_if_true, value_if_false)
ifelse(10 > 5, "it's larger", "it's smaller")

# if(conditional_statement) {do_this}
if(10 > 5) {print("it's larger")}

# if(conditional_statement) {do_this_if_true} else {do_this_if false}
if(10 > 5) {print("it's larger")} else {print("it's smaller")}

if(10 > 5) {
  print("it's larger")
  } else {
    print("it's smaller")
    }

## What would the value of results be after this code is executed?
if(15 %in% 1:6) {
  results <- "15 is found in the integers 1 through 6"
} else {
  if(15 < 12) {
    results <- "15 is greater than 12"
  } else {
    results <- "neither of these statements are true"
  }
}

## Troubleshooting: What should you do to fix this code so that the results are correct?
if(15 %in% 1:6) {
  results <- "15 is found in the integers 1 through 6"
} else {
  if(15 > 12) {
    results <- "15 is greater than 12"
  } else {
    results <- "neither of these statements are true"
  }
}

# ---- Packages ----
# Packages are user-created collections of objects, functions, and datasets that
# can be installed to RStudio and used to accomplish common tasks

# Some of the most commonly used packages include:
## ggplot2    for data visualization
## dplyr      for data wrangling
## tidyr      for data cleaning
## lubridate  for dealing with dates and times
## stringr    for dealing with strings (characters)

# These packages are not covered in this workshop.
# To demonstrate how a package is used, install and download the lubridate package
install.packages("lubridate")   # installs the package to your computer; must be connected to the internet

library(lubridate)  # loads the package to your current R session, giving you access to its contents

leap_year(2021)     # the leap_year function from the lubridate package evaluates whether a particular year was a leap year 


