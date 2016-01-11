#Create subset of data for given date
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 2075259)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
filtered <- subset(data, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

#Format time 
filtered$Time <- paste(as.character(filtered$Date), as.character(filtered$Time), sep=" ")
filtered$Time <- strptime(filtered$Time, format="%Y-%m-%d %H:%M")

#Create plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#First plot
plot(filtered$Time, filtered$Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xlab="")
#Second plot
plot(filtered$Time, filtered$Voltage, ylab="Voltage", type="l", xlab="datetime")
#Third plot
plot(filtered$Time, filtered$Sub_metering_1, ylab="Energy sub metering", type="l", xlab="", col="black") 
lines(filtered$Time, filtered$Sub_metering_2, col="red")
lines(filtered$Time, filtered$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))
plot(filtered$Time, filtered$Global_reactive_power, ylab="Global_reactive_power", type="l", xlab="datetime")
#Forth plot

dev.off()