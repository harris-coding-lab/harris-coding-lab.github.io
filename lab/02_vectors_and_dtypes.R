(coin_flips <- sample(c("Heads", "Tails"), 10, replace = TRUE))

set.seed(11300)
tibble(sampled_value = rchisq(1e5, 3)) %>%
  ggplot(aes(x = sampled_value)) +
  geom_density(fill = "orange", alpha = .3) +
  theme_minimal() +
  labs(x = "Sampled values", title = "100000 draws from Chi-squared distribution with 3 degrees of freedom")


chi_sq_samples <-
 tibble(x = c(rchisq(100000, 1) + rchisq(100000, 1),
              rchisq(100000, 3),
              rchisq(100000, 4)),
        df = rep(c("2", "3", "4"), each = 1e5))

chi_sq_samples %>%
  ggplot(aes(x = x, group = df, fill =df)) +
  geom_density( alpha = .5) +
  labs(fill = "df", x = "sample")
