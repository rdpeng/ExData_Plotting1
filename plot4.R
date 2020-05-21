setwd("/Users/josephlamps/Downloads")

hpc <- read.table("household_power_consumption.txt", sep=";")
subsethpc <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")

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