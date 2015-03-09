# Coursera - Exploratory Data Analysis - Assignment #1
# Hao Zhu

setwd("C:/Users/Hao/Dropbox/Coursera/Exploratory Data Analysis/")
dt_raw<-read.table("Data/household_power_consumption.txt", sep=";", header=T)
# Select dates from 2007-02-01 to 2007-02-01
dt<-dt_raw[as.Date(dt_raw$Date, "%d/%m/%Y")== "2007-02-01" | as.Date(dt_raw$Date, "%d/%m/%Y")== "2007-02-02",]
# Change ? to NA
dt[dt=="?"]=NA

#numeric all the variables
dt$Global_active_power<-as.numeric(as.character(dt$Global_active_power))
dt$Global_reactive_power<-as.numeric(as.character(dt$Global_reactive_power))
dt$Voltage<-as.numeric(as.character(dt$Voltage))
dt$Global_intensity<-as.numeric(as.character(dt$Global_intensity))
dt$Sub_metering_1<-as.numeric(as.character(dt$Sub_metering_1))
dt$Sub_metering_2<-as.numeric(as.character(dt$Sub_metering_2))
dt$Sub_metering_3<-as.numeric(as.character(dt$Sub_metering_3))

#Combine Date and Time
dt$date.and.time<-strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")

png(file="ExData_Plotting1/plot4.png", width=480, height=480)
par(mfrow =  c(2,2))
# 1, 1
plot(dt$date.and.time, dt$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(dt$date.and.time, dt$Global_active_power, col="black")
# 1, 2
plot(dt$date.and.time, dt$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(dt$date.and.time, dt$Voltage, col="black")
# 2, 1
plot(dt$date.and.time, dt$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(dt$date.and.time, dt$Sub_metering_1, col="black")
lines(dt$date.and.time, dt$Sub_metering_2, col="red")
lines(dt$date.and.time, dt$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue") )
# 2, 2
plot(dt$date.and.time, dt$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(dt$date.and.time, dt$Global_reactive_power, col="black")
dev.off()
