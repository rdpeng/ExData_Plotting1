## Data from plot 1
setwd("Downloads")
data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = ".")
## Data Subset
data_subset <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

## Switching Data Type and Graphing Data

object_date_time <- strptime(paste(data_subset$Date, data_subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Submeter 1, 2, 3

sub_metering_1 <- as.numeric(data_subset$Sub_metering_1)
sub_metering_2 <- as.numeric(data_subset$Sub_metering_2)
sub_metering_3 <- as.numeric(data_subset$Sub_metering_3)

## Graphing Data
power_graph <- as.numeric(data_subset$Global_active_power)
plot(object_date_time, sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(object_date_time, sub_metering_2, type = "l", col = "red")
lines(object_date_time, sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"))
