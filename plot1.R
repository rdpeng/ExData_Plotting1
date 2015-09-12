## Coursera - Module 4: Exploratory Data Analysis - Assignment 1
## 
## plot1.R - to generate plot1.png

## Download data from the UC Irvine Machine Learning Repository

file.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
file.dest <- 'exploredata.zip'

# download from the URL
download.file(file.url, file.dest, mode="wb")

## Read data from the zipped file
activepower = read.csv(unz(file.dest, "household_power_consumption.txt"), header=T,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))

## Format date and subset data for 2007-02-01 and 2007-02-02 only
activepower$Date = as.Date(activepower$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
activepower = activepower[activepower$Date >= startDate & activepower$Date <= endDate, ]

## Create the plot
png(filename="plot1.png", width=480, height=480)
hist(activepower$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()
