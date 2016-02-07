data <- "household_power_consumption.txt"
alldata <- read.table(data, header=TRUE, sep=";", dec = ".")
df <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"), ]



datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))


plot(datetime, as.numeric(df$Global_active_power),type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
plot(datetime, as.numeric(df$Voltage), type="l", xlab="datetime", ylab="Voltage")
plot(datetime, as.numeric(df$Sub_metering_1),col = "black", type="l",xlab = "", ylab = "Energy Sub Metering")
lines(datetime, as.numeric(df$Sub_metering_2), col="red", type = "l")
lines(datetime, as.numeric(df$Sub_metering_3), col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"), bty = "n")  
plot(datetime, as.numeric(df$Global_reactive_power), type = "l", xlab = "datetime", ylab="Global_reactive_power")
dev.off()