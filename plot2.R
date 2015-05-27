# read the data 
power_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.string = "?")

# keep only 2007-02-01 and 2007-02-02 data
power_data_subset <- power_data[power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007", ]

# create a variable to show both date & time
power_data_subset$DateTime <- strptime(paste(power_data_subset$Date, 
      power_data_subset$Time, sep = ""), "%d/%m/%Y %H:%M:%S")

# draw plot 2 and save as a png file
png("plot2.png", width = 480, height = 480)
plot(power_data_subset$DateTime, power_data_subset$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()