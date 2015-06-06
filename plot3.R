power <- read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?")
sub<-power[(power$Date=="1/2/2007"|power$Date=="2/2/2007"),]
concat = paste(sub$Date,sub$Time,sep=" ")
converttotime = strptime(concat, "%d/%m/%Y %H:%M:%S")
plot(converttotime,sub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(converttotime,sub$Sub_metering_2,col="red")
lines(converttotime,sub$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, col = c("black","red","blue"))