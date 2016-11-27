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
png(filename = "plot3.png")
with(house_power, plot(datetime, Sub_metering_1,
                       xlab = "",
                       ylab = "Energy sub metering",
                       type = "n"))
with(house_power, lines(datetime, Sub_metering_1))
with(house_power, lines(datetime, Sub_metering_2, col = "red"))
with(house_power, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"),
                         legend = names(house_power)[7:9])
dev.off()
