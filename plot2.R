## Data from plot 1
setwd("Downloads")
data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = ".")

## Data Subset
data_subset <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

## Switching Data Type and Graphing Data
object_date_time <- strptime(paste(data_subset$Date, data_subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Graphing Data
power_graph <- as.numeric(data_subset$Global_active_power)
plot(object_date_time, power_graph, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
