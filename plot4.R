library(dplyr)
# import a chink of data
someData <- read.table("household_power_consumption.txt", sep = ";" , 
                       header = TRUE, skip = 0, nrows = 100000, na.strings = "?")
someData$Date_Time <- as.POSIXct(strptime(paste(someData$Date, someData$Time), 
                                          format = "%d/%m/%Y %H:%M:%S"))
# select the dates between 2007-02-01 and 2007-02-02
cleanData <- filter(someData, 
                    Date_Time >= "2007-02-01 00:00:00" & Date_Time <="2007-02-02 23:59:59")
# png("plot4.png")
par(mfcol = c(2,2))
# plot top left
with(cleanData, plot(x = Date_Time, y = Global_active_power, 
                     type = "l",
                     ylab = "Global Active Power (kilowatts)",
                     xlab = NA))
# plot bottom left
plot(x = cleanData$Date_Time, 
     y = cleanData$Sub_metering_1, 
                     type = "l",
                     ylab = "Energy sub metering",
                     xlab = NA)
lines(x = cleanData$Date_Time, 
      y = cleanData$Sub_metering_2,
      col = "red")

lines(x = cleanData$Date_Time, 
      y = cleanData$Sub_metering_3,
      col = "blue")
legend(x="topright", legend =  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"), box.lty = 0, cex = 0.6)


# plot top right
with(cleanData, plot(x = Date_Time, y = Voltage, 
                     type = "l",
                     ylab = "Voltage",
                     xlab = "datetime"))
# plot bottom right
with(cleanData, plot(x = Date_Time, y = Global_reactive_power, 
     type = "l",
     xlab = "datetime"))

dev.copy(png, "plot4.png", bg = "transparent")
dev.off()
