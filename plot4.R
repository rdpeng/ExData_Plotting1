################################################################################
# Coursera - Exploratory Data Analysis - Course Project 1 - Plot 4
################################################################################

# Dependencies
library(lubridate)

# Read source file
# NOTE: Expect for data to be in default DIR
epc <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

# Convert Date and Time column into a unique Timestamp
epc[,"Date"] <- dmy_hms(paste(epc[,"Date"], epc[,"Time"]))
names(epc)[1] = "Timestamp"
epc <- subset(epc, select = -Time)

# Select data based on requested dates
dateMin <- ymd_hms("2007-02-01 00:00:00")
dateMax <- ymd_hms("2007-02-03 00:00:00")
epc_sel <- subset(epc, Timestamp >= dateMin & Timestamp < dateMax)

# Convert relevant columns for numeric data type
epc_sel[, "Voltage"] <- as.numeric(epc_sel[, "Voltage"])
epc_sel[, "Sub_metering_1"] <- as.numeric(epc_sel[, "Sub_metering_1"])
epc_sel[, "Sub_metering_2"] <- as.numeric(epc_sel[, "Sub_metering_2"])
epc_sel[, "Sub_metering_3"] <- as.numeric(epc_sel[, "Sub_metering_3"])
epc_sel[, "Voltage"] <- as.numeric(epc_sel[, "Voltage"])
epc_sel[, "Global_reactive_power"] <- as.numeric(epc_sel[, "Global_reactive_power"])

# Set locale as english to skip my own language settings
Sys.setlocale("LC_ALL","English")

# Plot 4
# NOTE: Could use Cairo library for better quality!
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize=9, res = 140)
par(mfrow = c(2,2), mar = c(4,4,2,2))
plot(epc_sel$Timestamp, epc_sel$Global_active_power, type="l", ylab = "Global Acive Power", xlab = '', cex.axis=0.70,  cex.lab=0.70)
plot(epc_sel$Timestamp, epc_sel$Voltage, type="l", xlab= "datetime", ylab = "Voltage", cex.axis=0.70,  cex.lab=0.70)
plot(epc_sel$Timestamp, epc_sel$Sub_metering_1, ylim = range(epc_sel$Sub_metering_1, epc_sel$Sub_metering_2, epc_sel$Sub_metering_3), ylab = "Energy sub metering", xlab = '', type = "l", cex.axis=0.70,  cex.lab=0.70)
lines(epc_sel$Timestamp, epc_sel$Sub_metering_2, col = "red", type = 'l')
lines(epc_sel$Timestamp, epc_sel$Sub_metering_3, col = "blue", type = 'l')
legend("topright", lty = 1,legend = tail(names(epc_sel), 3), col=c("black", "red", "blue"), cex = 0.6, bty = 'n')
plot(epc_sel$Timestamp, epc_sel$Global_reactive_power, type="l", xlab= "datetime", ylab = "Global_reactive_power", cex.axis=0.70,  cex.lab=0.70)
dev.off()
