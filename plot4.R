library(sqldf)
info <- read.csv('household_power_consumption.txt', sep = ';', na.strings = "?")
library(lubridate)
info$DateStr <- info$Date
info$DateParsed <- dmy(info$Date)
filtered <- subset(info, DateParsed == ymd("2007-02-01") | DateParsed == ymd("2007-02-02"))
filtered$Global_active_power <- as.numeric(filtered$Global_active_power)
filtered$Global_reactive_power <- as.numeric(filtered$Global_reactive_power)
filtered$Voltage <- as.numeric(filtered$Voltage)
filtered$Sub_metering_1 <- as.numeric(filtered$Sub_metering_1)
filtered$Sub_metering_2 <- as.numeric(filtered$Sub_metering_2)
filtered$Sub_metering_3 <- as.numeric(filtered$Sub_metering_3)
filtered$datetime <- dmy_hms(paste(filtered$DateStr, filtered$Time))
png(filename = "plot4.png", width = 480, height = 480)
p1 <- ggplot(aes(datetime, Global_active_power), data = filtered) + geom_line()
p2 <- ggplot(aes(datetime, Voltage), data = filtered) + geom_line()
p3 <- ggplot() + ylab("Energy sub metering") +
    geom_line(aes(datetime, Sub_metering_1, colour="LINE1"), data = filtered, col = "black") +
    geom_line(aes(datetime, Sub_metering_2, colour="LINE2"), data = filtered, col = "red") +
    geom_line(aes(datetime, Sub_metering_3, colour="LINE3"), data = filtered, col = "blue") +
    scale_colour_manual(name = "SVF", values=c("LINE1"="#f04546","LINE2"="#3591d1","LINE3"="#62c76b"), labels=c("one", "two", "tree"), guide = "legend")
p4 <- ggplot(aes(datetime, Global_reactive_power), data = filtered) + geom_line()
library(gridExtra)
grid.arrange(p1, p2, p3, p4, ncol=2, nrow=2)
dev.off()
