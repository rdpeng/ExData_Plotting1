#start same as plot1
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#pull out subset of data
subset_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Switching Data
date_time <- strptime(paste(subset_data$Date, subset_Data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Graphing Data
graph_data2 <- as.numeric(data_subset$Global_active_power)plot(date_time, graph_data2, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()