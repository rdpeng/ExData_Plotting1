plot3 <- function(){
        data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
        data <- as.data.table(data)
        good <- (data$"Date" == "1/2/2007") | (data$"Date" == "2/2/2007")
        data <- data[good]
        png(file = "plot3.png")
        par(bg = "transparent")
        plot(data$Sub_metering_1, type = "s", ylab = "Energy sub metering", xlab = "")
        points(data$Sub_metering_2, type = "s", col = "red")
        points(data$Sub_metering_3, type = "s", col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2" ,"Sub_metering_2"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red", "blue"))        
        dev.off()
}
