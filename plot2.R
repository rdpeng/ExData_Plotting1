library(lubridate)

file <- 'household_power_consumption.txt'
data <- read.csv(file, header = TRUE, sep = ';', na.strings = '?')

data$Date1 <- dmy(data$Date)
data2 <- data[data$Date1 > '2007-01-31' & data$Date1 < '2007-02-02', ]

png(filename = 'plot2.png', width = 480, height = 480)

data2$date_time <- strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S")

plot(data2$date_time , as.numeric(data2$Global_active_power) , 
     type = 'l', xlab = '', ylab = 'Global Active Power (kilowats)')


dev.off()
