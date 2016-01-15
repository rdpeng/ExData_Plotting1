
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)
dateTime <- strptime(paste(sub$Date,sub$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
sub1 <- as.numeric(sub$Sub_metering_1)
sub2 <-as.numeric( sub$Sub_metering_2)
sub3 <- as.numeric(sub$Sub_metering_3)
png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(dateTime, sub$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(dateTime, sub$Voltage, type="l", ylab="Voltage")

plot(dateTime,sub1,type="l", ylab = "Energy Submetering", xlab = "")
lines(dateTime,sub2,type = "l",col="red") 
lines(dateTime,sub3,type = "l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

plot(dateTime, sub$Global_reactive_power, type="l", ylab="Global_reactive_power")
dev.off()
