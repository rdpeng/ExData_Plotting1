dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#pull out subset of data
subset_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#graph the data
graph_data1 <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)""
hist(graph_data1, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency)
dev.off()