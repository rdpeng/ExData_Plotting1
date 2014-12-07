## Reading the dataset:
d <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

## Converting the date column to Date class:
d$Date <- as.Date(d$Date, format="%d/%m/%Y")

## Subsetting the data.frame to only include the desired dates:
d <- d[d$Date >= as.Date("2007-02-01") & d$Date<=as.Date("2007-02-02"),]

## Convert Date and Time columns to POSIXlt class:
d$Date <- as.POSIXlt(paste(as.Date(d$Date, format="%d/%m/%Y"), d$Time, sep=" "))
