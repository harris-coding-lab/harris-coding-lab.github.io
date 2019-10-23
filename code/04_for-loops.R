library(tidyverse)
library(readxl)

# Bad for loop
a <- 1:5
b <- 1:5
c <- c()

for (i in seq_along(a)) {
  c[i] <- a[i] + b[i]
}

c

# Vectorize instead
a <- 1:5
b <- 1:5
c <- a + b

c


for (i in 1:10) {
  print(i)
}


# Calculate sample means
sample_sizes <- 1:30
means <- numeric(length(sample_sizes))

for (i in seq_along(sample_sizes)) {
  means[i] = mean(rnorm(i))
}

means


# Moving beyond 1 dimension
sample_sizes <- 1:30
means_df <- tibble(sample_size = integer(),
                   mean = double())

for (i in seq_along(sample_sizes)) {
  sample_mean <- mean(rnorm(i))
  means_df <- bind_rows(means_df, c(sample_size = i, mean = sample_mean))
}

means_df


# ggplot2 example
ggplot(data = txhousing, aes(x = listings, y = sales)) +
  geom_point()
