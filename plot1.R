library(lubridate)

## read the data set
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

## convert date character to recognizable date format, lubridate
## filter dataset for dates 01 - 02/02/2007
power$Date <- dmy(power$Date)
power <- power[power$Date >= dmy("01/02/2007"),]
power <- power[power$Date <= dmy("02/02/2007"),]

## convert character to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)

## plot graph 1, Global Active Power
hist(power$Global_active_power, 
col="red", 
main="Global Active Power", 
xlab="Global Active Power (kilowatts)")

## open png graphics device and create file
dev.copy(png, file = "plot1.png")

## close graphics device
dev.off()
