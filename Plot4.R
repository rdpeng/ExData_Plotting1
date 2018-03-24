# ExploratoryGraphing Exerices
# Aziz Mohammed
# March 23, 2018
# load the dplyr package for handling data frames and lubridate to ahndle Date and Time
library (dplyr)
library(lubridate)
library(png)

# read data as characterandmerge the date and time variable inDateTime variable
hpc <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, stringsAsFactors = FALSE)
na.omit(hpc)
hpc0 <- mutate(hpc, DateTime = paste(Date, Time))
hpc0$DateTime <- parse_date_time(hpc0$DateTime, orders = c("d m y %H:%M:%S"))

hpc0$Global_active_power <- as.numeric(hpc0$Global_active_power)
hpc0$Global_reactive_power <- as.numeric(hpc0$Global_reactive_power)
hpc0$Voltage <- as.numeric(hpc0$Voltage)
hpc0$Global_intensity <- as.numeric(hpc0$Global_intensity)
hpc0$Sub_metering_1 <- as.numeric(hpc0$Sub_metering_1)
hpc0$Sub_metering_2 <- as.numeric(hpc0$Sub_metering_2)
hpc0$Sub_metering_3 <- as.numeric(hpc0$Sub_metering_3) 

# filter the data as needed for the plots requested
hpc2 <- filter(hpc0, DateTime > "2007-01-31 17:24:00", DateTime <= "2007-02-02 17:24:00")

#
png(file = "Plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2, 2), mar = c(4, 4, 2,1))
with(hpc2,{
  plot(hpc2$DateTime, hpc2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  
  plot(hpc2$DateTime, hpc2$Sub_metering_1, type = "l", col ="black", xlab= "",ylab = "Energy Sub Metering")
  lines(hpc2$DateTime, hpc2$Sub_metering_2, col ="red")
  lines(hpc2$DateTime, hpc2$Sub_metering_3, col ="blue")
  legend("topright", pch = "___", col= c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(hpc2$DateTime, hpc2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
  plot(hpc2$DateTime, hpc2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")
})
dev.off()
