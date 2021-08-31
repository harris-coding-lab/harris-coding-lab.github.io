# This is the companion code to "Lab Session 01: Read and manipulate data" found in 01_read_and_manipulate_data.pdf
# It's always a good idea to keep your work in a file that you can run in the future.
# You can use this file to create your solutions or copy and paste into another file as you see fit.


# Working with data and scripts (to be covered during Q&A session)

# 10. If you followed the set-up, you should be able to run the following code  with no error
wid_data <- read_xlsx("world_wealth_inequality.xlsx")


# Examining wid_data

# 2. We can create our own header in read_xlsx

wid_data_raw <- read_xlsx("world_wealth_inequality.xlsx",
                          col_names = c("country", "indicator", "percentile", "year", "value")) 

# Now, when we look at the second column, it's a mess. We can separate it based on where 
# the \n (or on some windows computers \r\n) are and then deal with the data later

wid_data_raw <- read_xlsx("world_wealth_inequality.xlsx",
                          col_names = c("country", "indicator", "percentile", "year", "value")) %>% 
  separate(indicator, sep = "[\\r]?\\n", into = c("row_tag", "type", "notes"))

# NOTE: We want a clean reproducible script so you should just have one block of code reading the data:
# that last one. The other code were building blocks. If you want to keep "extra" code temporarily in your script 
# you can use # to comment out the code. 

# Manipulating world inequality data with dplyr (20 - 25 minutes)

# 2. 
# replace each ... with relevant code
french_data <- wid_data %>% 
  filter(... , ...)

# NOTE: When referring to words in the data, make sure they are in quotes: "France", "Net personal wealth". 
# When referring to columns, do not use quotes. We'll talk about data types in the next lecture. 

french_data %>% 
  ggplot(aes(y = value, x = year, color = percentile)) + 
  geom_line()

# 5. 
# replace ... with relevant code

russian_data %>% 
  filter(...) %>% 
  arrange(...)

# HINT: If you find an error, check your environment for the object you want to work with.

# 1.
# replace ... with relevant code

russian_data %>% 
  filter(...) %>% 
  summarize(top10 = mean(...))

# Manipulating midwest demographic data with dplyr

# 3. 
glimpse(midwest)

# 4. 
names(midwest_pop)
# replace ... with relevant code
midwest_pop <- midwest %>%  select(county, state, ...)




