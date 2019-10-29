# Solutions to Week 2 interactive tutorial

# Analyzing student loan debt ---------------------------------------------

library(tidyverse)
library(readxl)

setwd("~/Downloads")
student_loan_debt <- read_xlsx("area_report_by_year.xlsx", sheet = "studentloan", skip = 3) %>%
  filter(state != "allUS") %>%
  gather(key = year, value = per_capita_student_debt, -state) %>% 
  mutate(year = str_sub(year, 4, 7),
         year = as.numeric(year))

write_csv(student_loan_debt, "student_loan_debt.csv")


# Exploratory data analysis -----------------------------------------------

str(student_loan_debt)
glimpse(student_loan_debt)

arrange(student_loan_debt, per_capita_student_debt)
arrange(student_loan_debt, desc(per_capita_student_debt))

student_loan_debt[row_number, column_number]
student_loan_debt[row_condition, ]$column_name

filter(student_loan_debt, row_condition) %>% 
  pull(column_name)

filter(student_loan_debt, per_capita_student_debt < 800)
filter(student_loan_debt, per_capita_student_debt > 800, year == 2008)
filter(student_loan_debt, is.na(per_capita_student_debt))

max_debt_by_year <- student_loan_debt %>%
  group_by(year) %>%
  summarize(max_debt = max(per_capita_student_debt))

min_debt_by_year <- student_loan_debt %>%
  group_by(year) %>%
  summarize(min_debt = min(per_capita_student_debt))

mean_debt_by_year <- student_loan_debt %>%
  group_by(year) %>%
  summarize(mean_debt = mean(per_capita_student_debt))

mean_debt_by_year <- student_loan_debt %>%
  group_by(year) %>%
  summarize(mean_debt = mean(per_capita_student_debt, na.rm = TRUE))


# Joining and plotting data -----------------------------------------------

library(tidyverse)
library(readxl)

setwd("~/Downloads")
population <- read_xlsx("area_report_by_year.xlsx", sheet = "population", skip = 3)  %>%
  filter(state != "allUS") %>%
  gather(key = year, value = population, -state) %>%
  mutate(year = str_sub(year, 4, 7),
         year = as.numeric(year))

write_csv(population, "population.csv")

joined_data <- student_loan_debt %>%
  left_join(population, by = c("state", "year"))

joined_data

student_loan_debt_by_year_weighted <- joined_data %>%
  mutate(total_student_debt = population * per_capita_student_debt) %>% 
  group_by(year) %>%
  summarize(annual_student_debt = sum(total_student_debt, na.rm=TRUE),
            population = sum(population, na.rm=TRUE)) %>% 
  mutate(per_capita_student_debt = annual_student_debt/population)

student_loan_debt_by_year_weighted

library(ggplot2)

student_loan_debt_by_year <- student_loan_debt %>%
  group_by(year) %>%
  summarize(per_capita_student_debt = mean(per_capita_student_debt, na.rm = TRUE))

student_loan_debt_by_year_weighted %>%
  ggplot(aes(x = year, y = per_capita_student_debt)) +
  geom_line() +
  theme_minimal() +
  geom_line(data = student_loan_debt_by_year, color = "red")
