# Plot 1

# Load data within the date range
raw_data_file <- "../household_power_consumption.txt"
raw_data <- read.csv(raw_data_file, header = TRUE, sep = ";",
                     stringsAsFactors=FALSE)
data <- raw_data[as.Date(raw_data$Date, "%d/%m/%Y") >=
                 strftime("2007-02-01", "%Y-%m-%d") &
                 as.Date(raw_data$Date, "%d/%m/%Y") <=
                 strftime("2007-02-02", "%Y-%m-%d"),
                 "Global_active_power"]

# Plot data to a png device
png(file = "plot1.png")
hist(as.numeric(data), col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()

