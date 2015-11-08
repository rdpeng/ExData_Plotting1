source("LoadData.R")

plot4 <- function() {
        data <- load_data() # Load Data using load_data function.
        
        png("plot4.png", width=490, height=490) #Initialize png function
        
        par(mfrow=c(2,2))
       
        plot(data$Time, data$Global_active_power,    # Plot 1
             type="l",
             xlab="",
             ylab="Global Active Power")
        
        plot(data$Time, data$Voltage, type="l",   # Plot 2
             xlab="datetime", ylab="Voltage")
        
        plot(data$Time, data$Sub_metering_1, type="l", col="black", # Plot 3
             xlab="", 
             ylab="Energy sub metering")
        lines(data$Time, data$Sub_metering_2, col="red")
        lines(data$Time, data$Sub_metering_3, col="blue")
        legend("topright",
               col=c("black", "red", "blue"),
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty=1,
               box.lwd=0, bty="n")
        
        plot(data$Time, data$Global_reactive_power, type="n", # Plot 4 
             xlab="datetime", ylab="Global_reactive_power")
        lines(data$Time, data$Global_reactive_power)
        
        dev.off()
        
}