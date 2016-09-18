source("data.R")
png("plot4.png")
par(mfrow=c(2,2))

plot(target.house$Global_active_power,ylab="Global Active Power",xlab="",type="l",xaxt="n")
axis(side=1,at=c(1,nrow(target.house)/2,nrow(target.house)),labels = c("Thu","Fri","Sat"))

plot(target.house$Voltage,ylab="Vollage",xlab="datetime",type="l",xaxt="n")
axis(side=1,at=c(1,nrow(target.house)/2,nrow(target.house)),labels = c("Thu","Fri","Sat"))

plot(target.house$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l",xaxt="n")
lines(target.house$Sub_metering_2,col="orange")
lines(target.house$Sub_metering_3,col="blue")
axis(side=1,at=c(1,nrow(target.house)/2,nrow(target.house)),labels = c("Thu","Fri","Sat"))
legend("topright",lty=1,bty="n",col=c("black","orange","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(target.house$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l",xaxt="n")
axis(side=1,at=c(1,nrow(target.house)/2,nrow(target.house)),labels = c("Thu","Fri","Sat"))
dev.off()
