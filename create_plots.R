setwd("~/R")
# Electric power consumption data set has already been downloaded and unzipped in 
#  this working directory
df <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = c("?"), 
                 colClasses = c("character", "character", "numeric","numeric", "numeric", "numeric", "numeric", "numeric", "numeric" ))

if (!require(lubridate)) {
  install.packages("lubridate")
  library(lubridate)
}
df$Date_time <- dmy_hms(paste(df$Date, df$Time))
df$Date <- dmy(df$Date)
df <- df[df$Date %in% ymd("2007-02-01") | df$Date %in% ymd("2007-02-02"),]

# default size for png is 480x480
png("plot1.png")
hist(df$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

png("plot2.png")
plot(df$Date_time, df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

png("plot3.png")
plot(df$Date_time, df$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(df$Date_time, df$Sub_metering_2, type = "l", col = "red")
lines(df$Date_time, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()

png("plot4.png")
par(mfrow = c(2, 2))
plot(df$Date_time, df$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(df$Date_time, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(df$Date_time, df$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(df$Date_time, df$Sub_metering_2, type = "l", col = "red")
lines(df$Date_time, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")
plot(df$Date_time, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
