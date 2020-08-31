library(tidyverse)

## Vectors 

# numeric vector of length 6
my_numbers <- c(1, 2, 3, 4, 5, 6)

# character vector of length 3
my_characters <- c("public", "policy", "101")

# vectors of length 1
tis_a_vector <- 1919
technically_a_logical_vector <- TRUE

# use `c()` function to combine vectors
c(c(1, 2, 3), c(4, 5, 6))
c(tis_a_vector, 1920)

# create vectors
c("a", "a", "a", "a")
rep("a", 4) 
rep(c("a", 5), 10)
rep(c("a", 5), each = 10)

# other ways to create vectors
c(2, 3, 4, 5)
2:5
seq(2, 5)

# creating random vectors
(my_random_normals <- rnorm(5))
(my_random_uniforms <- runif(5))

## Creating empty vectors of a given type
my_integers <- integer(1e6) # 1 million 0

my_chrs <- character(4e5)
my_chrs[1:10] # 40K ""

## Binary operators are vectorized
my_numbers <- 1:6

# this adds the vectors item by item
my_numbers + my_numbers 

# this adds 6 to each object  (called recycling)
my_numbers + 6 

# this compares the values in two vectors item by item
my_numbers > c(1, 1, 3, 3, pi, pi)

# this compares each value of the my_numbers vector with 4
my_numbers > 4 # behind the scenes 4 is recycled 
my_numbers == 3 

## Warning: Vector recycling
a <- 1:6 + 1:5 # different length
a # you can see the recycling

# another example
a <- c(1, 2, 3, 4, 5, 6) + c(1, 2, 3, 4, 5)
# 1 + 1, 
# 2 + 2, 
# 3 + 3, 
# 4 + 4, 
# 5 + 5, 
# !!!6 + 1!!! Recycled.
a

## Vectorized functions built into R
a_vector <- rnorm(100)
sqrt(a_vector) # take the square root of each number
log(a_vector) # take the natural log of each number
exp(a_vector) # e to the power of each number
round(a_vector, 2) # round each number

str_to_upper(a_chr_vector) # make each chr uppercase
str_replace(a_chr_vector, "e", "3")

## Functions that reduce vectors
sum(a_vector)  # add all the numbers 
median(a_vector) # find the median
length(a_vector) # how long is the vector
any(a_vector > 1) # TRUE if any number in a_vector > 1

a_chr_vector <- c("a", "w", "e", "s", "o", "m", "e")
paste0(a_chr_vector) # combine strings

## Tibble columns are vectors
care_data <- tibble(
  id = 1:5,
  n_kids = c(2, 4, 1, 1, NA),
  child_care_costs = c(1000, 3000, 300, 300, 500),
  random_noise = rnorm(5, sd = 5)*30
)

## Subsetting
# Two ways to pull out a column as a tibble
care_data %>% pull(n_kids) # tidy way
care_data$n_kids # base R way
care_data[["n_kids"]] # base R way

care_data %>% select(n_kids) # tidy way
care_data["n_kids"] # base R way

## Type issues
care_data %>% 
  mutate(spending_per_child = n_kids / child_care_costs)
glimpse(care_data)

# logical, also known as booleans
type_logical <- FALSE
type_logical <- TRUE

# integer and double, together are called: numeric
type_integer <- 1L
type_double <- 1.0

type_character <- "abbreviated as chr" 
type_character <- "also known as a string"

## Testing types
a <- "1"
typeof(a)
is.integer(a)
is.character(a)

typeof(care_data$child_care_costs)
typeof(care_data$n_kids)

## Type coercion 
a <- "4"
as.integer(a) + 3
as.numeric(a) + 3

care_data %>%
  mutate( n_kids = as.integer(n_kids),
          spending_per_kid = child_care_costs / n_kids)

## NAs introduced by coercion
as.integer("Unknown")

## `NA`s are contagious
NA + 4
max(c(NA, 4, 1000))

## Automatic coercion (Extension material to be discussed live)
paste0("str", "ing")
paste0(1L, "ing")

TRUE + 4
FALSE + 4
paste0(FALSE, "?")
mean(c(TRUE, TRUE, FALSE, FALSE, TRUE))

## `NA`s are contagious, redux.
b <- c(NA, 3, 4, 5)
sum(b)
sum(b, na.rm = TRUE)

## Subsetting vectors
letters[[3]] # Use `[[` for subsetting a single value
letters[c(25,5,19)] # Use `[` for subsetting multiple values
my_numbers <- c(2, 4, 6, 8, 10)

# get all numbers besides the 1st 
my_numbers[-1]

# get all numbers besides the 1st and second
my_numbers[-c(1,2)]

# get all numbers where true
my_numbers[c(TRUE, FALSE, FALSE, TRUE, FALSE)]
my_numbers[my_numbers > 4]

# example
numerators <- rep(1, 11)
denominators <- 2 ^ c(0:10)
sum(numerators/denominators)

# a list holding multiple types
a_list <- list(1L, "fun", c(1,2,3))
typeof(a_list)
typeof(a_list[[1]])
typeof(a_list[[2]])
typeof(a_list[[3]])





