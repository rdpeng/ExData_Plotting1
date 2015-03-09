# Coursera - Exploratory Data Analysis - Assignment #1
# Hao Zhu

setwd("C:/Users/Hao/Dropbox/Coursera/Exploratory Data Analysis/")
dt_raw<-read.table("Data/household_power_consumption.txt", sep=";", header=T)
# Select dates from 2007-02-01 to 2007-02-01
dt<-dt_raw[as.Date(dt_raw$Date, "%d/%m/%Y")== "2007-02-01" | as.Date(dt_raw$Date, "%d/%m/%Y")== "2007-02-02",]
# Change ? to NA
dt[dt=="?"]=NA

names(dt)
dt$Global_active_power<-as.numeric(as.character(dt$Global_active_power))
dt$Global_reactive_power<-as.numeric(as.character(dt$Global_reactive_power))
dt$Voltage<-as.numeric(as.character(dt$Voltage))
dt$Global_intensity<-as.numeric(as.character(dt$Global_intensity))
dt$Sub_metering_1<-as.numeric(as.character(dt$Sub_metering_1))
dt$Sub_metering_2<-as.numeric(as.character(dt$Sub_metering_2))
dt$Sub_metering_3<-as.numeric(as.character(dt$Sub_metering_3))

png(file="ExData_Plotting1/plot1.png", width=480, height=480)
hist(dt$Global_active_power, col="red", breaks=12, xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
