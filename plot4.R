setwd("C:/Users/dec260/Desktop/Coursera/ExData_Plotting1/Data")

EnergyData = read.table("household_power_consumption.txt", sep=";", header=TRUE)
EnergyData$Date = as.Date(EnergyData$Date, format="%d/%m/%Y")
FebEnergyData = subset(EnergyData, Date == as.Date("2007-02-01", "%Y-%m-%d") | Date == as.Date("2007-02-02", "%Y-%m-%d"))
rm(EnergyData)

FebEnergyData$DateTime = strptime(paste(as.character(FebEnergyData$Date), as.character(FebEnergyData$Time)), format="%Y-%m-%d %H:%M:%S")
FebEnergyData$Global_active_power = as.numeric(as.character(FebEnergyData$Global_active_power))
FebEnergyData$Global_reactive_power = as.numeric(as.character(FebEnergyData$Global_reactive_power))
FebEnergyData$Voltage = as.numeric(as.character(FebEnergyData$Voltage))
FebEnergyData$Sub_metering_1 = as.numeric(as.character(FebEnergyData$Sub_metering_1))
FebEnergyData$Sub_metering_2 = as.numeric(as.character(FebEnergyData$Sub_metering_2))
FebEnergyData$Sub_metering_3 = as.numeric(as.character(FebEnergyData$Sub_metering_3))

#Output charts
png(filename = "plot4.png", width=480, height=480)

par(mfrow=c(2, 2))

#Chart 1
with(FebEnergyData, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power", xlab=""))

#Chart 2
with(FebEnergyData, plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime"))

#Chart 3
with(FebEnergyData, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(FebEnergyData, lines(DateTime, Sub_metering_2, type="l", col="red"))
with(FebEnergyData, lines(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n")

#Chart 4
with(FebEnergyData, plot(DateTime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime"))

dev.off()