power<-read.table(file="cour/explo/first proj/household_power_consumption.txt", sep=";",header=TRUE)
power<-subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")
power$full_date<-as.POSIXlt(strptime(paste(power$Date,power$Time,sep=" "),"%d/%m/%Y %H:%M:%S"))
power$Global_active_power<-as.numeric(power$Global_active_power)
power$Global_reactive_power<-as.numeric(power$Global_reactive_power)
power$Voltage<-as.numeric(power$Voltage)
##power$Sub_metering_1<-as.numeric(power$Sub_metering_1)
##power$Sub_metering_2<-as.numeric(power$Sub_metering_2)
##power$Sub_metering_3<-as.numeric(power$Sub_metering_3)


### Date: Date in format dd/mm/yyyy
### Time: time in format hh:mm:ss

#### sub meterings -> plot3

png("plot3.png",width=480,height=480)

plot(x=power$full_date,y=power$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=power$full_date,y=power$Sub_metering_2,type="l",col="red")
lines(x=power$full_date,y=power$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

dev.off()
