## Only Read Data File for 1st and 2nd of Feb 2007. 
DF <- read.table("household_power_consumption.txt",sep=";",na.strings="?",skip=grep("1/2/2007", readLines("household_power_consumption.txt"))-1,nrows=2880)
colnames(DF) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Prepare DateTime Field for plotting

DF$datetime <- strptime(paste(DF$Date, DF$Time), format = "%d/%m/%Y %H:%M:%S")

## 3 - Third Plot, Plot the 3 sub-meters against time and date with different color each
##     and output to png file plot3.png

png(filename = "plot3.png",width = 480, height = 480)
plot(DF$datetime, DF$Sub_metering_1,xlab="",ylab="Energy sub metering", type = "n")
points(DF$datetime, DF$Sub_metering_1,col="black",type = "l")
points(DF$datetime, DF$Sub_metering_2,col="red",type = "l")
points(DF$datetime, DF$Sub_metering_3,col="blue",type = "l")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c('black','red', 'blue'), cex=.75)
dev.off()



