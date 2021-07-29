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


# convert the variable Global active power to data type numeric
data$Global_active_power <- as.numeric(data$Global_active_power)


png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(x = data$DateTime, y = data$Global_active_power, pch = ".", xlab = ""
     , ylab = "Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)
dev.off()
