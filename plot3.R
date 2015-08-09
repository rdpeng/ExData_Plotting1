
#created by Jeremy Chad Hess for Coursera Data Science Specialization Course 4, Project 1

data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,colClasses=c("character", "character", rep("numeric",7)),sep=";",na="?")

HHP <- subset(data,Date == '2/2/2007' | Date == '1/2/2007')

HHP$DateTime <- strptime(paste(HHP$Date, HHP$Time), "%d/%m/%Y %H:%M:%S")

rm(data)

library(datasets)

png("plot3.png", width=400, height=400)

plot(HHP$DateTime, HHP$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(HHP$DateTime, HHP$Sub_metering_2, col="red")
lines(HHP$DateTime, HHP$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)

dev.off()
