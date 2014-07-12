plot4 <- function(){
        data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
        data <- as.data.table(data)
        good <- (data$"Date" == "1/2/2007") | (data$"Date" == "2/2/2007")
        data <- data[good]
        png(file = "plot4.png")
        par(bg = "transparent", mfrow = c(2, 2))
        plot(data$Global_active_power, type = "s", ylab = "Global Active Power", xlab = "")
        plot(data$Voltage, type = "s", ylab = "Voltage", xlab = "datetime")
        plot(data$Sub_metering_1, type = "s", ylab = "Energy sub metering", xlab = "")
        points(data$Sub_metering_2, type = "s", col = "red")
        points(data$Sub_metering_3, type = "s", col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2" ,"Sub_metering_2"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red", "blue"))        
        plot(data$Global_reactive_power, type = "s", ylab = "Global_reactive_power", xlab = "datetime")
        dev.off()
}
