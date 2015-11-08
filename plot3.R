source("LoadData.R")

plot3 <- function() {
        data <- load_data() # Load Data using load_data function.
        
        png("plot3.png", width=480, height=480) #Initialize png function
        
        plot(data$Time, data$Sub_metering_1, type="l", col="black",  ##Plotting against the sub_metering1
             xlab="", ylab="Energy sub metering")
        lines(data$Time, data$Sub_metering_2, col="red") ##Adding line coordinates against the sub_metering2in Red Colour
        lines(data$Time, data$Sub_metering_3, col="blue") ##Adding line coordinates against the sub_metering2in Blue Colour
        legend("topright",
               col=c("black", "red", "blue"),
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty=1)   ## Adding legend as per the instructions
        dev.off()
}