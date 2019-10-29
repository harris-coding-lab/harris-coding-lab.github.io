# Solutions to Week 4 interactive tutorial

sample_sizes <- 1:30
estimates <- tibble(n = integer(), sample_mean = double() )

for (n in sample_sizes) {
  sample_mean <- mean(rnorm(n, mean= 0, sd = 5))
  estimates <- bind_rows(estimates, c(n = n, sample_mean = sample_mean))
}

estimates %>%
  ggplot(aes(x = n, y = sample_mean)) +
  geom_line()

sample_sizes <- 1:100
estimates <- tibble(n = integer(), sample_mean = double() )

for (n in sample_sizes) {
  sample_mean <- mean(rnorm(n, mean= 0, sd = 5))
  estimates <- bind_rows(estimates, c(n = n, sample_mean = sample_mean))
}

estimates %>%
  ggplot(aes(x = n, y = sample_mean)) +
  geom_line()



# Extending our simulation ------------------------------------------------

population_standard_deviations <- c(0, 1, 5, 10)
estimates <- tibble(n = integer(), sample_mean = double(), population_standard_deviations = integer() )

for (s in population_standard_deviations){
  for (n in sample_sizes) {
    sample_mean <- mean(rnorm(n, sd = s))
    estimates <- bind_rows(estimates, c(n = n,
                                        sample_mean = sample_mean,
                                        population_standard_deviations = s))
  }
}

estimates %>%
  ggplot(aes(x = n, y = sample_mean)) +
  geom_line() +
  facet_wrap(~population_standard_deviations) +
  theme_minimal()