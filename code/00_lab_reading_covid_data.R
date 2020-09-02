covid_data <-
  read_csv("https://data.cdc.gov/api/views/qfhf-uhaa/rows.csv?accessType=DOWNLOAD&bom=true&format=true%20target=",
           col_types = cols(Suppress = col_character())) %>%
  mutate(week = `Week Ending Date`,
         race_ethnicity = `Race/Ethnicity`,
         n_deaths = `Number of Deaths`,
         diff = `Difference from 2015-2019 to 2020`,
         expected_deaths = n_deaths - diff,
         perc_diff = `Percent Difference from 2015-2019 to 2020`,
         year = MMWRYear,
         week_no = MMWRWeek,
         jurisdiction = Jurisdiction,
         state = `State Abbreviation`
  )  %>%
  filter(`Time Period` == "2020", Outcome == "All Cause", Type != "Unweighted") %>%
  select(jurisdiction, state, week, year, week_no,
         race_ethnicity, n_deaths, expected_deaths, diff, perc_diff)
