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

## plot1 in png file
png(file="plot1.png")
with(select, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red"))
dev.off()
