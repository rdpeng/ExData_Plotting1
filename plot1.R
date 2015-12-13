## Libraries
library(graphics)
library(grDevices)

## Download the data from source, unzip and import it to table
if(!file.exists("household_power_consumption.txt"))
{
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  unzipped <- unz(temp, "household_power_consumption.txt")
  download_data <- read.csv(unzipped, sep=";", na.strings = "?", header=TRUE)
  unlink(temp)
}else{
  download_data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)
}

## Set date and time datatypes
download_data$Date <- as.Date(download_data$Date,"%d/%m/%Y")
download_data$Time <- strptime(download_data$Time, format="%H:%M:%S")

## Subsetting data to date range 2007-02-01 to 2007-02-02
data <- subset(download_data, download_data$Date >= as.Date("01/02/2007","%d/%m/%Y") & download_data$Date <= as.Date("02/02/2007","%d/%m/%Y"))

## draw
png(filename = "plot1.png",width = 480, height = 480)

hist(data$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency", col="orangered")

dev.off()