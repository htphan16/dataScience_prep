library(dslabs)
data(murders)

murder_rate <- murders$total/murders$population*100000
ind <- which.min(murder_rate)
ind
murder_rate[ind]
# conditionals
# 
if (murder_rate[ind] < 0.3) {
  print(murders$state[ind])
} else {
  print('no state with murder rate less than 0.3')
}
if (murder_rate[ind] < 0.5) {
  print(murders$state[ind])
} else {
  print('no state with murder rate less than 0.5')
}
# ifelse() can be applied to vectors
ifelse(is.na(na_example), 0, na_example)
ifelse(murder_rate < 1, murders$state, 'state with murder rate more than 1')

# any, all
x <- c(TRUE, TRUE, TRUE)
y <- c(TRUE, TRUE, FALSE)
z <- c(FALSE, FALSE, FALSE)
# check if at least one element is true
any(x)
any(y)
any(z)
# check if all elements are true
all(x)
all(y)
all(z)

# define a function

# <name of function> <- function(<parameters>) {
# define variables based on parameters, use conditionals...
# }

# paste() concatenates two strings
say_hi <- function(name) {
  greeting <- paste("Hello", name)
  greeting
}
say_hi("Huong")

# Assign the state abbreviation when the state name is longer than 8 characters 
# nchar gives number of characters
new_names <- ifelse(nchar(murders$state) > 8, murders$abb, murders$state)
new_names

# Create function called `sum_n`
sum_n <- function(x) {
  n <- sum(1:x)
  n
}
# Use the function to determine the sum of integers from 1 to 5000
sum_n(5000)

# Define a function and store it in `compute_s_n`
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Create a vector for storing results
s_n <- vector("numeric", 25)
s_n

# write a for-loop to store the results in s_n
for (i in 1:25) {
  s_n[i] <- compute_s_n(i)
}
s_n
n <- 1:25
#  Create the plot 
plot(n, s_n)

# Check that s_n is identical to the formula given in the instructions.
identical(s_n, n*(n+1)*(2*n+1)/6)

