#Plot 3
library(data.table)
File <- "./household_power_consumption.txt"
Data <- read.table(File, sep = ";", header = TRUE, na.strings = "?", 
                   colclasses = c("character", "character", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric", "numeric", "numeric"))
subdata <- subset(Data, Data$Date == "1/2/2007" | Data$Date == "2/2/2007")
Datadatetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(Datadatetime, subdata$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(Datadatetime, subdata$Sub_metering_2, type="l", col="red")
lines(Datadatetime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright",
       lty=1, cex = 0.7,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"))
dev.off()