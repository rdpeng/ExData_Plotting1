filename <- "household_power_consumption.txt"
# We will only be using data from the dates 2007-02-01 and 2007-02-02
data <- read.table(filename, header = TRUE, sep = ";")
data <- data[ data$Date %in% c( "1/2/2007", "2/2/2007" ), ]
#Use correct data types
data$Global_active_power <- as.numeric( as.character( data$Global_active_power ) )
data$Global_reactive_power <- as.numeric( as.character( data$Global_reactive_power ) )
data$Voltage <- as.numeric( as.character( data$Voltage ) )
data$Sub_metering_1 <- as.numeric( as.character( data$Sub_metering_1 ) )
data$Sub_metering_2 <- as.numeric( as.character( data$Sub_metering_2 ) )
data$Sub_metering_3 <- as.numeric( as.character( data$Sub_metering_3 ) )

dataTime <- paste( data$Date, data$Time )
data$DateTime <- strptime( dataTime, format = "%d/%m/%Y %H:%M:%S" )

### Plot 4
png( filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent" )

par( mfrow = c( 2, 2 ) )

## plot Global Active Power
plot( data$DateTime, 
      data$Global_active_power, 
      type = "l", 
      ylab = "Global Active Power", 
      xlab = "" )

## Plot the Voltage by the date and time
plot( data$DateTime, 
      data$Voltage, 
      type = "l", 
      ylab = "Voltage", 
      xlab = "datetime")

## plot Sub_metering
plot( data$DateTime, 
      data$Sub_metering_1, 
      type = "n",
      xlab = "", 
      ylab = "Energy Sub Metering")
##Add lines
lines( data$DateTime, 
       data$Sub_metering_1, 
       col = "black")
lines( data$DateTime, 
       data$Sub_metering_2, 
       col = "red")
lines( data$DateTime, 
       data$Sub_metering_3, 
       col = "blue")
##Add legend
legend( "topright", 
        c( "Sub_metering_1",
           "Sub_metering_2", 
           "Sub_metering_3"), 
        lty = c( 1, 1, 1 ), 
        lwd = c( 2, 2, 2 ), 
        col = c( "black", "red", "blue" ) )

## plot Global_reactive_power
plot(data$DateTime, 
     data$Global_reactive_power, 
     type="l", 
     ylab="Global_reactive_power", 
     xlab="datetime"
)
dev.off()
