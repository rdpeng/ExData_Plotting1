#### R scipt to create plot 4
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
png("plot4.png", width = 480, height = 480, units = "px", pointsize = 12)
par(mfrow = c(2,2))
##subplot 1
with(data, plot(Date_time, Global_active_power, type = "S", ylab = "Global Active Power", xlab = ""))

##subplot 2
with(data, plot(Date_time, Voltage, type = "S", ylab = "Voltage", xlab = "datetime"))

##subplot 3
with(data, plot(Date_time, Sub_metering_1, type = "S", ylab = "Energy sub metering", xlab = ""))
with(data, lines(Date_time, Sub_metering_2, type = "S", col = 'red'))
with(data, lines(Date_time, Sub_metering_3, type = "S", col = 'blue'))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid", col = c("black", "red", "blue"))

##subplot 4
with(data, plot(Date_time, Global_reactive_power, type = "S",  xlab = "datetime"))
dev.off()