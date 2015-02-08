AllData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

SubData <- subset(AllData, AllData$Date == "1/2/2007" | AllData$Date == "2/2/2007")

dateTime  <- as.POSIXlt(paste(as.Date(SubData$Date, format="%d/%m/%Y"), SubData$Time, sep=" "))


png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",  res = NA)

par(mfrow=c(2,2))

plot(dateTime, SubData$Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)")

plot(dateTime, SubData$Voltage, type="l", ylab="Voltage")

plot(dateTime, SubData$Sub_metering_1, type="n", xlab=NA, ylab="Energy sub metering")
lines(dateTime, SubData$Sub_metering_1, col = "black")
lines(dateTime, SubData$Sub_metering_2, col = "red")
lines(dateTime, SubData$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), text.font=2,cex=0.50, col=c("black","red","blue") )

plot(dateTime, SubData$Global_reactive_power, type="l", ylab="Global_reactive_power")

dev.off()
