# Solutions to Week 3 interactive tutorial

5 != 10
is.na(NA)
TRUE | FALSE
4 > 3 & is.character("4 < 3")
(1 | FALSE) & (-10 <= 0)

c(1, 2, 3, 4) == 4
c(1, 2, 3, 4) == c(2, 3, 4, 5)
c(TRUE, FALSE) | c(FALSE, TRUE)


# Applying booleans to SHED data ------------------------------------------

setwd('~/Downloads/') # download this data to your computer, change the dir name
shed_data <- haven::read_dta("shed_data_abridged.dta")

dim(shed_data)

shed_data %>%
  select(starts_with("EF3"))

shed_data %>%
  mutate(financially_stable = ifelse(EF3_c==1 | EF3_a == 1, TRUE, FALSE)) %>%
  group_by(financially_stable) %>%
  summarize(n = n())

shed_with_financial_stability <- 
  shed_data %>%
  mutate(financially_stable = ifelse(EF3_c==1 | EF3_a == 1, TRUE, FALSE),
         financially_stable = ifelse(EF3_Refused == 1, NA, financially_stable))


# Adding trust ------------------------------------------------------------

shed_with_financial_stability %>%
  mutate(trusting = ifelse(B11 > 5, TRUE, FALSE),
         trusting = ifelse(B11 == -1, NA, trusting)) %>%
  group_by(financially_stable)  %>%
  summarise(trust = weighted.mean(trusting, wt = weight2, na.rm = TRUE),
            n = n())


# Extension ---------------------------------------------------------------

shed_data %>%
  mutate(financially_stable = ifelse(EF3_c == 1 | EF3_a == 1, 1, 0),
         financially_stable = ifelse(EF3_Refused == 1, NA, financially_stable),
         financially_stable = ifelse(EF3_h == 1 | EF3_f == 1 | EF3_g == 1, -1, financially_stable)) %>%
  mutate(trusting = ifelse(B11 > 5, TRUE, FALSE),
         trusting = ifelse(B11 == -1, NA, trusting)) %>%
  group_by(financially_stable)  %>%
  summarise(trust = weighted.mean(trusting, wt = weight2, na.rm = TRUE),
            n = n())
