
#load prepared data
source('preparedData.r')

#plot4
png("Plots/Plot4.png")
par(mfrow=c(2,2))
plot(Power.Subset$Time,Power.Subset$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")
plot(Power.Subset$Time,Power.Subset$Voltage,ylab="Voltage",type="l",xlab="datetime")
plot(Power.Subset$Time,Power.Subset$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
plot.xy(xy.coords(Power.Subset$Time,Power.Subset$Sub_metering_2),type="l",col="red")
plot.xy(xy.coords(Power.Subset$Time,Power.Subset$Sub_metering_3),type="l",col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
plot(Power.Subset$Time,Power.Subset$Global_reactive_power, ylab="Global_reactive_power",type="l",xlab="datetime")
dev.off()
