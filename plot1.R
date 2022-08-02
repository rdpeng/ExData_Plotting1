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
df$Global_active_power <- as.numeric(df$Global_active_power)

## 3. Plot 1
png("plot1.png")
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

## 4. Close connection
dev.off()
