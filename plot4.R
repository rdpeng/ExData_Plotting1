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

## Plotting options, 4 plot graphs in 1 chart
> par(mfrow = c(2,2), mfcol = c(2,2))


## ***** plot graph 1 (plot2.R) *****
## convert character to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)

## plot graph 2, Global Active Power
with(power,
plot(Datetime, Global_active_power, 
type="l", 
main="", 
ylab="Global Active Power (kilowatts)",
xlab=""))


## ***** plot graph 2 (plot3.R) *****
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


## ***** plot graph 3 *****
## convert character to numeric
power$Voltage <- as.numeric(power$Voltage)

## plot graph Voltage v. datetime
with(power, 
plot(Datetime, Voltage, 
type="l", 
xlab = "datetime"))


## ***** plot graph 4 *****
## convert character to numeric
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)

## plot graph 2, Global reactive Power
with(power,
plot(Datetime, Global_reactive_power, 
type="l", 
main="", 
xlab="datetime"))


## open png graphics device and create file
dev.copy(png, file = "plot4.png")

## close graphics device
dev.off()
