## plot 4
## read data and create column for DateTime
library(datasets)
household_power_consumption <- read.csv("~/Desktop/Coursera/
                                        household_power_consumption.txt",sep=";")
dateTime <- strptime((paste(household_power_consumption$Date, 
                            household_power_consumption$Time, sep=" ")), 
                     "%d/%m/%Y %H:%M:%S")
data <- cbind(dateTime, household_power_consumption)
colnames(data)[1] <- "DateTime"
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## create dashboard of 4 plots of Global Active Power, voltage, energy sub metering, and global reactive power
par(mfrow = c(2,2))
with(data2, {
    ## plot 1
    plot(DateTime, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")
    ## plot 2
    plot(DateTime, Voltage, type = "l", xlab = "Datetime", ylab = "Voltage")
    ## plot 3
    plot(DateTime, Sub_metering_1, type = "l", xlab= " ", ylab = "Energy Sub Metering")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n")
    ##plot 4
    plot(DateTime, Global_reactive_power, type = "l", xlab = "DateTime")
    })
## save as PNG
png(filename='plot4.png', width = 480, height = 480)
par(mfrow = c(2,2))
with(data2, {
    ## plot 1
    plot(DateTime, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")
    ## plot 2
    plot(DateTime, Voltage, type = "l", xlab = "Datetime", ylab = "Voltage")
    ## plot 3
    plot(DateTime, Sub_metering_1, type = "l", xlab= " ", ylab = "Energy Sub Metering")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n")
    ##plot 4
    plot(DateTime, Global_reactive_power, type = "l", xlab = "DateTime")
    })
    setwd('/Users/cberryma/Desktop/Coursera/')
    dev.off()
    
    