# read the data 
power_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.string = "?")

# keep only 2007-02-01 and 2007-02-02 data
power_data_subset <- power_data[power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007", ]

# create a variable to show both date & time
power_data_subset$DateTime <- strptime(paste(power_data_subset$Date, 
    power_data_subset$Time, sep = ""), "%d/%m/%Y %H:%M:%S")

# draw plot 3 and save as a png file
png("plot3.png", width = 480, height = 480)

# set up the graph "shell"
plot(power_data_subset$DateTime, power_data_subset$Sub_metering_1, 
     type = "n", xlab = "", ylab = "Energy sub metering")

# add lines for sub metering 1-3
lines(power_data_subset$DateTime, power_data_subset$Sub_metering_1)
lines(power_data_subset$DateTime, power_data_subset$Sub_metering_2, col = "red")
lines(power_data_subset$DateTime, power_data_subset$Sub_metering_3, col = "blue")

# add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()