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

### Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

hist(
        data$Global_active_power, 
        breaks=12, 
        col="red", 
        main="Global Active Power", 
        xlab="Global Active Power (kilowatts)")
dev.off()
