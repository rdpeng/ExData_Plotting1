# Plot 2

# Load data within the date range
raw_data_file <- "../household_power_consumption.txt"
raw_data <- read.csv(raw_data_file, header = TRUE, sep = ";",
                     stringsAsFactors=FALSE)
data <- raw_data[as.Date(raw_data$Date, "%d/%m/%Y") >=
                 strftime("2007-02-01", "%Y-%m-%d") &
                 as.Date(raw_data$Date, "%d/%m/%Y") <=
                 strftime("2007-02-02", "%Y-%m-%d"),]

# Select needed columns to be plotted 
gap <- as.numeric(data$Global_active_power)
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Plot data to a png device
png(file = "plot2.png")
plot(datetime, gap, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

