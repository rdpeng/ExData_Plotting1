## Reading the dataset:
d <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

## Converting the date column to Date class:
d$Date <- as.Date(d$Date, format="%d/%m/%Y")

## Subsetting the data.frame to only include the desired dates:
d <- d[d$Date >= as.Date("2007-02-01") & d$Date<=as.Date("2007-02-02"),]

## Start a PNG device and plot the histogram of global_active_power:
png("plot1.png", width=480, height=480)
par(mar=c(4.7, 4.7, 0.7, 0.7))
hist(d$Global_active_power, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
