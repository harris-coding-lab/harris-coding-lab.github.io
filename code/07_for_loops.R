## For-loops and Iterations

library(tidyverse)
library(readxl)


for(value in c(1, 2, 3, 4, 5)) {
  print(value)
}

# simple for-loop
for (x in c(3, 6, 9)) {
  print(x)
}

# simple for-loop: what is going on?
x <- 3
print(x)
x <- 6
print(x)
x <- 9
print(x)

## basic structure of for-loop
for (value in list_of_values) {
  do something (based on value)
}

for (index in list_of_indices) {
  do something (based on index)
}

# example: find sample means
mean1 <- mean(rnorm(5))
mean2 <- mean(rnorm(10))
mean3 <- mean(rnorm(15))
mean4 <- mean(rnorm(20))
mean5 <- mean(rnorm(25000))

means <- c(mean1, mean2, mean3, mean4, mean5)

means

# avoid repeating by using a for-loop
sample_sizes <- c(5, 10, 15, 20, 25000)
sample_means <- rep(0, length(sample_sizes))

for (i in seq_along(sample_sizes)) {
  sample_means[[i]] <- mean(rnorm(sample_sizes[[i]]))
}

sample_means

## finding sample means, broken down

# determine what to loop over
sample_sizes <- c(5, 10, 15, 20, 25000)

# pre-allocate space to store output
sample_means <- rep(0, length(sample_sizes))

# determine what 'sample_means' currently looks like
sample_means <- rep(0, length(sample_sizes))
sample_means

# altenative ways to pre-allocate space
sample_means <- vector("double", length = 5)
sample_means <- double(5)

# using lists
data_list <- vector("list", length = 5)

## adding data to a vector, broken down
for (i in 1:length(sample_sizes)) {
  
}

# 'seq_along' helper function
vec <- c("x", "y", "z")
1:length(vec)
seq_along(vec)

sample_sizes <- c(5, 10, 15, 20, 25000)
seq_along(sample_sizes)

sample_sizes <- c(5, 10, 15, 20, 25000)
sample_means <- rep(0, length(sample_sizes))

for (i in seq_along(sample_sizes)) {
  
}

sample_sizes <- c(5, 10, 15, 20, 25000)
sample_means <- numeric(length(sample_sizes))

for (i in seq_along(sample_sizes)) {
  
  sample_means[[i]] <-  mean(rnorm(sample_sizes[[i]]))
  
}

sample_means

## common error
sample_sizes <- c(5, 10, 15, 20, 25000)
sample_means <- rep(0, length(sample_sizes))

for (i in seq_along(sample_sizes)) {
  mean(rnorm(sample_sizes[[i]]))
}

sample_means

## reading data into R and storing as single data set
setwd("../data/loops")

file_1 <- read_csv("data_1999.csv")
file_2 <- read_csv("data_2000.csv")
...
file_22 <- read_csv("data_2020.csv")

data <- bind_rows(file_1, file_2, ..., file_22)

# fake data used for this exercise
setwd('../data/loops')

file_list <- paste0("data_", 1999:2020, ".csv")

for (file in file_list) {
  data <- 
    tibble(id = 1:100,
           employed = sample(c(0, 1, 1, 1), 
                             100, replace = TRUE),
           happy = sample(c(0,1), 
                          100, replace = TRUE))
  
  write_csv(data, file)
}

# 'bind_rows' function
df_1 <- tibble(col1 = 1, col2 = "A")
df_2 <- tibble(col1 = 2:3, col2 = c("B", "C"))

bind_rows(df_1, df_2)

# 'list.files' function
list.files("../data/loops", pattern = "*.csv$")

# loop to read data
file_names <- list.files(pattern = "*.csv$")

output <- vector("list", length(file_names))

for (i in seq_along(file_names)) {
  output[[i]] <- read_csv(file_names[[i]]) %>%
    mutate(year = str_extract(file_names[[i]], "[0-9]{4}"))
}

data <- bind_rows(output)
View(data)

# alternative loop to read data
setwd('../data/loops')

# by default, reads files in working directory
file_list <- list.files(pattern = "*.csv$")

out <- tibble()

for (file in file_list) {
  temp <- read_csv(file)
  
  out <- bind_rows(out, temp)
}

nrow(out)

# Review: Bad example of loop
a <- 7:11
b <- 8:12
out <- rep(0L, 5)

for (i in seq_along(a)) {
  out[[i]] <- a[[i]] + b[[i]]
}

out

# Review: Better alternative is vectorized operations
a <- 7:11
b <- 8:12
out <- a + b

out
