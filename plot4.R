setwd("~/Desktop/coursera /ExData_Plotting1")
rm(list=ls())## removes files for clarity
summary("household_power_consumption.txt")

hpc <- read.csv("household_power_consumption.txt",
                sep=";",
                dec=".",
                stringsAsFactors= FALSE,
                na.strings = "?",
                colClasses=c("character", "character", "numeric", "numeric", "numeric",
                             "numeric", "numeric", "numeric", "numeric"))## sets column classes
summary(hpc)

subSet_hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]## subsets dates used in plot
summary(subSet_hpc)

datetime <- strptime(paste(subSet_hpc$Date, subSet_hpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
##converts date and time from character to object

##as.numeric makes data easier to work with
globalActivePower <- as.numeric(subSet_hpc$Global_active_power)
globalReactivePower <- as.numeric(subSet_hpc$Global_reactive_power)
subMetering1 <- as.numeric(subSet_hpc$Sub_metering_1)
subMetering2 <- as.numeric(subSet_hpc$Sub_metering_2)
subMetering3 <- as.numeric(subSet_hpc$Sub_metering_3)
voltage <- as.numeric(subSet_hpc$Voltage)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))## set device window

plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

plot(datetime, voltage, typ e= "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =, lwd = 2.5,
       col = c("black", "red", "blue"), bty = "o")

plot(datetime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()## saves plot to R
par(mfrow = c(2, 2))

plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =, lwd = 2.5,
       col = c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
##need to remember to turn device off after finished using plot
