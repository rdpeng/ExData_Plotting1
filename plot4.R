library(readr)
# grab the data and filter to the days of interest
data <- read_delim("~/repos/ExData_Plotting1/data/exdata_data_household_power_consumption.zip", ";", na=c("", "NA", "?"))
data$filterDate <- as.Date(data$Date, "%d/%m/%Y")
bounds <- as.Date(c("2007-02-01", "2007-02-02"))
data <- subset(data, bounds[1] <= filterDate & filterDate <= bounds[2])

# get the date and time together in one column
data$Time <- paste(data$Date, ':', data$Time, sep="")
data$Time <- strptime(data$Time, "%d/%m/%Y:%H:%M:%S")

# setup 
png("~/repos/ExData_Plotting1/plot4.png")
par(mfrow=c(2,2), pty="m", mar=c(4, 4, 1, 2))
# plot 1
plot(data$Time, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# plot 2
plot(data$Time, data$Voltage, type="l", ylab="Voltage", xlab="datetime")
# plot 3
plot(data$Time, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
# plot 4
plot(data$Time, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()
