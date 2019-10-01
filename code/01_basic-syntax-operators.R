# Coding Lab Week 1
# Basic Syntax and Operators

?sum

4 + 4
4 - 4
4 * 4
4 / 4
4 ^ 4

my_number <- 4
my_number
my_number + 3
my_number * 3

my_number <- sqrt((12 * my_number) + 1)
my_number

# logical, also known as booleans
type_logical <- FALSE
type_logical <- TRUE

# integer and double, together are called: numeric
type_integer <- 1L
type_double <- 1.0

type_character <- "abbreviated as chr, also known as a string"

a <- "1"
b <- 2 
# a + b # this won't work

typeof(a)
typeof(b)

as.integer(a) + 3
as.numeric(a) + 3

paste0(a, as.character(b))
paste0(a, b)

TRUE + 4
FALSE + 4
paste0(FALSE, "?")

as.numeric("d4")

4 < 4
4 >= 4
4 == 4
4 != 4

"four" == "four"
"four" == 4

"4" == 4

my_numbers <- c(1, 2, 3, 4, 5, 6)
my_numbers

c("a", "a", "a", "a")
rep("a", 4)

c(2, 3, 4, 5)
2:5
seq(2, 5)

my_numbers + my_numbers # this adds the vectors item by item
my_numbers + 6 # this adds 6 to each object 

my_numbers / c(.1, .2, .3, .4, .5, .6)

a <- my_numbers + c(1, 2)
a 

sum(a)
length(a)

numerator <- rep(1, 10)
denominator <- 2 ^ c(0:10)

sum(numerator/denominator)
