##Loading packages
library(dplyr)

##Reading the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data0 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
data1 <- tbl_df(data0)

##Processing the data
data1 <- data1 %>% mutate(Global_active_power:Sub_metering_3 == as.numeric(Global_active_power:Sub_metering_3))
data1$Date <- as.character(data1$Date)
data1$Time <- as.character(data1$Time)
data2 <- mutate(data1, datetime = paste(Date, Time))
data2$datetime <- strptime(data2$datetime, "%d/%m/%Y %H:%M:%S")

data3 <- select(data2, datetime, Global_active_power:Sub_metering_3)

##Removing useless data
rm(data, data0, data1, data2)

##Making Plot 2
png("Plot2.png")
plot(data3$datetime, data3$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()