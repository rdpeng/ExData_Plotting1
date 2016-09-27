#start same as plot1
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#pull out subset of data
subset_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# Switching Data
date_time <- strptime(paste(subset_data$Date, subset_Data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
#submeter
sub_metering_1 <- as.numeric(subset_Data$Sub_metering_1)
sub_metering_2 <- as.numeric(subset_Data$Sub_metering_2)
sub_metering_3 <- as.numeric(subset_Data$Sub_metering_3)
#get variables
voltage<- as.numeric(subset_Data$Voltage)
reactive<- as.numeric(subset_Data$Global_reactive_power)
power<- as.numeric(subset_Data$Global_active_power)
#make graphs
par(mfrow = c(2, 2)) 

plot(date_time, power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_time, voltage, type="l", xlab="date_time", ylab="Voltage")

plot(date_time, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, reactive, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off() 