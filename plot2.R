# load in necessary libraries
library(dplyr)
library(data.table)

# reads in data from file then subsets data for specified dates
fh <- fread("./household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
pwrcons <- filter(fh, grep("^[1,2]/2/2007", Date))

# convert global active power column to numeric
pwrcons$Global_active_power <- as.numeric(as.character(pwrcons$Global_active_power))

#Creates new column that combines date and time data 
pwrcons$Timestamp <-paste(pwrcons$Date, pwrcons$Time)

# Creates graph of date/time vs global active power data
plot(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")

## Save graph as png file
dev.copy(png, file = "plot2.png")
dev.off()