electric <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
electric$Date2 <- as.POSIXct(paste(electric$Date,electric$Time), format="%d/%m/%Y %H:%M:%S")
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")
electric$Global_active_power <- as.numeric(electric$Global_active_power)
electric <- subset(electric, Date == "2007-02-01"|Date == "2007-02-02")
# plotting
png("plot3.png", width = 480, height = 480)
  plot(electric$Date2, electric$Sub_metering_1, xlab ="", ylab = "Energy sub metering", type = "n")
    lines(electric$Date2, electric$Sub_metering_1, col = "black")
    lines(electric$Date2, electric$Sub_metering_2, col = "red")
    lines(electric$Date2, electric$Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(2, 2)  )
dev.off()

