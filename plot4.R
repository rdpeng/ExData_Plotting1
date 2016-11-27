library(data.table)
library(lubridate)
library(dplyr)

# unzip file, if necessary
if (!file.exists("household_power_consumption.txt")) {
    unzip("household_power_consumption.zip")
}

# load and format data
house_power <- fread("household_power_consumption.txt",
                     sep = ";",
                     na.strings = c("NA", "?"))
house_power <- filter(house_power, Date == "1/2/2007" | Date == "2/2/2007")
house_power <- mutate(house_power, datetime = dmy_hms(paste(Date, Time)))
for (i in 3:9) {
    class(house_power[, i]) <- "numeric"
}

# setup plots
png(filename = "plot4.png")
par(mfcol = c(2, 2))

# plot top-right
with(house_power, plot(datetime, Global_active_power,
                       xlab = "",
                       ylab = "Global Active Power",
                       type = "n"))
with(house_power, lines(datetime, Global_active_power))

# plot bottom-right
with(house_power, plot(datetime, Sub_metering_1,
                       xlab = "",
                       ylab = "Energy sub metering",
                       type = "n"))
with(house_power, lines(datetime, Sub_metering_1))
with(house_power, lines(datetime, Sub_metering_2, col = "red"))
with(house_power, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"),
       legend = names(house_power)[7:9], bty = "n")

# plot top-left
with(house_power, plot(datetime, Voltage, type = "n"))
with(house_power, lines(datetime, Voltage))

# plot bottom-left
with(house_power, plot(datetime, Global_reactive_power, type = "n"))
with(house_power, lines(datetime, Global_reactive_power))

dev.off()
