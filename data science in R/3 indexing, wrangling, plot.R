# Loading data
library(dslabs)
data(murders)

# Loading dplyr
library(dplyr)

# which(...==...) give indices of values that match
ind <- murders$state=="Massachusetts"
ind
index <- which(murders$state=="Massachusetts")
index
murders$rate[!ind]
murders$rate[ind]
murders$rate[index]

# match(vector with values to be matched, vector to be matched against) give indices of values that match
mat <- match(c("Massachusetts", "California", "New York"), murders$state)
mat
murders$rate[mat]

# %in% test whether an element in one vector appears in another
states <- c("Virginia", "Florida", "Indiana", "Boston")
states %in% murders$state

# Store the murder rate per 100,000 for each state, in `murder_rate`
murder_rate <- murders$total / murders$population * 100000

# Store the `murder_rate < 1` in `low` 
low <- murder_rate < 1
murders$state[low]

# Get the indices of entries that are below 1
which(low)

# Create a vector ind for states in the Northeast and with murder rates lower than 1. 
northeast <- murders$region == "Northeast"
ind <- low & northeast
# Names of states in `ind` 
murders$state[ind]

# Compute average murder rate and store in avg using `mean` 
avg <- mean(murder_rate)
murder_rate < avg
# How many states have murder rates below avg ? Check using sum 
sum(murder_rate < avg)

# Store the 3 abbreviations in abbs in a vector (remember that they are character vectors and need quotes)
abbs <- c("AK", "MI", "IA")
# Match the abbs to the murders$abb and store in ind
ind <- match(abbs, murders$abb)
ind
# Print state names from ind
murders$state[ind]

# Store the 5 abbreviations in `abbs`. (remember that they are character vectors)
abbs <- c("MA", "ME", "MI", "MO", "MU")

# Use the %in% command to check if the entries of abbs are abbreviations in the the murders data frame
abbs %in% murders$abb

# Use the `which` command and `!` operator to find out which abbreviation are not actually part of the dataset and store in ind
ind <- which(!(abbs %in% murders$abb))
ind

# What are the entries of abbs that are not actual abbreviations
abbs[ind]

# mutate, filter, select
# mutate: change the table
# filter: select rows that satisfy conditioin
# select: select only certain columns to display/make a new table with selected columns
murders <- mutate(murders, rate=murder_rate)
filter(murders, rate<=0.71)
new_murders <- select(murders, state, region, rate)
new_murders
filter(new_murders, region=="West", rate <= 1)

# %>%: 'pipe' function: table %>% select ... %>% filter
murders %>% select(state, region, rate) %>% filter(region=="Northeast" | region=="West", rate <=0.8)

# data frame
grades = data.frame(names=c('James', 'Joanne', 'John', 'Joe'), test1=c(78,78,45,99), test2=c(98,76,89,100))
class(grades$names)
grades = data.frame(names=c('James', 'Joanne', 'John', 'Joe'), test1=c(78,78,45,99), test2=c(98,76,89,100), stringsAsFactors = FALSE)
class(grades$names)

# Loading data
library(dslabs)
data(murders)

# Loading dplyr
library(dplyr)

# Redefine murders so that it includes column named rate with the per 100,000 murder rates
murders <- mutate(murders, rate=murders$total/murders$population*100000)
class(murders$rate)

# Note that if you want ranks from highest to lowest you can take the negative and then compute the ranks 
x <- c(88, 100, 83, 92, 94)
rank(-x)
rank(murders$rate)
rank(-murders$rate)
# Defining rate
rate <-  murders$total/ murders$population * 100000

# Redefine murders to include a column named rank
# with the ranks of rate from highest to lowest
murders <- mutate(murders, rank=rank(-rate))
murders

# Use select to only show state names and abbreviations from murders
select(murders,state, abb)
murders %>% select(state, abb)

# Add the necessary columns
murders <- mutate(murders, rate = total/population * 100000, rank = rank(-rate))

# Filter to show the top 5 states with the highest murder rates
filter(murders,rank<=5)

# Use filter to create a new data frame no_south
no_south <- filter(murders, region!="South")
# Use nrow() to calculate the number of rows
nrow(no_south)

# Create a new data frame called murders_nw with only the states from the northeast and the west
murders_nw <- filter(murders, region %in% c('Northeast', 'West'))
murders_nw 
# Number of states (rows) in this category 
nrow(murders_nw)

# Create a table, call it my_states, that satisfies both the conditions 
my_states <- filter(murders, region %in% c('Northeast', 'West'), rate<1)

# Use select to show only the state name, the murder rate and the rank
select(my_states, state, rate,rank)

# show the result and only include the state, rate, and rank columns, all in one line
murders %>% filter(region %in% c('Northeast', 'West'), rate<1) %>% select(state,rate,rank)

# Create new data frame called my_states with %>%
my_states <- murders %>% mutate(rate=murders$total/murders$population*100000, rank=rank(-rate)) %>% filter(region %in% c('Northeast','West'), rate<1) %>% select(state, rate, rank)

population_in_millions <- murders$population/10^6
total_gun_murders <- murders$total

plot(population_in_millions, total_gun_murders)

# Transform population using the log10 transformation and save to object log10_population

log10_population <- log10(murders$population)


# Transform total gun murders using log10 transformation and save to object log10_total_gun_murders
log10_total_gun_murders <- log10(murders$total)

# Create a scatterplot with the log scale transformed population and murders 
plot(log10_population, log10_total_gun_murders)

# Store the population in millions and save to population_in_millions 
population_in_millions <- murders$population/10^6

# Create a histogram of this variable
hist(population_in_millions)

boxplot(murders$population~murders$region)
boxplot(population~region, data=murders)

