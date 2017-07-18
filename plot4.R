setwd("C:/Users/dy/Documents/R")

## load associaed libraries
library(data.table)
library(dplyr)
library(lubridate)

## read data into R
classes<-c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data<-fread("household_power_consumption.txt", header = TRUE, na.strings="?",colClasses = classes)

##select useful data and change data viriables
select<-filter(data, Date=="1/2/2007"| Date=="2/2/2007")
select$Date<-dmy(select$Date)
select<-within(select,{timestamp=format(as.POSIXct(paste(Date,Time)),"%Y%m%d %H:%M:%S")})
select$timestamp<-ymd_hms(select$timestamp)

## plot4 in png file
png(file="plot4.png")
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(select, {
  plot(timestamp, Global_active_power, type="l", xlab="",ylab="Global Active Power")
  plot(timestamp, Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(timestamp, Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
  with(select, lines(timestamp, Sub_metering_2, col="red"))
  with(select, lines(timestamp, Sub_metering_3, col="blue"))
  legend("topright", lty=1, col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
  plot(timestamp, Global_reactive_power,type="l", xlab="datetime")
})
dev.off()
