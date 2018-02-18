#Load the data required
dataSet <- "household_power_consumption.txt"
data <- read.table(dataSet, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot for Global Active Power
globalActivePower <- as.numeric(subSet$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()