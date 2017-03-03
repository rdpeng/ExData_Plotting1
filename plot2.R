# Making plot2.png 
# this code assumes you have downloaded and unzipped the data file to your working directory.
# the Data is available at:  https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

library(dplyr)

##Create a dataframe
power_data <- read.csv("household_power_consumption.txt", sep = ";", header=TRUE, 
                       stringsAsFactors = FALSE, na.strings = "?")

## Create a subset for the dates: 2007/2/1 and 2007/2/2
power_subset <- filter(power_data, Date %in% c("1/2/2007", "2/2/2007"))

## Create a datetime column that combines Date and Time values 
power_subset$DateTime <- strptime(paste(power_subset$Date, power_subset$Time), "%d/%m/%Y %H:%M:%S")

#Create plot2.png

png("plot2.png", width=480, height=480)
plot(power_subset$DateTime, power_subset$Global_active_power, type="l", 
     ylab = "Global Active Power (kilowatts)", xlab = NA)

dev.off()
