consumption <- read.table("C:\\Users\\Saikiran Reddy\\Desktop\\household_power_consumption.txt", header=T, sep=";")  
power2 <- subset(consumption, Date=="1/2/2007" | Date =="2/2/2007")

power3<-transform(power2,Global_active_power=as.numeric(Global_active_power))
power3<-transform(power2,Global_reactive_power=as.numeric(Global_reactive_power))
power3<-transform(power2,Voltage=as.numeric(Voltage))
power3<-transform(power2,Sub_metering_1=as.numeric(Sub_metering_1))
power3<-transform(power2,Sub_metering_2=as.numeric(Sub_metering_2))
power3<-transform(power2,Sub_metering_3=as.numeric(Sub_metering_3))
power3$day <- as.POSIXct(strptime(paste(power3$Date,power3$Time), " %d/%m/%Y %H:%M:%S", tz="EST"))
png(filename="Plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(power3$day, power3$Global_active_power, type="l", ylab ="Global Active Power (kilowatts)")

plot(power3$day, power3$Voltage, type="l",xlab="datetime", ylab ="Voltage")
plot(power3$day,power3$Sub_metering_1,xlab="", ylab="Energy sub metering", type= "n")
lines(power3$day, power3$Sub_metering_1, type="l", col="black")
lines(power3$day, power3$Sub_metering_2, type="l", col="red")
lines(power3$day, power3$Sub_metering_3, type="l", col="blue")

legend("topright",lty=1, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="c")

plot(power3$day, power3$Global_reactive_power, type="l",xlab="datetime", ylab ="Global_reactive_power")
dev.off() 
