setwd("~/Desktop/BigData_Cousera")
library(graphics)
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
##subsetting the data
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subData$Global_active_power)
##convert dates
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)
##plot3
with(subData, {
    plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
    lines(datetime, subMetering2, type="l", col="red")
    lines(datetime, subMetering3, type="l", col="blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
