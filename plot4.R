power <- read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?")
sub<-power[(power$Date=="1/2/2007"|power$Date=="2/2/2007"),]
concat = paste(sub$Date,sub$Time,sep=" ")
converttotime = strptime(concat, "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2),mar=c(4,4,2,2))
with(sub,{
        plot(converttotime,sub$Global_active_power,type="l",ylab="Global Active Power", xlab="")
        plot(converttotime,sub$Voltage,type="l",ylab="Voltage",xlab="datetime")
        plot(converttotime,sub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
        lines(converttotime,sub$Sub_metering_2,col="red")
        lines(converttotime,sub$Sub_metering_3,col="blue")
        legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty=1, col = c("black","red","blue"))
        plot(converttotime,sub$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
})