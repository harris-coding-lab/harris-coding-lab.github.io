# Solutions to Week 1 interactive tutorial

# Calculating mean and standard deviation ---------------------------------

set.seed(1)
random_numbers <- rf(1000, 10, 100)

numbers_sum <- sum(random_numbers)
numbers_count <- length(random_numbers)

this_mean <- numbers_sum / numbers_count
this_mean
mean(random_numbers)

random_numbers - this_mean
head(random_numbers)
head(random_numbers - this_mean)

this_sd <- sqrt(sum((random_numbers - this_mean) ^ 2) / (length(random_numbers) - 1))
this_sd
sd(random_numbers)

hist(random_numbers)


# Calculating a z-score ---------------------------------------------------

normalized_data <- (random_numbers - this_mean) / this_sd
normalized_mean <- mean(normalized_data)
normalized_sd <- sd(normalized_data)

hist(normalized_data)


# Calculating a t-score ---------------------------------------------------

set.seed(1)
data_1 <- rnorm(1000, 3)
data_2 <- rnorm(100, 2)

x_1 <- mean(data_1)
s_1 <- sd(data_1)
n_1 <- length(data_1)

typeof(x_1)

x_2 <- mean(data_2)
s_2 <- sd(data_2)
n_2 <- length(data_2)

t_score <- (x_1 - x_2) / sqrt(s_1^2/n_1 + s_2^2/n_2)

t.test(data_1, data_2)
