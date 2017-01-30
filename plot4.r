the_data_file <- "./data/household_power_consumption.txt"
the_data <- read.table(the_data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

the_data$Date_asDate<-as.Date(the_data$Date, "%d/%m/%Y")
the_data_subset <-subset(the_data,Date_asDate>="2007-02-01" & Date_asDate<="2007-02-02")

datetime <- strptime(paste(the_data_subset$Date, the_data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
the_Global_active_power <- as.numeric(the_data_subset$Global_active_power)
the_Global_reactive_power <- as.numeric(the_data_subset$Global_reactive_power)

the_subMetering1 <- as.numeric(the_data_subset$Sub_metering_1)
the_subMetering2 <- as.numeric(the_data_subset$Sub_metering_2)
the_subMetering3 <- as.numeric(the_data_subset$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))
#upper left plot
plot(datetime, the_Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex=0.2)
#end upper left plot

#upper right plot
the_voltage <- as.numeric(subSetData$Voltage)
plot(datetime, the_voltage, type="l", xlab="datetime", ylab="Voltage")
#end upper right plot

#begin lower left plot
plot(datetime, the_subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, the_subMetering2, type="l", col="red")
lines(datetime, the_subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#end lower left plot

#begin lower right plot
plot(datetime, the_Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
#end lower right plot

dev.off()
