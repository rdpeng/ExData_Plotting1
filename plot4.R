# Manually download to getwd()\\Data
# Unzip file to Data\\household_power_consumtion.txt
unzip("Data\\exdata_data_household_power_consumption.zip", exdir = "Data")

rawData <- read.table("Data\\household_power_consumption.txt",
    header = TRUE,
    sep = ";",
    na.strings = "?",
    stringsAsFactors = FALSE)

str(rawData)

# Add computed data time column use Pacific timezone since this is UC Irvine data 
rawData <- cbind(rawData,
      DateTime = strptime(paste(rawData$Date, rawData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S", tz = "US/Pacific"))

library(lubridate)

# Examine only the subset from 2007-02-01 to 2007-02-02
theData <- subset(rawData, DateTime >= ymd("2007-02-01", tz = "US/Pacific") & DateTime < ymd("2007-02-03", tz = "US/Pacific"))
dim(theData)
head(theData$DateTime)
tail(theData$DateTime)

# Plot hist PNG
png(filename = "Data\\plot4.png")

par(mfrow=c(2,2))

# Plot 1,1
plot(theData$DateTime, theData$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(cbind(theData$DateTime, theData$Global_active_power))

# Plot 1,1
plot(theData$DateTime, theData$Voltage, type = "n", xlab = "", ylab = "Voltage")
lines(cbind(theData$DateTime, theData$Voltage))

# Plot 2,1
plot(theData$DateTime, theData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(cbind(theData$DateTime, theData$Sub_metering_1), col = "black")
lines(cbind(theData$DateTime, theData$Sub_metering_2), col = "red")
lines(cbind(theData$DateTime, theData$Sub_metering_3), col = "blue")
legend(x = "topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1))

# Plot 2,2
plot(theData$DateTime, theData$Global_reactive_power, type = "n", xlab = "", )
lines(cbind(theData$DateTime, theData$Global_reactive_power))


dev.off()