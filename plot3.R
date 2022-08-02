library(data.table)

## 1. Load data
setwd("./3. Exploratory data analysis/Week 1")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./electric_power_data.zip")
unzip("electric_power_data.zip","household_power_consumption.txt")
data <- fread("household_power_consumption.txt", stringsAsFactors = F, sep = ";")

## 2. Pre-process
df <- data[Date %in% c('1/2/2007', '2/2/2007'),]
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Time <- strptime(df$Time, "%H:%M:%S")
df$Datetime <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)


## 3. Plot 3
png("plot3.png")
plot(df$Sub_metering_1 ~ df$Datetime, type = "l", main = "", ylab = "Energy sub metering", xlab = "")
lines(df$Sub_metering_2 ~ df$Datetime, col = "red")
lines(df$Sub_metering_3 ~ df$Datetime, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_1", "Sub_metering_1"),
       lwd = 3, col = c("black", "red", "blue"))

## 4. Close connection
dev.off()
