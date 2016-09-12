## Load libraries
library(data.table)
library(dplyr)
## Load data
setClass("myDate")
setAs("character","myDate",function(from)as.Date(from,format="%d/%m/%Y"))
theData<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("myDate","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
subData<-filter(theData, Date >= as.Date("2007-02-01"), Date < as.Date("2007-02-03"))
## Begin exploratory analysis below
png(file = "Plot1.png", width = 480, height = 480, bg = "white")
hist(subData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()