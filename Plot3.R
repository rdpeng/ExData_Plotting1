## Load libraries
library(data.table)
library(dplyr)
## Load data
setClass("myDate")
setAs("character","myDate",function(from)as.Date(from,format="%d/%m/%Y"))
theData<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("myDate","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
## Combine date and time, then add days of week (truncated)
theData<-mutate(theData,dateTime=as.POSIXct(paste(theData$Date,theData$Time),format="%Y-%m-%d %H:%M:%S")) %>%
      mutate(wDay = strtrim(weekdays(theData$Date), 3)) %>%
      select(dateTime, wDay, everything(), -Date, -Time)
## Subset
subData<-filter(theData, wDay == c("Thu", "Fri", "Sat") & dateTime >= as.POSIXct("2007-02-01 00:00:00") & dateTime < as.POSIXct("2007-02-03 00:00:00"))
## Open and format png device
png(file = "Plot3.png", width = 480, height = 480, bg = "transparent")
## Arrange plot
with(subData, plot(dateTime, Sub_metering_1, ylab = "Energy sub metering", xlab="", type="l"))
with(subData, lines(dateTime, Sub_metering_2,col="red"))
with(subData, lines(dateTime, Sub_metering_3,col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lwd=2)
## Close device
dev.off()