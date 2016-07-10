#setwd("C://Users//hafezasg//Desktop//DataScientist//Exploratory Data//Week1")

#---Download File
setInternet2(TRUE) 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
data=read.table(unzip("household_power_consumption.zip"),sep = ";", header = FALSE, skip =1)
names(data) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dataSub=subset(data,data$Date =="1/2/2007" | data$Date == "2/2/2007")

#---Provide required variables
dataSub$Global_active_power=as.numeric(as.character(dataSub$Global_active_power))

#---plot 1
library(datasets)

hist(dataSub$Global_active_power, main = "Global Active Power", col ="red", xlab = "Global Active Power (kilowatts)" )
dev.copy(png, file ="plot1.png",width=480, height=480)
dev.off()
