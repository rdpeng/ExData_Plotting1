data <- read.table(file="household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")

# Subset by date
data <- subset (data, data$Date=="2007-02-01"|data$Date=="2007-02-02")


attach(data)


# Plot1

png("plot1.png", width=480, height=480, units="px")
hist(Global_active_power, breaks=11, col='red', main="Global active power", xlab="Global Active Power (kilowatts)", ylim=c(0,1200))
dev.off()
