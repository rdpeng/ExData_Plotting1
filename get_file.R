library(data.table)
library(lubridate)
library(dplyr)

download.file(
    "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
    destfile = "household_power_consumption.zip",
    method = "curl")
unzip("household_power_consumption.zip", exdir = "./data")

# load and format data
house_power <- fread("household_power_consumption.txt",
                     sep = ";",
                     na.strings = c("NA", "?"))
house_power <- filter(house_power, Date == "1/2/2007" | Date == "2/2/2007")
house_power <- mutate(house_power, date_time = dmy_hms(paste(Date, Time)))
for (i in 3:9) {
    class(house_power[, i]) <- "numeric"
}
