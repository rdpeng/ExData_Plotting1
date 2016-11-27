library(data.table)
library(lubridate)
library(dplyr)

# load and format data
house_power <- fread("household_power_consumption.txt",
                     sep = ";",
                     na.strings = c("NA", "?"))
house_power <- filter(house_power, Date == "1/2/2007" | Date == "2/2/2007")
house_power <- mutate(house_power, datetime = dmy_hms(paste(Date, Time)))
for (i in 3:9) {
    class(house_power[, i]) <- "numeric"
}

# create plot as png file
png(filename = "plot2.png")
with(house_power, plot(datetime, Global_active_power,
                       xlab = "",
                       ylab = "Global Active Power (kilowatts)",
                       type = "n"))
with(house_power, lines(datetime, Global_active_power))
dev.off()