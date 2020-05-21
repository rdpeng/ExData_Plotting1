setwd("/Users/josephlamps/Downloads")

hpc <- read.table("household_power_consumption.txt", sep=";")
subsethpc <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")

#1st plot
hist(as.numeric(subsethpc$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")