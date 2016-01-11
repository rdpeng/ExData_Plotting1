#Create subset of data for given date
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 2075259)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
filtered <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

#Format time 
filtered$Time <- paste(as.character(filtered$Date), as.character(filtered$Time), sep=" ")
filtered$Time <- strptime(filtered$Time, format="%Y-%m-%d %H:%M")

#Create plot 2
png("plot2.png", width=480, height=480)
plot(filtered$Time, filtered$Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xlab="")
dev.off()