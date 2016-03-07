## Only Read Data File for 1st and 2nd of Feb 2007. 
DF <- read.table("household_power_consumption.txt",sep=";",na.strings="?",skip=grep("1/2/2007", readLines("household_power_consumption.txt"))-1,nrows=2880)
colnames(DF) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Prepare DateTime Field for plotting

DF$datetime <- strptime(paste(DF$Date, DF$Time), format = "%d/%m/%Y %H:%M:%S")

## 4 - Fourth Plot, Plot the 4 different plots 2 X 2 plots
##     and output to png file plot4.png

png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2,2) ) 
plot(DF$datetime, DF$Global_active_power,xlab="",ylab="Global Active Power (Kilowatts)", type = "l")
plot(DF$datetime, DF$Voltage,xlab="datetime",ylab="Voltage", type = "l")
plot(DF$datetime, DF$Sub_metering_1,xlab="",ylab="Energy sub metering", type = "n")
points(DF$datetime, DF$Sub_metering_1,col="black",type = "l")
points(DF$datetime, DF$Sub_metering_2,col="red",type = "l")
points(DF$datetime, DF$Sub_metering_3,col="blue",type = "l")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c('black','red', 'blue'), cex=.75,bty='n')
plot(DF$datetime, DF$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power", type = "l")
dev.off()
