
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "Household_Power.zip")
unzip("Household_Power.zip")

hpc_raw<-read.csv2("household_power_consumption.txt")
hpc<-hpc_raw
hpc$DateTime<-paste(hpc_raw$Time, hpc_raw$Date)
hpc$DateTime<-strptime(hpc$DateTime, format = "%H:%M:%S %d/%m/%Y")
hpc_sub<-subset(hpc, strptime("00:00:00 01/02/2007", format = "%H:%M:%S %d/%m/%Y") <= DateTime & 
                  DateTime < strptime("00:00:00 03/02/2007", format = "%H:%M:%S %d/%m/%Y"))


hpc_sub$Global_active_power<-as.numeric(hpc_sub$Global_active_power, na.rm=TRUE)


png(file="Plot4.png")
par(mfcol=c(2,2))
par(pty="s") ##square graph

plot(hpc_sub$DateTime, hpc_sub$Global_active_power, col="black", xlab="", ylab="Global Active Power", "n")
lines(hpc_sub$DateTime, hpc_sub$Global_active_power)

plot(hpc_sub$DateTime, hpc_sub$Voltage, col="black", "n")
lines(hpc_sub$DateTime, hpc_sub$Voltage)

plot(hpc_sub$DateTime, hpc_sub$Sub_metering_1, col="black", xlab="", ylab="Energy sub metering", "n")
lines(hpc_sub$DateTime, hpc_sub$Sub_metering_1, col="black")
lines(hpc_sub$DateTime, hpc_sub$Sub_metering_2, col="red")
lines(hpc_sub$DateTime, hpc_sub$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(hpc_sub$DateTime, hpc_sub$Global_reactive_power, col="black", "n")
lines(hpc_sub$DateTime, hpc_sub$Global_reactive_power)
dev.off()