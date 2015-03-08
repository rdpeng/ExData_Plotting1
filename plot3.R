# EDA - WEEK 1 - Assignment 1
dataset <- read.table("household_power_consumption.txt", 
	header = TRUE, sep = ";", na.strings = "?")
subdata <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),] 
# Subset the data data from the dates 2007-02-01 and 2007-02-02
datetime <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S") 
#Convert the Date/Time variables to Date/Time classes, 
#bring data and time in one variable

#Plot 3
plot(datetime, subdata$Sub_metering_1, 
	xlab = "",
	ylab = "Energy sub metering", 
	type = "n")
lines(datetime, subdata$Sub_metering_1, col = "black")
lines(datetime, subdata$Sub_metering_2, col = "red")
lines(datetime, subdata$Sub_metering_3, col = "blue")
legend ("topright",
	col = c("Black", "red", "blue"), 
	legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	cex=0.8,lwd=1)
dev.copy(png, file = "plot3.png") # create my plot to a PNG file
dev.off() # close the png device

#Please note that the difference in the x axis is due to the different language of the configuration system
