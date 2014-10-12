# Read in the data; only interested in reading in 02/01/2007 - 02/02/2007
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", header = T, sep = ";");
data$fDayTime <- strptime(paste(data$Date, data$Time, sep = ' '), format = "%d/%m/%Y %H:%M:%S")

# Plot 2
png(file = "plog2.png", width = 480, height = 480)
plot(data$fDayTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()