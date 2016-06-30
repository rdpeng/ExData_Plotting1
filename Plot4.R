#load the file into R
data<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert date
data$Date<- strptime(data$Date, "%d/%m/%Y")

#subset data
subdata<-data[data$Date>="2007-02-01" & data$Date<= "2007-02-02",]

#Convert date in subset data
subdata$datetime <- paste(subdata$Date, subdata$Time, sep = " ")
subdata$datetime<-as.POSIXlt(subdata$datetime)

#Plot
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
#(1)
plot(y= subdata$Global_active_power, x=subdata$datetime, type="l", xlab="", ylab="Global Active Power")
#(2)
plot(y= subdata$Voltage, x=subdata$datetime, type="l", xlab="datetime", ylab="Voltage")
#(3)
plot(x=subdata$datetime, y=subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x=subdata$datetime,y=subdata$Sub_metering_2,type="l",col="red")
lines(x=subdata$datetime,y=subdata$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
#(4)
plot(y= subdata$Global_reactive_power, x=subdata$datetime, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
