setwd("~/R/Course 4 (Exploratory Data Analysis)/C4W1/")
library(data.table)

if(!file.exists("household_power_consumption.txt")) {
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileURL, destfile = "./household_power_consumption.zip", method = "curl")
        unzip("./household_power_consumption.zip")
}

## Load data into memory
power <- read.csv2("household_power_consumption.txt", header = TRUE,
                   comment.char = "", na.strings = "?", nrows = 2085259,
                   stringsAsFactors = FALSE)

dt <- power[power$Date %in% c("1/2/2007","2/2/2007"),]
dt$datetime <- strptime(paste(dt$Date,dt$Time), "%d/%m/%Y %H:%M:%S")
dt$Global_active_power <- as.numeric(dt$Global_active_power)

## Create plot
png(file="plot4.png",width=480,height=480)
par(mfrow = c(2,2))
# 1
with(dt, plot(datetime, Global_active_power, type = "l",
              ylab = "Global Active Power (kilowatts)", xlab = ""))
# 2
with(dt, plot(datetime, Voltage, type = "l",
              ylab = "Voltage"))
# 3
with(dt, plot(datetime, Sub_metering_1, type = "l", col = "black", xlab = "",
              ylab = "Energy sub metering"))
lines(dt$datetime, dt$Sub_metering_2, type = "l", col = "red")
lines(dt$datetime, dt$Sub_metering_3, type = "l", col = "blue")
legend("topright", bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1), col=c("black","red","blue"))
# 4
with(dt, plot(datetime, Global_reactive_power, type = "l"))
dev.off()
