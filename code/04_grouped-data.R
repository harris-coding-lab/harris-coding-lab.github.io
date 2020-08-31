# Coding Lab: Grouped Data
# Ari Anisfeld
# Summer 2020

## -----------------------------------------------------------------------------------
library(tidyverse)
library(readxl)
options(dplyr.summarise.inform = FALSE) # Suppress summarize info in dplyr >= 1.0
texas_housing_data <- txhousing


## -----------------------------------------------------------------------------------
annual_housing_prices <- 
  texas_housing_data %>%
  group_by(year) %>%
  summarize(total_sales = sum(sales, na.rm = TRUE),
            total_volume = sum(volume, na.rm = TRUE),
            mean_house_price = 
              total_volume / total_sales)


#### How have Texas housing prices changed over time?
## -----------------------------------------------------------------------------------
annual_housing_prices %>% 
  ggplot(aes(x = year, y = mean_house_price)) + 
  geom_point()

 
#### grouped summary with `group_by()` + `summarize()`
#### Use case: You want summary statistics for certain subsets of the data.
## -----------------------------------------------------------------------------------
texas_housing_data %>%
  group_by(city, year) %>%
  summarize(total_sales = sum(sales, na.rm = TRUE),
            total_volume = sum(volume, na.rm = TRUE),
            mean_house_price = 
              total_volume / total_sales)


#### How have Texas housing prices changed over time in certain cities?
## -----------------------------------------------------------------------------------
texas_housing_data %>%
  group_by(city, year) %>%
  summarize(total_sales = sum(sales, na.rm = TRUE),
            total_volume = sum(volume, na.rm = TRUE),
            mean_house_price = 
              total_volume / total_sales) %>% 
  filter(city %in% c("Houston",  "Galveston")) %>%
  ggplot(aes(x = year, y = mean_house_price)) + 
  geom_point() + 
  facet_wrap(facets = "city", nrow = 2)


#### What does `group_by()` do?
#### Let's make a grouped and non-grouped tibble for investigation.
## -----------------------------------------------------------------------------------
a_non_grouped_df <- 
  texas_housing_data %>% 
  select(city, year)


a_grouped_df <- 
  texas_housing_data %>% 
  select(city, year) %>%
  group_by(city, year)


#### What does `group_by()` do?
## -----------------------------------------------------------------------------------
a_non_grouped_df %>% glimpse()
a_grouped_df %>% glimpse()


## -----------------------------------------------------------------------------------
a_grouped_df %>% group_rows()


#### Grouping columns have some restrictions
#### For example, you cannot remove them from the tibble
## -----------------------------------------------------------------------------------
a_grouped_df %>%
  select(-year)


#### To get rid of groups, use `ungroup()`
## -----------------------------------------------------------------------------------
a_grouped_df %>%
  ungroup() %>%
  select(-year)


#### grouped  `mutate`: differences
#### Use case: You want to work with differences. 
#### (Try running the code without `group_by()` and carefully compare the results.)
## -----------------------------------------------------------------------------------
july_texas_housing_data <-
  texas_housing_data %>%
  filter(month == 7) %>%
  select(city, year, sales) 

differenced_data <-
  july_texas_housing_data %>%
  group_by(city) %>%
  mutate(last_year_sales = lag(sales),
         delta_sales = sales - lag(sales))


#### grouped  `mutate`: differences
#### Use case: You want to work with differences.
## -----------------------------------------------------------------------------------
differenced_data %>% head(5)


#### grouped  `mutate`: ranking
#### Use case: You want to rank sales within group. 
#### (Try running the code without `group_by()` and carefully compare the results.)
## -----------------------------------------------------------------------------------
ranked_data <-
  july_texas_housing_data %>%
  group_by(year) %>%
  mutate(sales_rank = rank(desc(sales))) 


#### grouped  `mutate`: ranking
#### Use case: You want to rank sales within group.
## -----------------------------------------------------------------------------------
ranked_data %>% arrange(year, sales_rank) %>% head(10)


#### grouped  `filter`
#### Use case: You want to work with the top 10 cities for each year, you can 
## -----------------------------------------------------------------------------------
july_texas_housing_data %>%
  group_by(year) %>%
  filter(rank(desc(sales)) <= 10) %>%
  arrange(year, sales)


#### `count()` is a useful short cut
#### Based on what you know about `texas_housing_data`. Can you tell what `count()` does?
## -----------------------------------------------------------------------------------
texas_housing_data %>%
  count(city, year) %>%
  head(5)


#### `count()` is a useful short cut
#### `count(x)` is nearly identical to `group_by(x) %>% summarize(n = n()) %>% ungroup()`.
## -----------------------------------------------------------------------------------
texas_housing_data %>%
  group_by(city, year) %>%
  summarize(n = n()) %>%
  ungroup() %>%
  head(5)


#### `add_count()` is a useful short cut
#### `add_count(x)` is nearly identical to `group_by(x) %>% mutate(n = n()) %>% ungroup()`.
## -----------------------------------------------------------------------------------
texas_housing_data %>%
  select(city, year, sales) %>%
  add_count(city, year) %>%
  head(5)


#### `add_count()` is a useful short cut
#### `add_count(x)` is nearly identical to `group_by(x) %>% mutate(n = n()) %>% ungroup()`.
## -----------------------------------------------------------------------------------
texas_housing_data  %>%
  select(city, year, sales) %>%
  group_by(city, year) %>%
  mutate(n = n()) %>%
  ungroup() %>%
  head(5)