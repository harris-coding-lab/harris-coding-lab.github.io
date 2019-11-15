# Solutions to Week 5 interactive tutorial


# initial simulation
set.seed(4)
true_mean <- .5
N <- 30
simulated_data <- rnorm(N, mean = true_mean)
(obs_mean <- mean(simulated_data))

obs_sd <- sd(simulated_data)
(zscores <- (obs_mean - true_mean) / (obs_sd / sqrt(N)))

1 - pnorm(zscores)


# determining z-scores and checking for significance --------------
get_zscores <- function(obs_mean, true_mean, obs_sd, N){
  (obs_mean - true_mean) / (obs_sd / sqrt(N))
}

made_up_means <- c(4.4, 4.1, 4.2, 4.4, 4.2)
made_up_sd <- c(.25, .5, .4, 1, .4)

get_zscores(obs_mean = made_up_means,
            true_mean = 4.3,
            obs_sd = made_up_sd,
            N = 100)


test_significance <- function(zscores, significance_level) {
  alpha <- qnorm(1 - significance_level/ 2)
  zscores > alpha | zscores < -alpha
}


# Simulate data set and find observed mean and sd ----------------
get_mean_and_sd_from_random_sample <- function(N, true_mean){
  one_simulation <- rnorm(N, mean = true_mean)
  sim_mean <- mean(one_simulation)
  sim_std_dev <- sd(one_simulation)
  tibble("mean" = sim_mean, "sd" = sim_std_dev)
}


monte_carlo_samples <- function(N, true_mean=.5, B=1000){
  output <- tibble(mean = double(), sd = double())
  for (i in 1:B) {
    output <- output %>% bind_rows(get_mean_and_sd_from_random_sample (N=N, true_mean = true_mean))
  }
  output
}


monte_carlo <- function(N, true_mean, B){
  sample_statistics <- monte_carlo_samples(N, true_mean, B)
  z_scores <- get_zscores(sample_statistics$mean, true_mean, sample_statistics$sd, N)
  test_significance(z_scores, .95) %>% mean()
}

monte_carlo(30, .5, 1000)


