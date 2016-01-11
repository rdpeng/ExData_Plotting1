dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetD <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
d_t <- strptime(paste(subsetD$Date, subsetD$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalAP <- as.numeric(subsetD$Global_active_power)
png("plot2.png", width=480, height=480)

plot(d_t, globalAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()