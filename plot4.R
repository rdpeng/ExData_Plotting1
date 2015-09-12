## Coursera - Module 4: Exploratory Data Analysis - Assignment 1
## 
## plot4.R - to generate plot4.png

## Firstly, check if data from the UC Irvine Machine Learning Repository has been
## downloaded

file.dest = "exploredata.zip"
if (!file.exists(file.dest)) {
  retval = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                         destfile = file.dest,
                         method = "curl")
}

## Read data from the zipped file
activepower = read.csv(unz(file.dest, "household_power_consumption.txt"), header=T,
                       sep=";", stringsAsFactors=F, na.strings="?",
                       colClasses=c("character", "character", "numeric",
                                    "numeric", "numeric", "numeric",
                                    "numeric", "numeric", "numeric"))

## Format date and subset data for 2007-02-01 and 2007-02-02 dates only
activepower$timestamp = strptime(paste(activepower$Date, activepower$Time),
                                 format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
activepower = activepower[activepower$timestamp >= startDate & activepower$timestamp <= endDate, ]

## Create plot4
png(filename="plot4.png", width=480, height=480)

## setup the layout of 4 plots
par(mfcol=c(2,2))

## First plot
plot(activepower$timestamp, activepower$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

## Second plot
plot(activepower$timestamp, activepower$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(activepower$timestamp, activepower$Sub_metering_2, col="red")
lines(activepower$timestamp, activepower$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

## Third Plot
plot(activepower$timestamp, activepower$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

## Fourth plot
plot(activepower$timestamp, activepower$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()