
library(tidyverse)
library(readxl)
library(haven)
texas_housing_data <- txhousing

texas_housing_data <- read_csv("texas_housing_data.csv")

fed_data <- read_xlsx("SCE-Public-LM-Quarterly-Microdata.xlsx")

drug_war_data <- read_dta(
  "../data/Dataset_HighProfileCriminalViolence.dta")
head(drug_war_data)

fed_data <-read_xlsx(
  "../data/SCE-Public-LM-Quarterly-Microdata.xlsx")
head(fed_data)

fed_data <- read_xlsx(
    "../data/SCE-Public-LM-Quarterly-Microdata.xlsx", 
    sheet = "Data 2013", 
    skip = 1)
head(fed_data)

head(texas_housing_data)

nrow(texas_housing_data)

names(texas_housing_data)
