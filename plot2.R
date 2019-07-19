library(readr)
# grab the data and filter to the days of interest
data <- read_delim("~/repos/ExData_Plotting1/data/household_power_consumption.txt", ";", na=c("", "NA", "?"))
data$filterDate <- as.Date(data$Date, "%d/%m/%Y")
bounds <- as.Date(c("2007-02-01", "2007-02-02"))
data <- subset(data, bounds[1] <= filterDate & filterDate <= bounds[2])

# get the date and time together in one column
data$Time <- paste(data$Date, ':', data$Time, sep="")
data$Time <- strptime(data$Time, "%d/%m/%Y:%H:%M:%S")

png("~/repos/ExData_Plotting1/plot2.png")
plot(data$Time, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()