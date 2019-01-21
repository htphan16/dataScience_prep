library(dslabs)
data(murders)
str(murders)
names(murders)
pop <- murders$population
reg <- murders$region
abb <- murders$abb
total <- murders$total
state <- murders$state
class(pop)
class(reg)
class(total)
class(3==4)
length(pop)
length(reg)
levels(reg)
length(levels(reg))

x <- murders$region
x
# table(): frequency of elements in the vector
table(x)

p <- murders['population']
p
class(p)

p <- murders[['population']]
class(p)

x <- c(34,25,64)
class(x)
