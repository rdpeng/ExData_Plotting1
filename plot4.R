##Assignment 1 // plot4
#load data
if(!exists("./data")) {
  dir.create("./data")
}
powerUse <- read.table("./data/household_power_consumption.txt",
                       header = TRUE, sep = ";", na.strings = "?")

#clean data
library(dplyr)
library(lubridate)
dataClean <- powerUse %>%
  filter(Date %in% c("1/2/2007", "2/2/2007")) %>%
  mutate(Date = dmy(Date), datetime = ymd_hms(paste(Date, Time)))

#plot graphs
png("plot4.png")
par(mfrow = c(2,2))
with(dataClean, {
    #plot global active power vs. datetime
    plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

    #plot voltage vs. datetime
    plot(datetime, Voltage, type = "l", ylab = "Global Active Power")

    #plot energy sub metering vs. datetime
    plot(Sub_metering_1 ~ datetime, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(Sub_metering_2 ~ datetime, type = "l", col = "red")
    lines(Sub_metering_3 ~ datetime, type = "l", col = "blue")
    legend("topright", col = c("black","red", "blue"), lwd = 1,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    #plot global reactive power vs. datetime
    plot(datetime, Global_reactive_power, type = "l", ylab = "Global Reactive Power (kilowatt)")
})
dev.off()