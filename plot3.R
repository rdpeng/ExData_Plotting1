# Plot 3

# Load data within the date range
raw_data_file <- "../household_power_consumption.txt"
raw_data <- read.csv(raw_data_file, header = TRUE, sep = ";",
                     stringsAsFactors=FALSE)
data <- raw_data[as.Date(raw_data$Date, "%d/%m/%Y") >=
                 strftime("2007-02-01", "%Y-%m-%d") &
                 as.Date(raw_data$Date, "%d/%m/%Y") <=
                 strftime("2007-02-02", "%Y-%m-%d"),]

# Select needed columns to be plotted 
sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Plot data to a png device
png(file = "plot3.png")
plot(datetime, sub1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(datetime, sub1, col = "black")
lines(datetime, sub2, col = "red")
lines(datetime, sub3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

