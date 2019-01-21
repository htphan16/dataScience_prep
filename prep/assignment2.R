library(dplyr)

airport <- read.csv('airport.csv')
airport

# control flow method
airport_list = c()
passengers = 0
length = 0
for (i in 1:nrow(airport)) {
  if (airport$Scheduled.Departures[i] < airport$Performed.Departures[i]) {
    airport_list <- append(airport_list, as.character(airport$Airport[i]))
    passengers = passengers + airport$Passengers[i]
    length = length + 1
  }
}
airport_list
average_passengers <- passengers/length
average_passengers

# different control flow
ifelse(airport$Scheduled.Departures < airport$Performed.Departures, as.character(airport$Airport), NA)

# different method
new_airport <- airport %>% filter(Scheduled.Departures < Performed.Departures) %>% select(Airport, Passengers)
airport_list <- new_airport$Airport
average_passengers <- mean(new_airport$Passengers)
airport_list
average_passengers
