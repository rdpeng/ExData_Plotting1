# Load & Subset Data

powpath<- "E:/1Rdata/household_power_consumption.txt"
powdat<- read.table(powpath,header=T,sep = ";",na.strings = "?",stringsAsFactors=FALSE)
chartdata <- subset(powdat,powdat$Date == "1/2/2007" | powdat$Date == "2/2/2007" )

# convert and create data series

datetime <- strptime(paste(chartdata$Date, chartdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(chartdata$Global_active_power)
globalReactivePower <- as.numeric(chartdata$Global_reactive_power)
voltage <- as.numeric(chartdata$Voltage)
subMetering1 <- as.numeric(chartdata$Sub_metering_1)
subMetering2 <- as.numeric(chartdata$Sub_metering_2)
subMetering3 <- as.numeric(chartdata$Sub_metering_3)

# Create Plot and Genrate png file

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()



