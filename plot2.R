################################################################################
# Coursera - Exploratory Data Analysis - Course Project 1 - Plot 2
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
epc_sel[, "Global_active_power"] <- as.numeric(epc_sel[, "Global_active_power"])

# Set locale as english to skip my own language settings
Sys.setlocale("LC_ALL","English")

# Plot 2
# NOTE: Could use Cairo library for better quality!
png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize=9, res = 140)
plot(epc_sel$Timestamp, epc_sel$Global_active_power, type="l", ylab = "Global Acive Power (kilowatts)", xlab = '', cex.axis=0.70,  cex.lab=0.70)
dev.off()
