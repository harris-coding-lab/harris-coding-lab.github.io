mrc_data %>%
  summarise(missing_sat_2013 = sum(is.na(sat_avg_2013)))


before <- tibble(fake_data = c(1, 2, NA))
after <- before %>% mutate(missing_fake_data = ifelse(is.na(fake_data), 1, 0),
                           fake_data = ifelse(is.na(fake_data), mean(fake_data, na.rm = TRUE), fake_data))

## -------------------------------------------------------------------------------------------------------
before <- tibble(fake_data = c(1, 2, NA))
before
after

## -------------------------------------------------------------------------------------------------------
mrc_data %>% distinct(tier_name)



mrc_data %>% filter(1330 <= sat_avg_2013, sat_avg_2013 <= 1530)
mrc_data %>% filter(between(sat_avg_2013, 1330, 1530))


 # This is pseudo code
 mrc_data %>%
   mutate(abdul_choices = ifelse(CONDITIONS, yes, no),
          stephens_choices = ifelse(CONDITIONS, yes, no),
          ...) %>%
   filter(abdul_choices == yes, stephens_choices == yes, ...)


 mrc_data %>%
 mutate(abdul_choices = ifelse(CONDITIONS, TRUE, FALSE),
          stephens_choices = ifelse(CONDITIONS, TRUE, FALSE),
          ...) %>%
   filter(abdul_choices, stephens_choices, ...)


bff_super_awesome_college_list <-
 mrc %>%
   mutate(abdul_choices = ifelse(between(sat_avg_2013, 1330, 1530) &
                                 (tier_name == "Ivy Plus" | ... ), TRUE, FALSE),
          sam_choices = ifelse(..., ..., ...),
          nancy_choices = ifelse(..., ..., ...),
          rei_choices = ifelse(..., ..., ...),
          casey_choices = ifelse(..., ..., ...)
          )


bff_super_awesome_college_list %>%
   filter(abdul_choices, sam_choices, nancy_choices, rei_choices, cary_choices)
