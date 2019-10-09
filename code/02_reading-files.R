library(tidyverse)
library(readxl)

# texas_housing_data <- read_csv("texas_housing_data.csv")

texas_housing_data <- get("txhousing") # dataset included in tidyverse!
head(texas_housing_data)

fed_data <-
  read_xlsx("../data/SCE-Public-LM-Quarterly-Microdata.xlsx")
head(fed_data)

fed_data <- 
  read_xlsx("../data/SCE-Public-LM-Quarterly-Microdata.xlsx", 
            sheet = "Data 2013", 
            skip = 1)
head(fed_data)

dim(fed_data) 
names(fed_data)

select(texas_housing_data, city, date, sales, listings)
select(texas_housing_data, -c(date, sales, listings, inventory))
select(texas_housing_data, city, date, sales, listings, everything())

dim(fed_data)
slim_fed_data <- select(fed_data, userid, weight, starts_with("L18"))
dim(slim_fed_data)
names(slim_fed_data)



mutate(texas_housing_data, mean_house_price = volume / sales)

texas_housing_data_w_mean <- 
  mutate(texas_housing_data, mean_house_price = volume / sales)

select(texas_housing_data_w_mean, 
       city, date, mean_house_price, median)

select(texas_housing_data, city, year, sales, volume)

texas_housing_data %>%
  select(city, year, sales, volume)

texas_housing_data %>%
  mutate(mean_house_price = volume / sales) %>%
  select(city, date, mean_house_price, median)

mutant_data <- 
texas_housing_data %>%
  mutate(mean_house_price = volume / sales,
         difference = mean_house_price - median,
         relative_market_size = percent_rank(volume),
         state = "Texas")

mutant_data %>% 
  ggplot(aes(x = date, y = mean_house_price)) + geom_point()

summary_data <- 
texas_housing_data %>%
  summarize(state = "Texas",
            years = "2000-2015",
            total_sales = sum(sales, na.rm = TRUE),
            total_volume = sum(volume, na.rm = TRUE),
            mean_house_price = total_volume / total_sales)

summary_data

annual_housing_prices <- 
texas_housing_data %>%
  group_by(year) %>%
  summarize(total_sales = sum(sales, na.rm = TRUE),
            total_volume = sum(volume, na.rm = TRUE),
            mean_house_price = total_volume / total_sales)

annual_housing_prices %>% 
  ggplot(aes(x = year, y = mean_house_price)) + geom_point()

annual_housing_prices_by_city <- 
texas_housing_data %>%
  group_by(city, year) %>%
  summarize(total_sales = sum(sales, na.rm = TRUE),
            total_volume = sum(volume, na.rm = TRUE),
            mean_house_price = total_volume / total_sales)

annual_housing_prices_by_city %>% 
  filter(city %in% c("Houston",  "Galveston")) %>%
  ggplot(aes(x = year, y = mean_house_price)) + 
  geom_point() + 
  facet_wrap(facets = "city", nrow = 2)

outcome_of_t_test <- t.test(c(1,2,3,4), c(3,4,4,4))
outcome_of_t_test$statistic

letters <- c("a", "b", "c", "d", "e")
letters[3]
letters[c(1,5)]

fed_data[1, ]   # get row 1
fed_data[ , 4]  # get column 4
fed_data[1, 4]  # get the value of observation 1
                # with variable in column 4
