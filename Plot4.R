#Read in the file
hpc<-read.table("household_power_consumption.txt", header=TRUE,sep=";",na.strings="?")

#Subset the data with Date of "2007-02-01" & "2007-02-02"
hpc_sub<-subset(hpc,Date == '2/2/2007'|Date == '1/2/2007')

#Concatenate Date and Time
hpc_sub$Datetime <- strptime(paste(hpc_sub$Date, hpc_sub$Time, sep=" "), format=（"%d/%m/%Y %H:%M:%S"))

#Create Plot4 and Output PNG File
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2),mar=c(5,4,2,1))
plot(hpc_sub$Datetime,hpc_sub$Global_active_power, type="l", xlab="",ylab="Global Active Power")
plot(hpc_sub$Datetime,hpc_sub$Voltage, type="l", xlab="datetime",ylab="Voltage")
plot(hpc_sub$Datetime, hpc_sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="black")
lines(hpc_sub$Datetime, hpc_sub$Sub_metering_2, type="l", col="red")
lines(hpc_sub$Datetime, hpc_sub$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
plot(hpc_sub$Datetime,hpc_sub$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")
dev.off()
