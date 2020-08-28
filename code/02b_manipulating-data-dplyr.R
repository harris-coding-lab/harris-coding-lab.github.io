# Coding Lab: Manipulating data with `dplyr`
# Ari Anisfeld
# Summer 2020

library(tidyverse)
library(readxl)

texas_housing_data <- txhousing

# selecting columns with `select()`

select(texas_housing_data, city, date, sales, listings)


select(texas_housing_data, -c(city, date, sales, listings))


select(texas_housing_data, city, date, 
       sales, listings, everything())



# sort rows with `arrange()`

arrange(texas_housing_data, year)

arrange(texas_housing_data, desc(year))



# the pipe operator

select(texas_housing_data, city, year, sales, volume) 

# vs

texas_housing_data %>% 
  select(city, year, sales, volume)

#### (another example)
texas_housing_data %>%
  select(city, year, month, median) %>%
  arrange(desc(median))




## creating columns with `mutate()` 

texas_housing_data %>%
  mutate(mean_price = volume / sales) %>%
  select(city, year, month,  mean_price, sales, volume)



## Binary operators: Math in R

4 + 4
4 - 4
4 * 4
4 / 4
4 ^ 4
5 %% 4  # gives the remainder after dividing


## More on `mutate()` 

texas_housing_data %>%
  mutate(mean_price = volume / sales) %>%
  select(city, year, month,  mean_price, sales, volume)


texas_housing_data %>%
  mutate(mean_price = volume / sales,
         sqrt_mean_price = sqrt(mean_price)) %>%
  select(city, year, month,  mean_price, sales, volume)




## choose rows that match a condition with `filter()`

filter(texas_housing_data, year == 2013)

#### Relational operators return TRUE or FALSE

4 < 4
4 >= 4
4 == 4
4 != 4


# not true
! TRUE

# are both x & y TRUE?
TRUE  &  FALSE

# is either x | y TRUE?
TRUE | FALSE

! (4 > 3) # ! TRUE
(5 > 1) & (5 > 2) # TRUE & TRUE
(4 > 10) | (20 > 3) # FALSE | TRUE


## More on `filter()`

texas_housing_data %>%
  filter(year == 2013, 
         city == "Houston")


texas_housing_data %>%
  filter(year == 2013, 
         city == "Houston", city == "Austin") #should get an error


texas_housing_data %>% 
  filter(year > 2013, 
         city == "Houston" | city == "Austin")


texas_housing_data %>%
  filter(year > 2013, 
         city %in% c("Houston", "Dallas", "Austin"))




## summarize data with `summarize()`

texas_housing_data %>%
  filter(city %in% 
           c("Houston", "Dallas", "San Antonio")) %>% 
  summarize(median_n_sales = median(sales),
            mean_n_sales = mean(sales))


texas_housing_data %>%
  filter(city %in% 
           c("Houston", "Dallas", "San Antonio")) %>% 
  summarize(n_obs = n(),
            n_cities = n_distinct(city))

texas_housing_data %>%
  filter(city %in% 
           c("Houston", "Dallas", "San Antonio")) %>% 
  summarize(mean_price = volume / sales) #should get an error


## dplyr verbs together

texas_housing_data %>%
  select(city, year, month, sales, volume) %>%
  mutate(log_mean_price = log(volume / sales)) %>%
  filter(year == 2013) %>%
  summarize(log_mean_price_2013 = mean(log_mean_price, na.rm = TRUE))

# Won't give you the same result as 
 texas_housing_data %>%
   select(city, year, month, sales, volume) %>%
   mutate(log_mean_price = log(volume / sales)) %>%
   summarize(log_mean_price = mean(log_mean_price, na.rm = TRUE)) %>%
   filter(year == 2013)

# Actually this code will give you an error, try it!



