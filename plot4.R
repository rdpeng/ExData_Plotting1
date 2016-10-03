## Read in the data
epcfull <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")

## pull out the dates and times and make a single POSIXct column of date and time
dates <- epcfull$Date
times <- epcfull$Time
x <- paste(dates,times)
dt <- as.POSIXct(x, format = "%d/%m/%Y %H:%M:%S")
epc <- cbind(dt, epcfull)

## Pull out the days in question 
beg <- as.POSIXct("2007-02-01")
end <- as.POSIXct("2007-02-03")
epc <- subset(epc,epc$dt>=beg & epc$dt < end)

## make the Global_active_power column numeric
epc$Global_active_power <- as.numeric(epc$Global_active_power)

## Initiate the Histogram
## Read in the data
epcfull <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")

## pull out the dates and times and make a single POSIXct column of date and time
dates <- epcfull$Date
times <- epcfull$Time
x <- paste(dates,times)
dt <- as.POSIXct(x, format = "%d/%m/%Y %H:%M:%S")
epc <- cbind(dt, epcfull)

## Pull out the days in question 
beg <- as.POSIXct("2007-02-01")
end <- as.POSIXct("2007-02-03")
epc <- subset(epc,epc$dt>=beg & epc$dt < end)

## make the Global_active_power column numeric
epc$Global_active_power <- as.numeric(epc$Global_active_power)

## Set up file to save PNG in
png('plot4.png, width = 400, height = 400')

## Initiate the base
par(mfrow=c(2,2), mar = c(4,4,4,4))
## plot top left
plot(epc$dt, epc$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (Kilowatts)")
lines(epc$dt, epc$Global_active_power)

## plot top right
plot(epc$dt, epc$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(epc$dt, epc$Voltage)

## Plot bottom left
plot(epc$dt, epc$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering", yaxt = "n", ylim = c(0,35), mar = c(1,1,1,1))
axis(2,c(0,10,20,30))
lines(epc$dt, epc$Sub_metering_1, col = "cornsilk4")
lines(epc$dt, epc$Sub_metering_2, col = "red")
lines(epc$dt, epc$Sub_metering_3, col = "blue")
legend("topright", c(names(epc)[8:10]), col = c("cornsilk4", "red", "blue"), 
       lty = 1, lwd = 1, y.intersp = .75, cex = .75)


## Plot bottom right
plot(epc$dt, epc$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Voltage")
lines(epc$dt, epc$Global_reactive_power)

dev.off()