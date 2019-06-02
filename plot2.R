##Assignment 1 // plot2
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

#plot global active power vs. datetime
png("plot2.png")
plot(Global_active_power ~ datetime, dataClean, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatt)")
dev.off()