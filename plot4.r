power<-read.table(file="cour/explo/first proj/household_power_consumption.txt", sep=";",header=TRUE)
power<-subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")
power$full_date<-as.POSIXlt(strptime(paste(power$Date,power$Time,sep=" "),"%d/%m/%Y %H:%M:%S"))
power$Global_active_power<-as.numeric(power$Global_active_power)
power$Global_reactive_power<-as.numeric(power$Global_reactive_power)
power$Voltage<-as.numeric(power$Voltage)


### Date: Date in format dd/mm/yyyy
### Time: time in format hh:mm:ss

#### variado -> plot4

png("plot4.png",width=480,height=480)

par(mfrow=c(2,2),cex=0.7)

plot(x=power$full_date,y=power$Global_active_power,type="l",ylab="Global Active Power",xlab=NA)

plot(x=power$full_date,y=power$Voltage,type="l",ylab="Voltage",xlab=NA)

plot(x=power$full_date,y=power$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA)
lines(x=power$full_date,y=power$Sub_metering_2,type="l",col="red")
lines(x=power$full_date,y=power$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")

plot(x=power$full_date,y=power$Global_reactive_power,type="l",ylab="Global Reactive Power",xlab=NA)

dev.off()
