
#created by Jeremy Chad Hess for Coursera Data Science Specialization Course 4, Project 1

data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,colClasses=c("character", "character", rep("numeric",7)),sep=";",na="?")

HHP <- subset(data,Date == '2/2/2007' | Date == '1/2/2007')

HHP$DateTime <- strptime(paste(HHP$Date, HHP$Time), "%d/%m/%Y %H:%M:%S")

rm(data)

library(datasets)

png("plot4.png", width=400, height=400)

par(mfrow=c(2,2))

# First Chart
plot(HHP$DateTime, HHP$Global_active_power,type="l",xlab="",ylab="Global Active Power")

# Second Chart
plot(HHP$DateTime, HHP$Voltage, type="l",xlab="datetime", ylab="Voltage")

# Third Chart
plot(HHP$DateTime, HHP$Sub_metering_1, type="n", xlab="",ylab="Energy sub metering")
points(HHP$DateTime, HHP$Sub_metering_1, type="l", col="black")
points(HHP$DateTime, HHP$Sub_metering_2, type="l", col="red")
points(HHP$DateTime, HHP$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Fourth Chart
plot(HHP$DateTime, HHP$Global_reactive_power, type="n",xlab="datetime", ylab="Global_reactive_power")
lines(HHP$DateTime, HHP$Global_reactive_power)

dev.off()

