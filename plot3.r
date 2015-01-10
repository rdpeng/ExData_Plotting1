## Exploratory Data Analysis  -  Donald J Reilly
## Course Project 1 - Electric Power Consumption
## Plot 3 - 
##
setwd("C:/Users/DJR/My Documents/Coursera R/Exploratory Data Analysis/Course Project 1")
column.names <- c("Date", "Time", "GAP", "GRP", "Voltage", "GI", "SM1", "SM2", "SM3")
column.Classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
EPC_DF <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
           col.names=column.names, colClasses=column.Classes, stringsAsFactors=FALSE)
EPC_DF <- subset(EPC_DF, Date == "1/2/2007" | Date == "2/2/2007")
EPC_DF$DTstamp <- as.POSIXct(paste(EPC_DF$Date, EPC_DF$Time), "%d/%m/%Y %H:%M:%S", tz="") 
png(filename="plot3.png", width=480, height=480, units="px")
plot(EPC_DF$DTstamp, EPC_DF$SM1, type="l", ylab="Energy sub metering", xlab=" ")
lines(EPC_DF$DTstamp, EPC_DF$SM2, col="red", type="l", lwd=2)
lines(EPC_DF$DTstamp, EPC_DF$SM3, col="blue", type="l", lwd=2)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()
