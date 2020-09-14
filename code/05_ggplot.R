
library(tidyverse)
library(readxl)
library(maps)

texas_annual_sales <- 
  texas_housing_data %>%
  group_by(year) %>%
  summarize(total_volume = sum(volume, na.rm = TRUE))

ggplot(data = texas_annual_sales)

ggplot(data = texas_annual_sales,
       mapping = aes(x = year, y = total_volume)) +
  geom_point()

ggplot(data = texas_annual_sales,
       mapping = aes(x = year, y = total_volume)) +
  geom_col()

ggplot(data = texas_annual_sales,
       mapping = aes(x = year, y = total_volume)) +
  geom_line()

ggplot(data = texas_annual_sales,
       mapping = aes(x = year, y = total_volume)) +
  geom_smooth()

ggplot(data = texas_annual_sales,
       mapping = aes(x = year, y = total_volume)) +
  geom_smooth() +
  geom_point()

midwest %>%
   ggplot(aes(x = percollege, 
              y = percbelowpoverty)) +
      geom_point()

midwest %>%
   ggplot(aes(x = percollege, 
              y = percbelowpoverty, 
              color = state)) +
      geom_point()

midwest %>%
   ggplot(aes(x = percollege, 
              y = percbelowpoverty,  
              shape = state)) +
      geom_point()

midwest %>%
   ggplot(aes(x = percollege, 
              y = percbelowpoverty, 
              alpha = poptotal)) +
      geom_point()

midwest %>%
   ggplot(aes(x = percollege, 
              y = percbelowpoverty, 
              size = poptotal)) +
      geom_point()

midwest %>%
   ggplot(aes(x = percollege, 
              y = percbelowpoverty, 
              alpha = percpovertyknown,
              size = poptotal,
              color = state))+
      geom_point()

midwest %>%
   ggplot(aes(x = percollege, 
              y = percbelowpoverty, 
              alpha = percpovertyknown,
              size = poptotal,
              color = state))+
      geom_point()

midwest %>%
   ggplot(aes(x = log(poptotal), 
              y = percbelowpoverty)) +
      geom_point() +
      facet_wrap(vars(state))

midwest %>%
    ggplot(aes(x = percollege, 
               y = percbelowpoverty, 
               color = percpovertyknown)) +
  geom_point()

midwest %>%
    ggplot(aes(x = percollege, 
               y = percbelowpoverty, 
               shape = county)) +
  geom_point() + 
  # legend off, otherwise it overwhelms
  theme(legend.position = "none") 

midwest %>%
    ggplot(aes(x = percollege, 
               y = percbelowpoverty, 
               alpha = state)) +
  geom_point()

texas_annual_sales %>%
  ggplot(aes(x = year, y = total_volume)) +
    geom_point() + 
    geom_vline(aes(xintercept = 2007),
                linetype = "dotted")

## lab 0: a map

storms %>% 
  group_by(name, year) %>% 
  filter(max(category) == 5) %>%
  ggplot(aes(x = long, y = lat, color = name)) + 
  geom_path() +
  borders("world") +
  coord_quickmap(xlim = c(-130, -60), ylim = c(20, 50))

## lab 1: a line plot

wid_data_raw <- 
  # You will like have to adjust the file path
  readxl::read_xlsx("../data/world_wealth_inequality.xlsx", 
                    col_names = c("country", "indicator", "percentile", "year", "value")) %>%
  separate(indicator, sep = "\\n", into = c("row_tag", "type", "notes")) 

wid_data <- wid_data_raw 

french_data <- 
  wid_data %>% 
  filter(type == "Net personal wealth", country == "France") %>%
  mutate(perc_national_wealth = value * 100)

french_data %>%
  ggplot(aes(y = perc_national_wealth, x = year, color = percentile)) +
  geom_line()

## lab 2: distributions

chi_sq_samples <-
  tibble(x = c(rchisq(100000, 1) + rchisq(100000, 1), 
               rchisq(100000, 3), 
               rchisq(100000, 4)),
         df = rep(c("2", "3", "4"), each = 1e5)) 

chi_sq_samples %>%
  ggplot(aes(x = x, fill = df)) +
  geom_density( alpha = .5) + 
  labs(fill = "df", x = "sample")

## lab 4: grouped bar graphs

  mean_share_per_country <-
    wid_data %>% 
      filter(percentile %in% c("p99p100", "p90p100")) %>% 
      group_by(country, percentile) %>% 
      summarize(mean_share = mean(value, na.rm = TRUE),
                sd_share = sd(value, na.rm = TRUE))
  
  
  mean_share_per_country_with_time <-
    wid_data %>% 
      filter(country %in% c("China", "India", "USA")) %>%
      filter(percentile %in% c("p99p100", "p90p100")) %>% 
      mutate(time_period = case_when(year < 1960 ~ "1959 and earlier",
                                     year < 1980 ~ "1960 to 1979",
                                     year < 2000 ~ "1980 to 1999",
                                     TRUE ~ "2000 to present")) %>%
      group_by(country, percentile, time_period) %>% 
      summarize(mean_share = mean(value, na.rm = TRUE),
                sd_share = sd(value, na.rm = TRUE))
    
    mean_share_per_country %>%
      mutate(country = case_when(country == "Russian Federation" ~ "Russia", 
                                 country == "United Kingdom" ~ "UK",
                                 country == "South Africa" ~ "S Africa",
                                 TRUE ~ country)) %>%
      ggplot(aes(y = country, x = mean_share, fill = percentile)) +
      geom_col(position = "dodge2") +
      labs(x = "Mean share of national wealth", y = "", fill = "Wealth\npercentile")

## lab 4: faceted bar graph

     mean_share_per_country_with_time %>%
      ggplot(aes(x = country, y = mean_share, fill = percentile)) +
        geom_col(position = "dodge2") + 
        facet_wrap(~time_period)
