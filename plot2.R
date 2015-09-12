## Coursera - Module 4: Exploratory Data Analysis - Assignment 1
## 
## plot2.R - to generate plot2.png

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

## Create plot2
png(filename="plot2.png", width=480, height=480)
plot(activepower$timestamp, activepower$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()

