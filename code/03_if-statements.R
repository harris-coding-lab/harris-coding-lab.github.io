library(tidyverse)

!TRUE
!FALSE

!(2 > 1)

!(0 != 0)

TRUE | FALSE
FALSE | FALSE

(5 > 7) | (10 == 10)

TRUE & FALSE
TRUE & TRUE

!(2 > 6) & (4 > 9 | 3 == 3)

x <- 100
if (x > 0) {
  print("x is positive")
}

if (Sys.info()[["user"]] == "arianisfeld") {
  base_path <- "~/Documents/coding_lab_examples/"
} else {
  base_path <- "~/gdrive/coding_lab_examples/"
}
data <- read_csv(paste0(base_path, "our_data.csv"))

score <- 0
my_cards <- sample(2:11, 1) + sample(2:11, 1)
computers_cards <- sample(2:11, 1) + sample(2:11, 1)
if (my_cards > computers_cards) {
  score <- score + 1
  print("You win")
} else if (my_cards < computers_cards) {
  score <- score - 1
  print("Better luck next time.")
} else {
  print("It's a tie")
}

score <- 0
my_cards <- sample(2:11, 1) + sample(2:11, 1)
computers_cards <- sample(2:11, 1) + sample(2:11, 1)
if ((my_cards > computers_cards & my_cards <= 21) |
    computers_cards > 21) {
  score <- score + 1
  print("You win")
} else if (my_cards < computers_cards) {
  score <- score - 1
  print("Better luck next time.")
} else {
  print("It's a tie")
}

if (c(TRUE, FALSE)) { print("if true") }
if (NA) { print("if true") }

ifelse(TRUE, 1, 2)
ifelse(FALSE, 1, 2)
ifelse(c(TRUE, FALSE, TRUE), 1, 2)
ifelse(NA, 1, 2)


today <- Sys.Date()
ifelse(today == "2020-11-03",
       "VOTE TODAY!!",
       "Don't forget to vote on Nov 3rd.")

texas_housing_data %>% 
  mutate(in_january = ifelse(month == 1, TRUE, FALSE)) %>% 
  select(city, year, month, sales, in_january)

texas_housing_data %>% 
  mutate(housing_market = 
           case_when(
             median < 100000 ~ "first quartile",
             100000 <= median & median < 123800 ~ "second quartile",
             123800 <= median & median < 150000 ~ "third quartile",
             150000 <= median & median < 350000 ~ "fourth quartile"
           )) %>% 
  select(city, median, housing_market)
