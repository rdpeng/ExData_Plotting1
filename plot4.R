electric <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
electric$Date2 <- as.POSIXct(paste(electric$Date,electric$Time), format="%d/%m/%Y %H:%M:%S")
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")
electric$Global_active_power <- as.numeric(electric$Global_active_power)
electric <- subset(electric, Date == "2007-02-01"|Date == "2007-02-02")
# plotting

png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
# first
  plot(electric$Date2, electric$Global_active_power, xlab ="", ylab = "Global Active Power (Kilowatts)", type = "n")
  lines(electric$Date2, electric$Global_active_power)
#Second
  plot(electric$Date2, electric$Sub_metering_1, xlab ="", ylab = "Energy sub metering", type = "n")
  lines(electric$Date2, electric$Sub_metering_1, col = "black")
  lines(electric$Date2, electric$Sub_metering_2, col = "red")
  lines(electric$Date2, electric$Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(2, 2), bty = "n" )
#Thirth
  plot(electric$Date2, electric$Voltage, xlab ="datetime", ylab = "Voltage", type = "n")
  lines(electric$Date2, electric$Voltage)
#Fourth
  plot(electric$Date2, electric$Global_reactive_power, xlab ="datetime", ylab = "Global_reactive_power", type = "n")
  lines(electric$Date2, electric$Global_reactive_power)
dev.off()

