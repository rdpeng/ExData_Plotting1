pwr <- read.csv("household_power_consumption.txt", sep=";")
p1 <- pwr[as.Date(pwr$Date, format = "%d/%m/%Y") == "2007-02-01",]
p2 <- pwr[as.Date(pwr$Date, format = "%d/%m/%Y") == "2007-02-02",]
p <- rbind(p1, p2)
dt <- paste(p$Date, p$Time)
dt <- strptime(dt, format = "%d/%m/%Y %H:%M:%S")
