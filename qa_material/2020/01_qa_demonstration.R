
setwd("~/coding-lab/harris-coding-lab.github.io/data")

wid_data_raw <-
  readxl::read_xlsx("world_wealth_inequality.xlsx",
                    col_names = c("country", "indicator", "percentile", "year", "value")) %>%
    separate(indicator, sep = "\\n", into = c("row_tag", "type", "notes"))



french_data <-
  wid_data_raw %>%
    # add a typo here
    filter(country == "France", type == "Net personal wealth") %>%
    select(-notes, everything())

french_data_1960 <-
  french_data %>%
    filter(year >= 1960, year <= 1970, !is.na(value)) %>%
    # a student did this for some reason?
    distinct(year) %>%
    mutate(perc_national_wealth = value*100)



tibble(col = c("mike_he/his_1980", "abe_he/his_1980")) %>%
  separate(col, sep = "_", into = c("name", "pronouns", "year") )
