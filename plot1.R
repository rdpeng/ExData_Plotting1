## Getting Data 
setwd("Downloads")
data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = ".")

## Data Subset
data_subset <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

## Graphing Data
power_graph <- as.numeric(data_subset$Global_active_power)
graph_1 <- hist(power_graph, col = "red", main = "Global Active Power",
                xlab = "Global Active Power (kilowatts)",
                ylab = "Frequency")

