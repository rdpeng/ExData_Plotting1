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
a$Sub_metering_1 <- as.numeric(a$Sub_metering_1)
a$Sub_metering_2 <- as.numeric(a$Sub_metering_2)
a$Sub_metering_3 <- as.numeric(a$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(dt, a$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, a$Sub_metering_2, type="l", col="red")
lines(dt, a$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
