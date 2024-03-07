#load file
epc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")
epc <- subset(epc, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

#plot 1
png(filename = "plot1.png", width = 480, height = 480)
with(epc, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()
