data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
data$Global_ative_power <- as.numeric(data$Global_active_power)
data$dateTime <- as.POSIXct(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
data <- data[(data$dateTime>="2007-02-01") & (data$dateTime < "2007-02-03"),]
png("plot3.png")
plot(x=data$dateTime, y = data$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering",main = "",col = "black")
points(x=data$dateTime, y = data$Sub_metering_2,type = "l",xlab = "",ylab = "Energy sub metering",main = "",col = "red")
points(x=data$dateTime, y = data$Sub_metering_3,type = "l",xlab = "",ylab = "Energy sub metering",main = "",col = "blue")
dev.off()