#Set your working directory
setwd("C:/Coursera - Data Science/4-ExploratoryDataAnalysis/CourseProject1")

## 1.Getting data
fileURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFilename <-"HouseholdPowerConsuption.zip"
download.file(fileURL, destfile = zipFilename)
unzip(zipfile = zipFilename)

## 2.Reading data
# sqldf package is required
library(sqldf)
SQL<-"SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
Data <- read.csv.sql("household_power_consumption.txt", sql=SQL, sep=";")
Data$DateTime <- as.POSIXct(strptime(paste(Data$Date,Data$Time), "%d/%m/%Y %H:%M:%S"))

## 3.Setting locale to provide english day names
Sys.setlocale("LC_ALL","English")

## 4.Generate PNG file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
#Global Active Power graph
plot(Data$DateTime, Data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
#Voltage graph
plot(Data$DateTime, Data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
#Energy sub metering graph
plot(Data$DateTime, Data$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '')
      points(Data$DateTime, Data$Sub_metering_2, type = 'l', col = 'red')
      points(Data$DateTime, Data$Sub_metering_3, type = 'l', col= 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = c(1, 1, 1), bty = "n")
#
plot(Data$DateTime, Data$Global_reactive_power , xlab = "datetime", ylab = "Global_Reactive_Power", type = "l")
dev.off()