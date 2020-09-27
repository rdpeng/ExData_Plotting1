#Plot 4
library(data.table)
File <- "./household_power_consumption.txt"
Data <- read.table(File, sep = ";", header = TRUE, na.strings = "?", 
                   colclasses = c("character", "character", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric", "numeric", "numeric"))
subdata <- subset(Data, Data$Date == "1/2/2007" | Data$Date == "2/2/2007")
Datadatetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(5, 4, 2, 2))
plot(Datadatetime, subdata$Global_active_power, type="l", 
     xlab = "", ylab = "Global Active Power")
plot(Datadatetime, subdata$Voltage, type = "l", xlab = "Datatime", ylab = "Voltage")
plot(Datadatetime, subdata$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(Datadatetime, subdata$Sub_metering_2, type="l", col="red")
lines(Datadatetime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright",
       lty=1, cex = 0.3, box.lty = 0,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"))
plot(Datadatetime, subdata$Global_reactive_power, type = "l", 
     xlab = "Datatime", ylab = "Global_reactive_voltage")
dev.off()