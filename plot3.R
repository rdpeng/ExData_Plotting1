#Read text document and create a table
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Create correct variables
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
date <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#PLOT3
png("plot3.png", width=480, height=480)
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)
plot(date, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(date, Sub_metering_2, type="l", col="red")
lines(date, Sub_metering_3, type="l", col="blue")
legend( "topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2.5,col=c("black","red","blue"))
dev.off()