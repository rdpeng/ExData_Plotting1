# download and read the data 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = url, destfile = "Data/ElectricPowerConsumption.zip", mode = 'wb')

dir.create("Data")
setwd("Data")
unzip(zipfile = "ElectricPowerConsumption.zip")
setwd ("..")

data <- read.table("Data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = '?')

# select only the data from 2007-02-01 and 2007-02-02
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data <- data[(data$DateTime >= "2007-02-01") & (data$DateTime < "2007-02-03"), ]


png(filename = "plot4.png", width = 480, height = 480, units = "px")
# set the number of plots per row 
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
# plot 1
plot(x = data$DateTime, y = data$Global_active_power, pch = ".", xlab = ""
     , ylab = "Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

# plot 2
plot(x = data$DateTime, y = data$Voltage, pch = ".", xlab = "datetime"
     , ylab = "Voltage")
lines(data$DateTime, data$Voltage)

# plot 3
plot(x = data$DateTime, y = data$Sub_metering_1, pch = ".", xlab = "", 
     ylab = "Energy sub metering")
lines(x = data$DateTime, y = data$Sub_metering_1, col = "black")
lines(x = data$DateTime, y = data$Sub_metering_2, col = "red")
lines(x = data$DateTime, y = data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = .5)

# plot 4

plot(x = data$DateTime, y = data$Global_reactive_power, pch = ".", xlab = "datetime"
     , ylab = "Global Reactive Power")
lines(data$DateTime, data$Global_reactive_power)
dev.off()
