library(dplyr)
library(lubridate)
zipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile <- "exdata-data-household-power-consumption.zip"
#download and unzip the file
if (!file.exists(zipFile)) {download.file(zipUrl, zipFile, mode = "wb")}
dataPath <- "./data"
if (!file.exists(dataPath)) {unzip(zipFile)}
a <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";")
a$Date<-as.character(a$Date)
a <- filter(a,a$Date=="1/2/2007" | a$Date=="2/2/2007")
dt <- strptime(paste(a$Date, a$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
a$globalActivePower <- as.numeric(a$Global_active_power)/1000
a$Voltage <- as.numeric(a$Voltage)
a$Global_reactive_power <- as.numeric(a$Global_reactive_power)
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(dt, a$globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(dt, a$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dt, a$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, a$Sub_metering_2, type="l", col="red")
lines(dt, a$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(dt, a$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()

#
#
####
png("plot4.png", width=480, height=480)
plot(dt, a$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, a$Sub_metering_2, type="l", col="red")
lines(dt, a$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
