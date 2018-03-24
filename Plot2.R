# ExploratoryGraphing Exerices
# Aziz Mohammed
# March 23, 2018
# load the dplyr package for handling data frames and lubridate package for ahndling Date class
library (dplyr)
library(lubridate)
library(png)

# read data as characterandcombine the Date and Time variable to DateTime variable
hpc <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, stringsAsFactors = FALSE)
na.omit(hpc)
hpc0 <- mutate(hpc, DateTime = paste(Date, Time))
hpc0$DateTime <- parse_date_time(hpc0$DateTime, orders = c("d m y %H:%M:%S"))

# convert vairables to numeric
hpc0$Global_active_power <- as.numeric(hpc0$Global_active_power)
hpc0$Global_reactive_power <- as.numeric(hpc0$Global_reactive_power)
hpc0$Voltage <- as.numeric(hpc0$Voltage)
hpc0$Global_intensity <- as.numeric(hpc0$Global_intensity)
hpc0$Sub_metering_1 <- as.numeric(hpc0$Sub_metering_1)
hpc0$Sub_metering_2 <- as.numeric(hpc0$Sub_metering_2)
hpc0$Sub_metering_3 <- as.numeric(hpc0$Sub_metering_3) 

#isolate data that is needed for the plot required
hpc1 <- select(hpc0, DateTime, Global_active_power)
hpc2 <- filter(hpc1, DateTime > "2007-01-31 17:24:00", DateTime <= "2007-02-02 17:24:00")
png(file = "Plot2.png" , width = 480, height = 480, units = "px")
plot(hpc2$DateTime, hpc2$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")
dev.off()