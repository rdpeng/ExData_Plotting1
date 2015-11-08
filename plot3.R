# Plot 3: Line chart of Energy Sub-metering vs. Thu / Fir / Sat from "household_power_consumption.txt" dataset
setwd("C:/Users/Michelle/dataScience/ExploratoryData")

# Read the text file and handle missing dataset values which are coded as "?" 
mydata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert between character representations and objects of class "Date" representing calendar dates
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

# Subset dates to analyze:  2007-02-01 and 2007-02-02
subsetdata <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$datetime <- as.POSIXct(datetime)

# Plot 3: no title, x-axis label, y-axis label 
plot(subsetdata$Sub_metering_1~subsetdata$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(subsetdata$Sub_metering_2~subsetdata$datetime, col="Red")
lines(subsetdata$Sub_metering_3~subsetdata$datetime, col="Blue")

# Save Plot 3 to a PNG file named "plot1.png" which has a width of 480 pixels and a height of 480 pixels
dev.copy(png, file='plot3.png', height=480, width=480)
plot(subsetdata$Sub_metering_1~subsetdata$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(subsetdata$Sub_metering_2~subsetdata$datetime, col="Red")
lines(subsetdata$Sub_metering_3~subsetdata$datetime, col="Blue")
dev.off()
