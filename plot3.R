library(sqldf)
info <- read.csv('household_power_consumption.txt', sep = ';', na.strings = "?")
library(lubridate)
info$DateStr <- info$Date
info$DateParsed <- dmy(info$Date)
filtered <- subset(info, DateParsed == ymd("2007-02-01") | DateParsed == ymd("2007-02-02"))
filtered$Sub_metering_1 <- as.numeric(filtered$Sub_metering_1)
filtered$Sub_metering_2 <- as.numeric(filtered$Sub_metering_2)
filtered$Sub_metering_3 <- as.numeric(filtered$Sub_metering_3)
filtered$datetime <- dmy_hms(paste(filtered$DateStr, filtered$Time))
png(filename = "plot3.png", width = 480, height = 480)
cols <- c("LINE1"="#f04546","LINE2"="#3591d1","LINE3"="#62c76b")
ggplot() + ylab("Energy sub metering") +
    geom_line(aes(datetime, Sub_metering_1, colour="LINE1"), data = filtered, col = "black") +
    geom_line(aes(datetime, Sub_metering_2, colour="LINE2"), data = filtered, col = "red") +
    geom_line(aes(datetime, Sub_metering_3, colour="LINE3"), data = filtered, col = "blue") +
    scale_colour_manual(name = "SVF", values=cols, labels=c("one", "two", "tree"), guide = "legend")
dev.off()
