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
png(filename = "plot1.png")
hist(house_power$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()