# Example from last time
mean(rnorm(1))
mean(rnorm(2))
mean(rnorm(3))

# For loop for iteration
sample_sizes <- 1:30
means <- numeric(length(sample_sizes))

for (i in seq_along(sample_sizes)) {
  means[i] = mean(rnorm(i))
}

means

# Function for iteration
calculate_sample_mean <- function(sample_size) {
  sample_mean <- mean(rnorm(sample_size))
  
  sample_mean
}

calculate_sample_mean(1)

# Apply the function
sapply(1:30, calculate_sample_mean)

print("Number 1!")
print("Number 2!")
print("Number 3!")
# and so on...
print("Number 10!")

# Write a function to shout numbers
shout_number <- function(number) {
  paste0("Number ", number, "!")
}

shout_number(1)


numbers <- 1:10
sapply(numbers, shout_number)

numbers <- 1:10
lapply(numbers, shout_number)


# Write another function to calculate sample means
calculate_sample_mean <- function(sample_size) {
  sample_mean <- mean(rnorm(sample_size))
  
  sample_mean
}

calculate_sample_mean(1)

sapply(1:30, calculate_sample_mean)

# Add arguments
calculate_sample_mean <- function(sample_size, 
                                  sample_mean = 0, 
                                  sample_sd = 1) {
  sample_mean <- mean(rnorm(sample_size, 
                            mean = sample_mean, 
                            sd = sample_sd))
  
  sample_mean
}

# Call function with out-of-order arguments
calculate_sample_mean(10, sample_mean = 6, sample_sd = 2)
calculate_sample_mean(sample_sd = 2, sample_size = 9)

# This won't work
# calculate_sample_mean(sample_mean = 5)

# Functions in functions - wow
calculate_sample_mean <- function(sample_size, 
                                  sample_mean = 0, 
                                  sample_sd = 1,
                                  dist_type = rnorm) {
  sample_mean <- mean(dist_type(sample_size, 
                            mean = sample_mean, 
                            sd = sample_sd))
  
  sample_mean
}


# Test it out
calculate_sample_mean(sample_size = 10, 
                      sample_mean = 0, 
                      sample_sd = 1)

calculate_sample_mean(sample_size = 10, 
                      sample_mean = 0, 
                      sample_sd = 1, 
                      dist_type = pnorm)

# Probability distributions
dnorm(0)
dnorm(1)
dnorm(-1)

pnorm(0)
pnorm(1)
pnorm(-1)

qnorm(c(0.05, 0.95))
qnorm(c(0.025, 0.975))
pnorm(qnorm(c(0.025, 0.975)))

rnorm(1)
rnorm(5)
rnorm(30)
