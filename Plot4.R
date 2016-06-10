#load the file into R
data<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert date
data$Date<- strptime(data$Date, "%d/%m/%Y")

#subset data
subdata<-data[data$Date>="2007-02-01" & data$Date<= "2007-02-02",]

#Plot
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
with(df,{
   	plot(df$Global_active_power, type="l",xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
  	plot(df$Voltage,type="l",xaxt="n",xlab="datetime",ylab="Voltage")
  	plot(df$Sub_metering_1,type="l",ylab="Energy sub metering",xaxt="n")
  	lines(df$Sub_metering_2,type="l",col="red")
  	lines(df$Sub_metering_3,type="l",col="blue")
    legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  	plot(df$Global_reactive_power, type="l",xaxt="n", xlab="datetime", ylab="Global_reactive_power")
 	})
dev.off
