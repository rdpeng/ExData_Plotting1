#load data and narrow it down to 2 days in question
dataFile <- "~/JHU Data Science/ExData_Plotting1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#organizing data
timestamp <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#create 2x2 png plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

#plot data
plot(timestamp, globalActivePower, type ="l", xlab="", ylab="Global Active Power")

plot(timestamp, voltage, type="l", xlab="datetime", ylab = "Voltage")

plot(timestamp, subMetering1, type ="l", xlab="", ylab="Energy sub metering")
lines(timestamp, subMetering2, type = "l", col = "red")
lines(timestamp, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=1, col=c("black","red","blue"))

plot(timestamp, globalReactivePower, xlab="timestamp", ylab="Global_reactive_power", type = "l")

dev.off()
