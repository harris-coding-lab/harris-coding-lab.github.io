grouped_data <-
  traffic_data %>%
    group_by(Race, Gender)

traffic_data %>%
  group_by(Race) %>%
  summarize(n = n())

citation_strings <- c("citation issued", "citations issued", "citation  issued" )

arrest_strings <- c("citation issued, arrested on active warrant",
                "citation issued; arrested on warrant",
                "arrested by cpd",
                "arrested on warrant",
                "arrested",
                "arrest")

disposition_by_race <-
    traffic_data %>%
      mutate(Disposition = str_to_lower(Disposition),
             Disposition = case_when(Disposition %in% citation_strings ~ "citation",
                                     Disposition %in% arrest_strings ~ "arrest",
                                     TRUE ~ Disposition)) %>%
      count(Race, Disposition) %>%
      group_by(Race) %>%
      mutate(freq = round(n / sum(n), 3))


disposition_by_race %>%
  filter(n > 5, Disposition == "citation") %>%
  ggplot(aes(y = freq, x = Race)) +
  geom_col() +
  labs(y = "Citation Rate Once Stopped", x = "", title = "Traffic Citation Rate") +
  theme_minimal()

wid_data_raw <-
    # You will like have to adjust the file path
    readxl::read_xlsx("../data/world_wealth_inequality.xlsx",
                      col_names = c("country", "indicator", "percentile", "year", "value")) %>%
    separate(indicator, sep = "\\n", into = c("row_tag", "type", "notes"))

wid_data <- wid_data_raw %>%
              select(-row_tag) %>%
              select(-notes, everything()) %>%
              # some students had trouble because excel added "\r" to the end
              # of each string. mutate standardizes the string across platforms.
              mutate(type = ifelse(str_detect(type, "Net personal wealth"),
                                   "Net personal wealth", type)) %>%
              filter(type == "Net personal wealth")

mean_share_per_country %>%
  mutate(country = case_when(country == "Russian Federation" ~ "Russia",
                             country == "United Kingdom" ~ "UK",
                             country == "South Africa" ~ "S Africa",
                             TRUE ~ country)) %>%
  ggplot(aes(x = country, y = mean_share, fill = percentile)) +
  geom_col(position = "dodge2") +
  labs(y = "Mean share of national wealth", x = "", fill = "Wealth\npercentile")

mean_share_per_country_with_time %>%
  ggplot(aes(x = country, y = mean_share, fill = percentile)) +
    geom_col(position = "dodge2") +
    facet_wrap(~time_period)
