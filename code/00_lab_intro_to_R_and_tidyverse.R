# This is the companion code to "Pre-work: Intro to R, RStudio and Tidyverse" found in 00_lab_intro_to_R_and_tidyverse.pdf
# It's always a good idea to keep your work in a file that you can run in the future.
# You can use this file to create your solutions or copy and paste into another file as you see fit.


#  4. Run the following code to make sure you have installed successfully. Then, assign the resulting tibble to the name `big_storms` using `<-`.

storms %>%
  group_by(name, year) %>%
  filter(max(category) == 5)

# 5 If you run it you will get an error that says your code is missing a required package. 
# Use the error to figure out what package is missing, install it and then reproduce the map on your computer.
ggplot(aes(x = long, y = lat, color = name), data = big_storms) +
  geom_path() + 
  borders("world") + 
  coord_quickmap(xlim = c(-130, -60), ylim = c(20, 50))


# Part 2: Processing and analyzing data, an example: 

# PATIENCE it will take a few minutes to download the data. 
covid_data <- 
  # reads data directly from CDC website
  read_csv(paste0("https://data.cdc.gov/api/views/qfhf-uhaa/rows.csv?",
                  "accessType=DOWNLOAD&bom=true&format=true%20target="), 
           col_types = cols(Suppress = col_character())) %>%
  # change column names from human readable to more code friendly
  # and create a new column (called diff) based on older ones
  mutate(week = `Week Ending Date`,
         race_ethnicity = `Race/Ethnicity`,
         n_deaths = `Number of Deaths`,
         diff = `Difference from 2015-2019 to 2020`,
         #  notice that diff + expected deaths = n_deaths
         expected_deaths = n_deaths - diff,
         perc_diff = `Percent Difference from 2015-2019 to 2020`,
         year = MMWRYear,
         week_no = MMWRWeek + ifelse(year == "2021", 52, 0),
         jurisdiction = Jurisdiction,
         state = `State Abbreviation`
  )  %>%
  # filter ROWs of data to make it more manageable
  filter(`Time Period` %in% c("2020", "2021"), Outcome == "All Cause", Type != "Unweighted") %>%
  # select COLUMNS of data to make it more manageable
  select(jurisdiction, state, week, year, week_no, 
         race_ethnicity, n_deaths, expected_deaths, diff, perc_diff)

# 4. Use the `<-` to assign the results of the code to the name `us_deaths_by_race`. (The code is available in the .R file.)
covid_data %>%
  filter(state == "US") %>%
  group_by(race_ethnicity) %>%
  summarize(expected_deaths = sum(expected_deaths, na.rm = TRUE),
            total_additional_deaths = sum(diff, na.rm = TRUE),
            percent_diff = round(100 * total_additional_deaths / expected_deaths)
  ) 


# 5
us_deaths_by_race %>%
  ggplot(aes(y = race_ethnicity, x = percent_diff)) + 
  geom_col() +
  labs(x = "Percent above expected death count",
       y = "",
       title = "Racial disparities of Covid-19 (USA)" )


# 8
covid_data %>%
  filter(state == "US") %>%
  # filter(race_ethnicity %in%
  # c("Hispanic", "Non-Hispanic White", "Non-Hispanic Black", "Non-Hispanic Asian")) %>%
  ggplot(aes(x = week_no, y = perc_diff, color = race_ethnicity)) +
  geom_line()  +
  labs(y = "Percent above expected death count", 
       x = "week since January 1, 2020", 
       title = "Racial disparities of Covid-19 (USA)", 
       color = "" )
