## Reading the dataset:
d <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

## Converting the date column to Date class:
d$Date <- as.Date(d$Date, format="%d/%m/%Y")

## Subsetting the data.frame to only include the desired dates:
d <- d[d$Date >= as.Date("2007-02-01") & d$Date<=as.Date("2007-02-02"),]

## Convert Date and Time columns to POSIXlt class:
d$Date <- as.POSIXlt(paste(as.Date(d$Date, format="%d/%m/%Y"), d$Time, sep=" "))


## Start a PNG device and plot GAP vs. time:
png("plot2.png", width=480, height=480)
par(mar=c(4.7, 4.7, 0.7, 0.7))
plot(d$Date, d$Global_active_power, type="l", 
    xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
