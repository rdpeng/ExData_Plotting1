##Assignment 1 // plot1
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
  mutate(Date = dmy(Date), Time = hms(Time))

#plot histogram
png("plot1.png")
hist(dataClean$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col= "red")
dev.off()