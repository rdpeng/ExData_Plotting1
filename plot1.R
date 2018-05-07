data <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
starttime <- as.Date('2007-02-01')
stoptime <- as.Date('2007-02-02')
data <- data[as.Date(strptime(data$Date, format = '%d/%m/%Y')) >= starttime, ]
data <- data[stoptime >= as.Date(strptime(data$Date, format = '%d/%m/%Y')), ]
Global_active_power <- as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480, units = 'px')
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
