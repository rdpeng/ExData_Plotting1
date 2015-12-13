setwd("~/Desktop/BigData_Cousera")
library(graphics)
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
##subsetting the data
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subData$Global_active_power)
globalReactivePower <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)

##convert dates
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with (subData, { 
    plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
    
    plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
    
    plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
    lines(datetime, subMetering2, type="l", col="red")
    lines(datetime, subMetering3, type="l", col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), bty="n")
    
    plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
})

##saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
