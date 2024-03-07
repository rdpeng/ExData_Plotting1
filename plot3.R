#load file
epc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
epc <- subset(epc, as.Date(epc$Date, format = "%d/%m/%Y") >= as.Date('2007-02-01') & as.Date(epc$Date, format = '%d/%m/%Y') <= as.Date('2007-02-02'))
epc$DateTime <- strptime(paste(epc$Date, epc$Time), format = "%d/%m/%Y %H:%M:%S")
epc$Time <- strptime(paste(epc$Date, epc$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#plot 3
png(filename = "plot3.png", height = 480, width = 480)
with(epc, plot(type = 'n',DateTime, Sub_metering_1, xaxt = "n", xlab = "", ylab = "Energy sub metering"))
lines(epc$DateTime, epc$Sub_metering_1, col = "black")
lines(epc$DateTime, epc$Sub_metering_2, col = "red")
lines(epc$DateTime, epc$Sub_metering_3, col = "blue")
axis.POSIXct(1, at = c(as.Date('2007-02-01'), as.Date('2007-02-02'), as.Date('2007-02-03')), format = '%a')
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"))
dev.off()