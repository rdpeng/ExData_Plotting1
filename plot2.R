#load file
epc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
epc <- subset(epc, as.Date(epc$Date, format = "%d/%m/%Y") >= as.Date('2007-02-01') & as.Date(epc$Date, format = '%d/%m/%Y') <= as.Date('2007-02-02'))
epc$DateTime <- strptime(paste(epc$Date, epc$Time), format = "%d/%m/%Y %H:%M:%S")
epc$Time <- strptime(paste(epc$Date, epc$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#plot 2
png(filename = "plot2.png", height = 480, width = 480)
with(epc, plot(type = 'l',DateTime, Global_active_power, xaxt='n', xlab = '', ylab = 'Global Active Power (kilowatts)'))
axis.POSIXct(1, at = c(as.Date('2007-02-01'), as.Date('2007-02-02'), as.Date('2007-02-03')), format = '%a')
dev.off()