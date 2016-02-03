epc <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
epc$Date <- as.Date(epc$Date,"%d/%m/20%y")
epctemp1 <- subset(epc, Date > as.Date("2007-02-01"))
epctemp1 <- subset(epc, Date > as.Date("2007-01-31"))
epctemp2 <- subset(epctemp1, Date < as.Date("2007-02-03"))
epctemp2$dt <- paste(epctemp2$Date,epctemp2$Time)
epctemp2$dt <- as.POSIXct(epctemp2$dt)
par(mfrow=c(2,2), mar=c(5.1,4.1,4.1,2.1), oma=c(0,0,0,0))

plot(epctemp2$dt,epctemp2$Global_active_power,type="l", main=" ",ylab="Global Active Power (kiloWatts)",xlab=" ")

plot(epctemp2$dt,epctemp2$Voltage,type="l", main=" ",ylab="Voltage",xlab="datetime ")

plot(epctemp2$dt,epctemp2$Sub_metering_1,type="l", main=" ",ylab="Energy Sub Metering",xlab=" ")
lines(epctemp2$dt,epctemp2$Sub_metering_2,type="l", col="red")
lines(epctemp2$dt,epctemp2$Sub_metering_3,type="l", col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=1, col=c("black","red","blue"),cex=0.5, xjust=1, yjust=1,x.intersp=0.2, y.intersp=0.1,inset = 0,bty='n')
       
plot(epctemp2$dt,epctemp2$Global_reactive_power,type="l", main=" ",ylab="Global_reactive_power",xlab="datetime ")


dev.copy(png,'plot4.png')
dev.off()