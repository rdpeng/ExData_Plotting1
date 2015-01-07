library(lubridate)

## read the data set
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

## convert date character to recognizable date format, lubridate
## filter dataset for dates 01 - 02/02/2007
power$Date <- dmy(power$Date)
power <- power[power$Date >= dmy("01/02/2007"),]
power <- power[power$Date <= dmy("02/02/2007"),]

## combine Date and Time
power$Datetime <- paste(power$Date, power$Time, sep=" ")
power$Datetime <- ymd_hms(power$Datetime)

## convert character to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)

## plot graph 2, Global Active Power
with(power,
plot(Datetime, Global_active_power, 
type="l", 
main="", 
ylab="Global Active Power (kilowatts)",
xlab=""))

## open png graphics device and create file
dev.copy(png, file = "plot2.png")

## close graphics device
dev.off()
