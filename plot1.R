library(readr)
# grab the data and filter to the days of interest
data <- read_delim("~/repos/ExData_Plotting1/data/household_power_consumption.txt", ";", na=c("", "NA", "?"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
bounds <- as.Date(c("2007-02-01", "2007-02-02"))
data <- subset(data, bounds[1] <= Date & Date <= bounds[2])
png("~/repos/ExData_Plotting1/plot1.png")
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()