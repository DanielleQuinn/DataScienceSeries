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

# ---- Conditional Operators ----
# Logical statements, return TRUE or FALSE

# 5 is equal to 5

# 5 is equal to 6

# 5 is greater than 6

# 5 is greater than or equal to 6

# 5 is not equal to 6

# 5 is equal to 5 AND 7 is greater than 6

# 5 is equal to 5 OR 7 is greater than 10

## Complete each conditional statement below so it returns TRUE
3 * 5 __ 15
1/2 __ 1/4
30 __ 10 * 3 & 40 * 10 __ 405

# ---- Functions ----
# Functions "do things"
# Recognizable by the function name followed by (
# Every ( needs a )
# The information inside the () is called the argument

# FunctionName(argument)

# Goal: Find the square root of 81
# Function name: sqrt
# Argument: 81

# Goal: Find the absolute value of 6 - 14
# Function name: abs
# Argument: 6 - 14

# Functions require specific types of arguments

# Getting help with a function

## Try using the functions called log, log10, and exp
# What do each of them do?
log(10)
log10(10)
exp(10)

# Arguments are named, but it's not always neccessary to call them by name
# sqrt() requires an argument named 'x', which we specifiy to be 10

# Some functions use more than one argument
# FunctionName(argument1, argument2, argument3)

# There are required arguments and optional arguments
# Optional arguments have default values
# FunctionName(required_argument1, required_argument2, optional_argument3 = 10)

# Look at the documentation for rnorm()

# Goal: Return 20 random values from a normal distribution
# that has a mean of 0 and a standard deviation of 1

# What if we don't supply a value for the n argument?

# Goal: Return 20 random values from a normal distribution
# that has a mean of 100 and a standard deviation of 6

## Do these accomplish the same task?
rnorm(20, 10, 6)                 # Why might this be a bad idea?
rnorm(mean = 10, n = 20, sd = 6) # Why might this be a bad idea?
rnorm(n = 20, sd = 6)            # Is this okay?

# Performing mutliple steps
# Goal: Find the square root of the absolute value of 4 - 20
# Option 1: Evaluate in two steps

# Option 2: Nested functions

# Option 3: Pipes (not covered here)
## Detailed lesson on pipelines in Reproducible Workflows in R workshop

# ---- Objects ----
# Objects ("containers", "boxes") store information in your current environment ("room", "desk")

# Some commonly used objects come "built in"
# You create other objects you want to be able to use later

# Goal: Find the value of the object called pi

# Goal: Use pi to accomplish a task

# Goal: Create an object called x that contains the value 15
# Use the assignment operator <-

# Look at the contents of the object called x

# R is case sensitive

# You can also use -> as an assignment operator
15 -> x      # Can you think of why this might be a bad idea?

# You can also use = as an assignment operator
x = 15       # Can you think of why this might be a bad idea?

## Goal: Make an object called y that contains the value of x plus 3

# Note: If you update x, y does not update automatically

## Without running this code, what do you expect to get as output?
a <- 10
b <- 15
A <- 100
c <- a + b
b <- 50
c

# (a) 115
# (b) 25
# (c) 150
# (d) 60

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

# Numeric actually include two different "types" of numbers
# Integers: integer values
# Doubles: contain decimals


# Character

# Logical

# ---- Data Structures ----
# Objects can contain different structures of data
# Think of this as the shape or layout of the container that is used to hold an item

# ---- Data Structures: Scalars ----
# Simplest data structure; 1 element

# ---- Data Structures: Vectors ----
# >1 element; one dimensional

# Example: Look at a built in object containing the alphabet

# Note: [*] represents the position of each value in the vector

# Use : as a shortcut for vectors of integers

# Goal: Put all integers from 2 to 9 into the object called myvector

# We learned that functions require specific data classes
# Different functions respond differently to data structure

# Each element in myvector is greater than 5

# Any element in myvector is greater than 5

# All elements in myvector are greater than 5

# Vector-specific conditional operator
# a %in% b     "the scalar a is found in the vector b"

# Creating customized vectors - Numeric

# Goal: Create a vector called mynumbers that contains
# the numbers 1, 6, 3, 4, and 10

## How many elements are in mynumbers?

## Determine if 25 is found in mynumbers

## What is the sum of mynumbers?

# Creating customized vectors - Character

# Goal: Create a vector called fruit that contains the words apple, orange, and kiwi

# Goal: Append "banana" to the vector called fruit

## Create a vector called aboutme that contains three elements:
# The number of letters in your first name
# The number of siblings you have
# The number of pets you own

## Add an element to the *first position* of aboutme
# that contains your first name

# ---- Characteristics of Vectors ----
# Vectors are "atomic": they can only contain one class of data

# Implication: You can't mix classes!

# Goal: What is the total number of eggs?

# Goal: Create a new object called numbereggs that contains
# the values from eggs, but forced to act as numeric values

# Goal: What is the total/average/minimum/maximum number of eggs?

# ---- Dealing with NAs ----
# Missing values are represented by NA

# Goal: Calculate basic statistics while ignoring the NAs

# Goal: Assess which values are NAs
# A special function that acts like a conditional operator: is.na()
# is.na(x)    "x is NA"

# Each value of numbereggs is NA

# Each value of numbereggs is not NA

# ---- Bonus Material ----
# ---- Creating a Function ----
# Users can create their own function, which contains a snippet of
# code with instructions to apply using the specified arguments

# newFunction <- function(argument) {do_this_with_argument}

# Create a function named addFour that returns a value + 4

## Create a function named sumExtremes that returns the sum of the minimum and maximum values in a set of values
sumExtremes <- function(values) {
     ______________
     }

## Create a function names addTax that finds the total cost by adding tax to the original price

# Modify the addTax() function to use 12 as the default value for tax

# Create a function named isSumGreater that tests if the sum of a set of values is greater than another value

# ---- IfElse, If, and If-Else Statements ----
# These statements use the results of conditional
# statements (TRUE and FALSE) to determine what to do next

# ifelse(conditional_statement, value_if_true, value_if_false)

# if(conditional_statement) {do_this}

# if(conditional_statement) {do_this_if_true} else {do_this_if false}

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

