fileUrl <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip'
download.file(fileUrl, destfile ="./HouseholdPower")
unzip("./HouseholdPower")
HHPower <-read.table(unzip("./HouseholdPower"), header = TRUE, sep = ";")
head(HHPower)
str(HHPower)
HHPower <- subset(HHPower, Date == "2/1/2007" | Date == "2/2/2007")
HHPower[, c(3:9)] <- sapply(HHPower[, c(3:9)], as.character)
HHPower[, c(3:9)] <- sapply(HHPower[, c(3:9)], as.numeric)
HHPower$Date <-as.Date(HHPower$Date, format = "%m/%d/%Y")
HHPower <- transform(HHPower, timestamp=as.POSIXct(paste(Date, Time)), "%m/%d/%Y %H:%M:%S")
jpeg('rplot4.jpg', width= 480, height = 480)
par(mfrow = c(2,2))
#plot 1
plot(HHPower$timestamp, HHPower$Global_active_power, type="l", ylim = c(0,6), xlab="", ylab="Global Active Power")
#plot 2
plot(HHPower$timestamp, HHPower$Voltage, type ="l", ylim = c(234,246), 
     xlab = "datetime", ylab = "Voltage")
#plot 3
with(HHPower,plot(timestamp, Sub_metering_1, type="l", ylim = c(0,30), xlab="", ylab="Energy Sub metering"))
lines(HHPower$timestamp,HHPower$Sub_metering_2,col="red")
lines(HHPower$timestamp,HHPower$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),bty = "n", lty=c(1,1), lwd=c(1,1))
#plot 4
plot(HHPower$timestamp, HHPower$Global_reactive_power, type = "l",
     ylim = c(0,0.5), xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
