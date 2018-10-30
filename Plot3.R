#load in dataset as dataframe
housepower <- read.table('household_power_consumption.txt', stringsAsFactors = FALSE, header = TRUE, sep = ';')

#Take only the portion we are interested in.
Feb2Days <- subset(housepower, housepower$Date == '1/2/2007' | housepower$Date == '2/2/2007')

#Make a 'DateTime' column which takes both Date and Time columns and converts to 
Feb2Days$DateTime <- strptime(paste(Feb2Days$Date, Feb2Days$Time), format="%d/%m/%Y %H:%M:%S")

#adjust the sub metering 1-3 to numeric so it plays nice with the plot function
Feb2Days$Sub_metering_1 <- as.numeric(Feb2Days$Sub_metering_1)
Feb2Days$Sub_metering_2 <- as.numeric(Feb2Days$Sub_metering_2)
Feb2Days$Sub_metering_3 <- as.numeric(Feb2Days$Sub_metering_3)

#Lets initialize a png file for our graph
png("plot3.png", width = 480, height = 480)

#Make the plot
plot(Feb2Days$DateTime, Feb2Days$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy Sub Metering")

#add remaining lines
lines(Feb2Days$DateTime, Feb2Days$Sub_metering_2, col = 'red')
lines(Feb2Days$DateTime, Feb2Days$Sub_metering_3, col = 'blue')

#add legend
legend('topright', legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"),
       col=c("black", "red", "blue"), lty = 1)

#close graphics device
dev.off()
