# Coding Lab Week 0
# Introduction

# load the Tidyverse library
library(tidyverse)

# load COVID data from the CDC website
# and rename the columns in the data set for ease of use
covid_data <- read_csv(paste0("https://data.cdc.gov/api/views/qfhf-uhaa/rows.csv?",
                              "accessType=DOWNLOAD&bom=true&format=true%20target="), col_types = cols(Suppress = col_character())) %>%
  rename(week = `Week Ending Date`,
         time_period = `Time Period`,
         race_ethnicity = `Race/Ethnicity`,
         deaths = `Number of Deaths`,
         diff = `Difference from 2015-2019 to 2020`,
         state = `State Abbreviation`)

# make a plot of the COVID data
covid_data %>%
  mutate(week = lubridate::mdy(week)) %>%
  filter(race_ethnicity %in% c("Hispanic", "Non-Hispanic White", "Non-Hispanic Black", "Non-Hispanic Asian")) %>%
  filter(time_period == "2020", MMWRWeek <= 30) %>%
  group_by(race_ethnicity, week ) %>%
  summarize(actual_deaths = sum(deaths, na.rm  = TRUE),
            diff_deaths = sum(diff, na.rm = TRUE),
            expected_deaths = actual_deaths - diff_deaths,
            perc_above_expected = 100 * diff_deaths / expected_deaths) %>%
  ggplot(aes(x = week, color = race_ethnicity)) +
  geom_line(aes(y = perc_above_expected)) + 
  theme_minimal() + 
  labs(y = "Percent of deaths above expected deaths\n(weekly mean 2015-2019 for given week)", 
       x = "", 
       title = "Racial disparities of Covid-19, United States 2020" ,
       subtitle = "Data source: CDC",
       color = "") +
  theme(legend.position = "bottom")

# assign the value 4 to the variable my_number
my_number <- 4

# check the value of the variable my_number
my_number

# assign a new value to my_number
my_number <- 2

# do some math using the value of my_number
# and save the result to my_output
my_output <- sqrt((12 * my_number) + 1) 

# run a linear regression and save the output to the variable model_fit
model_fit <- lm(mpg ~ disp +  cyl + hp, mtcars)

# view a summary of the linear regression
summary(model_fit)

# calculate the square root of the number 4 using the sqrt function
sqrt(4)

# find the median from a vector of numbers using the median function
median(c(3, 4, 5, 6, 7 ))

# create a new function called f
f <- function(x, y) {
  2 * x + y
}

# call f with x = 7 and y = 0
f(7, 0)

# call f with x = 0 and y = 7
f(y = 7, x = 0)

# read the documentation of the sum function
?sum

# try calculating a few different sums
sum(1, 2, 3, 4, 5)
sum(1:5, NA)
sum(1:5, NA, na.rm = TRUE)

# try to figure out what 1:5 does
1:5

# install the readxl package
# typically, you should put this in the console (at the bottom of the window)
# instead of a script like this (at the top of the window)
# 
# a script is meant to be used for code that you might want to run more than once
# but you only need to install a package one time and it'll stay on the computer
install.packages("readxl")

# load the package in the script so R knows to use it every time you restart
library(readxl)

# call a function defined within the readxl package after loading the package
read_xlsx("some_data.xls") 

# call a function defined within the readxl package *without* loading the package
readxl::read_xlsx("some_data.xls")

# try this:
install.packages("haven")
our_data <- read_dta("my_file.dta")

# what is the error message telling you?

# you need to load the package before using its functions:
library(haven)
our_data <- read_dta("my_file.dta")


# one of the most useful packages we'll use is the Tidyverse:
# make sure you have this installed
library(tidyverse)
