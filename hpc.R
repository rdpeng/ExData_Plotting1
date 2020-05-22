hpc <- read.table("household_power_consumption.txt", sep=";")
subsethpc <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")

#1st plot
hist(as.numeric(subsethpc$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#2nd plot
subsethpc$Date <- as.Date(subsethpc$Date, format="%d/%m/%Y")
subsethpc$Time <- strptime(subsethpc$Time, format="%H:%M:%S")
subsethpc[1:1440,"Time"] <- format(subsethpc[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsethpc[1441:2880,"Time"] <- format(subsethpc[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
plot(subsethpc$Time, subsethpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", main="Global Active Power vs Time")

#3rd plot
plot(subsethpc$Time, subsethpc$Sub_metering_1, type="n", xlab="", ylab="Energy sub-metering")
with(subsethpc, lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subsethpc, lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subsethpc, lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#4th plot
par(mfrow=c(2,2))
with(subsethpc, {
  
  plot(subsethpc$Time, subsethpc$Global_active_power, ylab="Global Active Power", xlab="", type="l")
 
  plot(subsethpc$Time, subsethpc$Voltage, xlab="datetime", ylab="Voltage", type="l")
  
  plot(subsethpc$Time, subsethpc$Sub_metering_1, type="n", xlab="", ylab="Energy sub-metering")
  with(subsethpc, lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subsethpc, lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subsethpc, lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.6)
  
  plot(subsethpc$Time, subsethpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global Active Power (kilowatts)")  
  
})