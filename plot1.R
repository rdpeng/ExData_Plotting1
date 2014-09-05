## load in necessary libraries
library(dplyr)
library(data.table)

## reads in data from file then subsets data for specified dates
fh <- fread("./household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
pwrcons <- filter(fh, grep("^[1,2]/2/2007", Date))

## Create histogram for Global Active Power
pwrcons$Global_active_power <- as.numeric(as.character(pwrcons$Global_active_power))
hist(pwrcons$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## Save histogram as png file
dev.copy(png, file = "plot1.png")
dev.off()