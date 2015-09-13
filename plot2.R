## Plot2
# Preparing the Data
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Drawing the plot
dateTime <- strptime(paste(subSet$Date, subSet$Time, sep = " "), "%d/%m/Y %H:%M:%S")
globActPow <- as.numeric(subSet$Global_active_power)
png("plot2.png", width = 480, heigth = 480)
plot(dateTime, globActPow, type ="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
