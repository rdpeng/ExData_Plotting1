
#created by Jeremy Chad Hess for Coursera Data Science Specialization Course 4, Project 1

data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,colClasses=c("character", "character", rep("numeric",7)),sep=";",na="?")

HHP <- subset(data,Date == '2/2/2007' | Date == '1/2/2007')

HHP$DateTime <- strptime(paste(HHP$Date, HHP$Time), "%d/%m/%Y %H:%M:%S")

rm(data)

library(datasets)

png("plot2.png", width=400, height=400)

plot(HHP$DateTime, HHP$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
