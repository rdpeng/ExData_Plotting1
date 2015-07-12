plot4 <- function() {
       par(mfrow=c(2,2))
       plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
       plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")
       plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
       lines(df$timestamp,df$Sub_metering_2,col="red")
       lines(df$timestamp,df$Sub_metering_3,col="blue")
       legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) 
       plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
       dev.copy(png, file="plot4.png", width=480, height=480)
       dev.off()
       cat("plot4.png has been saved in", getwd())
}
plot4()
plot4.png has been saved in /Users/Lindzey/data
