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
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

## plot graph 3, Sub metering 1, black
with(power,
plot(Datetime, Sub_metering_1,
type="l",
main="",
xlab="",
ylab="Energy sub metering",
))

## plot Sub metering 2, red
with(power, lines(Datetime, Sub_metering_2, col="red"))

## plot Sub metering 3, blue
with(power, lines(Datetime, Sub_metering_3, col="blue"))

## add the legend feature
legend("topright", 
lwd ="1" , 
col = c("black", "red", "blue"), 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## open png graphics device and create file
dev.copy(png, file = "plot3.png")

## close graphics device
dev.off()
