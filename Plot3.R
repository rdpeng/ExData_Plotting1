## Reading the dataset:
d <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

## Converting the date column to Date class:
d$Date <- as.Date(d$Date, format="%d/%m/%Y")

## Subsetting the data.frame to only include the desired dates:
d <- d[d$Date >= as.Date("2007-02-01") & d$Date<=as.Date("2007-02-02"),]

## Convert Date and Time columns to POSIXlt class:
d$Date <- as.POSIXlt(paste(as.Date(d$Date, format="%d/%m/%Y"), d$Time, sep=" "))

## Start a PNG device and plot all 3 submeterings vs. time:
png("plot3.png", width=480, height=480)
par(mar=c(4.7, 4.7, 0.7, 0.7))

plot(d$Date, d$Sub_metering_1, type="n", lwd=1, 
	ylim=c(0, max(c(d$Sub_metering_1, d$Sub_metering_2, d$Sub_metering_3))),
	xlab="", ylab="Energy sub metering")

lines(d$Date, d$Sub_metering_1, col="black")
lines(d$Date, d$Sub_metering_2, col="red")
lines(d$Date, d$Sub_metering_3, col="blue")

legend("topright", lwd=1, 
	col=c("black", "red", "blue"), 
	legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

dev.off()
