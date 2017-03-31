#### R scipt to create plot 3
## Load package
library(lubridate)

## Read Data and turn into datetime
coltype=c(rep("character",2), rep("numeric",7))
data <- read.table("household_power_consumption.txt", header = T, sep = ';', 
                   colClasses = coltype, na.strings = "?")
data$Date <- strptime(data$Date, "%d/%m/%Y")

## Extract only 2007/02/01 and 2007/02/02
bool<-data$Date == as.POSIXct('2007-02-01') | data$Date == as.POSIXct('2007-02-02')
data <- data[bool,]

## Create datetime column and put it into the format ymdhms
data$Date_time <- paste(data$Date, data$Time)
data$Date_time <- ymd_hms(data$Date_time)

## plot the three plots on the same graph with legend
png("plot3.png", width = 480, height = 480, units = "px", pointsize = 12)
with(data, plot(Date_time, Sub_metering_1, type = "S", ylab = "Energy sub metering", xlab = ""))
with(data, lines(Date_time, Sub_metering_2, type = "S", col = 'red'))
with(data, lines(Date_time, Sub_metering_3, type = "S", col = 'blue'))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid", col = c("black", "red", "blue"))
dev.off()