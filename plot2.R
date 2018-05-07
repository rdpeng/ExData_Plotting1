data <- read.table('household_power_consumption.txt', stringsAsFactors=FALSE ,sep = ';', header = T)
starttime <- as.Date('2007-02-01')
stoptime <- as.Date('2007-02-02')
data <- data[as.Date(strptime(data$Date, format = '%d/%m/%Y')) >= starttime, ]
data <- data[stoptime >= as.Date(strptime(data$Date, format = '%d/%m/%Y')), ]
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(data$Global_active_power)
png("plot2.png", width=480, height=480, units = "px")
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
