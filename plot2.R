# This assignment uses data from the UC Irvine Machine Learning Repository, 
# In particularthe "Individual household electric power consumption Data Set"
# - Dataset: Electric power consumption [20Mb]
# - Description: Measurements of electric power consumption in one household 
#   with a one-minute sampling rate over a period of almost 4 years. Different
#   electrical quantities and some sub-metering values are available.
# download the database from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#
electric <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
electric$Date2 <- as.POSIXct(paste(electric$Date,electric$Time), format="%d/%m/%Y %H:%M:%S")
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")
electric$Global_active_power <- as.numeric(electric$Global_active_power)
electric <- subset(electric, Date == "2007-02-01"|Date == "2007-02-02")
# plotting
png("plot2.png", width = 480, height = 480)
plot(electric$Date2, electric$Global_active_power, xlab ="", ylab = "Global Active Power (Kilowatts)", type = "n")
lines(electric$Date2, electric$Global_active_power)
dev.off()

