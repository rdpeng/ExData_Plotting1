data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$dateTime <- as.POSIXct(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
data <- data[(data$dateTime>="2007-02-01") & (data$dateTime < "2007-02-03"),]
png("plot4.png")
par(mfrow=c(2,2))
plot(x=data$dateTime,y=data$Global_active_power,type = "l",xlab="",ylab="Global Active Power(kilowatts)",main="")

plot(x=data$dateTime,y = data$Voltage, type = "l",xlab = "datetime",ylab = "Voltage",main="")

plot(x=data$dateTime, y = data$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering",main = "",col = "black")
points(x=data$dateTime, y = data$Sub_metering_2,type = "l",xlab = "",ylab = "Energy sub metering",main = "",col = "red")
points(x=data$dateTime, y = data$Sub_metering_3,type = "l",xlab = "",ylab = "Energy sub metering",main = "",col = "blue")

plot(x=data$dateTime,y=data$Global_active_power,type = "l",xlab="datetime",ylab="Global_reactive_power",main="")

dev.off()