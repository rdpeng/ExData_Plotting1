####Plot 4
house <- read.table("household_power_consumption.txt", header=T, sep=";")  
house1 <- subset(house, Date=="1/2/2007" | Date =="2/2/2007")
house1$Sub_metering_1 <- as.numeric(as.character(house1$Sub_metering_1))
house1$Sub_metering_2 <- as.numeric(as.character(house1$Sub_metering_2))
house1$Sub_metering_3 <- as.numeric(as.character(house1$Sub_metering_3))
house1$day <- as.POSIXct(strptime(paste(house1$Date,house1$Time), " %d/%m/%Y %H:%M:%S", tz="EST"))
house1$Global_active_power <- as.numeric(as.character(house1$Global_active_power))
house1$Global_reactive_power <- as.numeric(as.character(house1$Global_reactive_power))
house1$Voltage <- as.numeric(as.character(house1$Voltage))
png(filename="Plot4.png",width=480,height=480)
par(mfrow=c(2,2))
#Plot1
plot(house1$day, house1$Global_active_power, type="l", ylab ="Global Active Power (kilowatts)")

#Plot2
plot(house1$day, house1$Voltage, type="l",xlab="datetime", ylab ="Voltage")
#Plot 3
plot(house1$day,house1$Sub_metering_1,xlab="", ylab="Energy sub metering", type= "n")
lines(house1$day, house1$Sub_metering_1, type="l", col="black")
lines(house1$day, house1$Sub_metering_2, type="l", col="red")
lines(house1$day, house1$Sub_metering_3, type="l", col="blue")

legend("topright",lty=1, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

#Plot4
plot(house1$day, house1$Global_reactive_power, type="l",xlab="datetime", ylab ="Global_reactive_power")
dev.off()