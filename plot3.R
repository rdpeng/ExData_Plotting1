#start same as plot1
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#pull out subset of data
subset_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# Switching Data
date_time <- strptime(paste(subset_data$Date, subset_Data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
#submeter
sub_metering_1 <- as.numeric(data_subset$Sub_metering_1)
sub_metering_2 <- as.numeric(data_subset$Sub_metering_2)
sub_metering_3 <- as.numeric(data_subset$Sub_metering_3)
#Graphing Data
graph_data3 <- as.numeric(data_subset$Global_active_power)
+plot(date_time, sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering")
+lines(date_time, sub_metering_2, type = "l", col = "red")
+lines(date_time, sub_metering_3, type = "l", col = "blue")
+legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"))