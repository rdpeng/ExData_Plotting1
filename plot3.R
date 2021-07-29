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


png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(x = data$DateTime, y = data$Sub_metering_1, pch = ".", xlab = "", 
     ylab = "Energy sub metering")
lines(x = data$DateTime, y = data$Sub_metering_1, col = "black")
lines(x = data$DateTime, y = data$Sub_metering_2, col = "red")
lines(x = data$DateTime, y = data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
