setwd("/Users/macbookpro/Documents/Data Science/Exploratory Data Analysis/Project 1/ExData_Plotting1/figure/")

datos <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")
library(lubridate)
datos_feb <- datos[datos$Date=='1/2/2007'|datos$Date=='2/2/2007',]
datos_feb$DateTime <- dmy(datos_feb$Date)+hms(datos_feb$Time)
datos_feb$DateTime <- as.POSIXlt(datos_feb$DateTime)
## open file device plot3.png
png(filename="plot4.png", width=480,height=480,units="px")


## Sets Multiple Base plots 2x2
par(mfrow=c(2,2))

## plots required graphs and annotates them
## Topleft graphic
plot(datos_feb$DateTime,datos_feb$Global_active_power, xlab="", ylab="Global Active Power", type="l")
## Topright graphic
plot(datos_feb$DateTime,datos_feb$Voltage, xlab="Datetime", ylab="Voltage", type="l")

## Bottomleft graphic
plot(datos_feb$DateTime,datos_feb$Sub_metering_1, col="black", xlab="", ylab="Energy sub metering",type="l")
lines(datos_feb$DateTime,datos_feb$Sub_metering_2, col="red")
lines(datos_feb$DateTime,datos_feb$Sub_metering_3, col="blue")
legend("topright",lty= 1, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Bottomright graphic

plot(datos_feb$DateTime,datos_feb$Global_reactive_power, xlab="Datetime", ylab="Global Reactive Power", type="l")

## close file device

dev.off()
