#load in dataset as dataframe
housepower <- read.table('household_power_consumption.txt', stringsAsFactors = FALSE, header = TRUE, sep = ';')

#Take only the portion we are interested in.
Feb2Days <- subset(housepower, housepower$Date == '1/2/2007' | housepower$Date == '2/2/2007')

#Make a 'DateTime' column which takes both Date and Time columns and converts to 
Feb2Days$DateTime <- strptime(paste(Feb2Days$Date, Feb2Days$Time), format="%d/%m/%Y %H:%M:%S")

#change relevant columns to numeric
Feb2Days$Global_active_power <- as.numeric(Feb2Days$Global_active_power)
Feb2Days$Voltage <- as.numeric((Feb2Days$Voltage))
Feb2Days$Sub_metering_1 <- as.numeric(Feb2Days$Sub_metering_1)
Feb2Days$Sub_metering_2 <- as.numeric(Feb2Days$Sub_metering_2)
Feb2Days$Sub_metering_3 <- as.numeric(Feb2Days$Sub_metering_3)
Feb2Days$Global_reactive_power <- as.numeric(Feb2Days$Global_reactive_power)

#Lets initialize a png file for our graph
png("plot4.png", width = 480, height = 480)

#Now, we want 4 graphs at once, so we use either the par() function or layout()
par(mfrow=c(2, 2))

#Now for the graphs
#Same as graph2
plot(Feb2Days$DateTime, Feb2Days$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
#Plot voltage as a function of datetime
plot(Feb2Days$DateTime, Feb2Days$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')
#Same as graph3
plot(Feb2Days$DateTime, Feb2Days$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy Sub Metering")
lines(Feb2Days$DateTime, Feb2Days$Sub_metering_2, col = 'red')
lines(Feb2Days$DateTime, Feb2Days$Sub_metering_3, col = 'blue')
legend('topright', legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"),
       col=c("black", "red", "blue"), lty = 1, bty = 'n')
#Plot global_reactive_power as a function of datetime
plot(Feb2Days$DateTime, Feb2Days$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')

#close graphics device
dev.off()
