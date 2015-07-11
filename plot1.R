###make table using household file
powerF<-read.csv("household_power_consumption.txt",sep=";",header=T,na.strings="?")
power<-powerF[which(powerF$Date=="1/2/2007"|powerF$Date=="2/2/2007"),]

### plot 1.
png("plot1.png",width=480,height=480)
hist(power$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(killowatts)")
dev.off()
