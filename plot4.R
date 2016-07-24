## Data from plot 1
setwd("Downloads")
data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = ".")
## Data Subset
data_subset <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

## Switching Data Type and Graphing Data

object_date_time <- strptime(paste(data_subset$Date, data_subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Submeter 1, 2, 3 / Getting Voltage / Reactive Power / Active

sub_metering_1 <- as.numeric(data_subset$Sub_metering_1)
sub_metering_2 <- as.numeric(data_subset$Sub_metering_2)
sub_metering_3 <- as.numeric(data_subset$Sub_metering_3)
voltage_1 <- as.numeric(data_subset$Voltage)
reactive_1 <- as.numeric(data_subset$Global_reactive_power)
power_graph <- as.numeric(data_subset$Global_active_power)

## Creating Multiple Graphs

par(mfrow = c(2, 2))

## Graphing Data

## Plot 1

plot(object_date_time, power_graph, type = "l",
     xlab = "",
     ylab = "Global Active Power")
     
## Plot 2
plot(object_date_time, voltage_1, type = "l", 
     xlab = "datetime",
     ylab = "Voltage")
  
## Plot 3
plot(object_date_time, sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(object_date_time, sub_metering_2, type = "l", col = "red")
lines(object_date_time, sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"))

## Plot 4
plot(object_date_time, reactive_1, type = "l", 
     xlab = "datetime",
     ylab = "Global_reactive_power")
