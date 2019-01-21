# Loading data
library(dslabs)
data(murders)

# Create a numeric vector to store the temperatures listed in the instructions into a vector named temp
# Make sure to follow the same order in the instructions
temp <- c('Beijing'=35, 'Lagos'=88, 'Paris'=42, 'Rio de Janeiro'=84, 'San Juan'=81, 'Toronto'=30)
temp

# Associate the cost values with its corresponding food item
cost <- c(50, 75, 90, 100, 150)
food <- c("pizza", "burgers", "salads", "cheese", "pasta")
names(cost) <- food

# You already wrote this code
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
names(temp) <- city

# cost of the last 3 items in our food list:
cost[3:5]

# temperatures of the first three cities in the list:
temp[1:3]

# Access the cost of pizza and pasta from our food list 
cost[c(1,5)]

# Define temp
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
names(temp) <- city

# Access the temperatures of Paris and San Juan
temp[c(3,5)]

x <- seq(12,73)
y <- 12:73

identical(x, y)
# length.out denotes the length of vector you want
x <- seq(12,73, length.out=100)
x
# class is integer instead of numeric by adding L to a whole number
class(3L)
3L - 3
class(3L - 3)

# Store the sequence in the object a
a <- seq(1, 10)
# Determine the class of a
class(a)

# Define the vector x
x <- c(1, 3, 5,"a")

# Note that the x is character vector
x

# Typecast the vector to get an integer vector
# You will get a warning but that is ok
x <- as.numeric(x)

# number of murders each state in ascending order
sort(murders$total)
# indices of state with number of murders in ascending order
ord <- order(murders$total)
# order of state with number of murders in ascending order
murders$state[ord]
# which.max(), which.min(): indices of element with max/min of a factor
max(murders$total)
i_max <- which.max(murders$total)
murders$state[i_max]

i_min <- which.min(murders$total)
murders$state[i_min]

rank(murders$total)

# Define the variable i to be the index of the smallest state
i <- which.min(murders$population)

# Define variable states to hold the states
states <- murders$state
# Use the index you just defined to find the state with the smallest population
states[i]

# Store temperatures in an object 
temp <- c(35, 88, 42, 84, 81, 30)

# Store city names in an object 
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# Create data frame with city names and temperature 
city_temps <- data.frame(name = city, temperature = temp)
city_temps

# Define a variable states to be the state names 
states <- murders$state

# Define a variable ranks to determine the population size ranks 
ranks <- rank(murders$population)

# Create a data frame my_df with the state name and its rank
my_df <- data.frame(name=states, rank=ranks)
my_df

# Define a variable states to be the state names from the murders data frame
states <- murders$state
# Define a variable ranks to determine the population size ranks 
ranks <- rank(murders$population)
ranks
# Define a variable ind to store the indexes needed to order the population values
ind <- order(murders$population)
ind
# Create a data frame my_df with the state name and its rank and ordered from least populous to most 
my_df <- data.frame(state=states[ind], rank=rank(sort(murders$population)))
my_df

# Using new dataset 
library(dslabs)
data(na_example)

# Checking the structure 
str(na_example)

# Find out the mean of the entire dataset 
mean(na_example)

# Use is.na to create a logical index ind that tells which entries are NA
ind <- is.na(na_example)

# Determine how many NA ind has using the sum function
sum(ind)

# Note what we can do with the ! operator
x <- c(1, 2, 3)
ind <- c(FALSE, TRUE, FALSE)
x[!ind]

# Create the ind vector
library(dslabs)
data(na_example)
ind <- is.na(na_example)
ind
class(ind)
# We saw that this gives an NA
mean(na_example)
na_example[!ind]
# Compute the average, for entries of na_example that are not NA 
mean(na_example[!ind])

murders$rate <- 100000*murders$total/murders$population
ind <- order(murders$rate, decreasing=TRUE)
ind
df <- data.frame(state=states[ind], murder_rate=sort(murders$rate, decreasing=TRUE))
df
mean(murder$rate)
# Assign city names to `city` 
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# Store temperature values in `temp`
temp <- c(35, 88, 42, 84, 81, 30)

# Convert temperature into Celsius and overwrite the original values of 'temp' with these Celsius values
temp <- (temp-32)*5/9
# Create a data frame `city_temps` 
city_temps <- data.frame(city=city, temp=temp)
city_temps

