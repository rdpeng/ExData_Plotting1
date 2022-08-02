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
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
df$Voltage <- as.numeric(df$Voltage)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)


## 3. Plot 4
png("plot4.png")
par(mfrow=c(2,2))

# 1
plot(df$Global_active_power ~ df$Datetime, type = "l", main = "", ylab = "Global Active Power", xlab = "")

# 2
plot(df$Voltage ~ df$Datetime, type = "l", main = "", ylab = "Voltage", xlab = "datetime")

# 3
plot(df$Sub_metering_1 ~ df$Datetime, type = "l", main = "", ylab = "Energy sub metering", xlab = "")
lines(df$Sub_metering_2 ~ df$Datetime, col = "red")
lines(df$Sub_metering_3 ~ df$Datetime, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_1", "Sub_metering_1"),
       lwd = 3, col = c("black", "red", "blue"), bty = "n")

# 4
plot(df$Global_reactive_power ~ df$Datetime, type = "l", main = "", ylab = "Global_reactive_power", xlab = "datetime")


## 4. Close connection
dev.off()
