!TRUE
!FALSE
(2 > 1)
!(0 != 0)
(5 > 7) | (10 == 10)
FALSE | TRUE
TRUE & FALSE
!(2 > 6) & (4 > 9 | 3 == 3)

c(1, 2, 3) > 0
c(1, 2, 3) > c(0, 2, 4)

if (2 > 1) {
  print("Math works in R!")
}

today <- "October 15"
my_birthday <- "October 22"

if (today == my_birthday) {
  print("Happy birthday!")
} else {                      
  print("Not my birthday today.")
}

if (today == my_birthday) {
  print("Happy birthday!")
} else if (today == "October 31") {                      
  print("It's Halloween!")
} else {
  print("Not a notable day.")
}

ifelse(today == my_birthday, "Happy birthday!", "Not my birthday today.")

ifelse(TRUE, 1, 2)
ifelse(FALSE, 1, 2)
ifelse(NA, 1, 2)

library(tidyverse)
texas_housing_data <- txhousing

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
