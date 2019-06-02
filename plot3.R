##Assignment 1 // plot3
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

#plot energy sub metering vs. datetime
png("plot3.png")
with(dataClean, {
  plot(Sub_metering_1 ~ datetime, type = "l", xlab = "", ylab = "Energy Sub-metering")
  lines(Sub_metering_2 ~ datetime, type = "l", col = "red")
  lines(Sub_metering_3 ~ datetime, type = "l", col = "blue")
  legend("topright", col = c("black","red", "blue"), lwd = 2,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()