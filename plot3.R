library(readr)
# grab the data and filter to the days of interest
data <- read_delim("~/repos/ExData_Plotting1/data/household_power_consumption.txt", ";", na=c("", "NA", "?"))
data$filterDate <- as.Date(data$Date, "%d/%m/%Y")
bounds <- as.Date(c("2007-02-01", "2007-02-02"))
data <- subset(data, bounds[1] <= filterDate & filterDate <= bounds[2])

# get the date and time together in one column
data$Time <- paste(data$Date, ':', data$Time, sep="")
data$Time <- strptime(data$Time, "%d/%m/%Y:%H:%M:%S")

png("~/repos/ExData_Plotting1/plot3.png")
plot(data$Time, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()