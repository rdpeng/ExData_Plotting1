library(lubridate)

file <- 'household_power_consumption.txt'
data <- read.csv(file, header = TRUE, sep = ';', na.strings = '?')

data$Date1 <- dmy(data$Date)
data2 <- data[data$Date1 > '2007-01-31' & data$Date1 < '2007-02-02', ]

png(filename = 'plot1.png', width = 480, height = 480)

hist(as.numeric(data2$Global_active_power) , col = 'red', 
     xlab = 'Global Active Power (kilowatts)', 
     main = 'Global Active Power', 
     ylim=c(0, 1200), xlim = c(0, 6))

dev.off()
