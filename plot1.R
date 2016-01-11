#Create subset of data for given date
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 2075259)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
filtered <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

#Create plot 1 (using hist)
png("plot1.png", width=480, height=480)
hist(filtered$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
