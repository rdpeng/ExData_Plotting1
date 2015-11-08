# Plot 1: Bar chart of Global Active Power vs. Frequency for 2007-02-01 and 2007-02-02 from "household_power_consumption.txt" dataset
setwd("C:/Users/Michelle/Desktop/ExploratoryData")

# Read the text file and handle missing dataset values which are coded as "?" 
mydata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert between character representations and objects of class "Date" representing calendar dates
mydata$Date <- as.Date(mydata$Date, format="%d-%m-%Y")

# Convert between character representations and objects of class "Time" representing standard time
mydata$Time <- strptime(mydata$Time, format="%h:%m:%s")

# Subset dates to analyze:  2007-02-01 and 2007-02-02
subsetdata <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Plot 1: Title, x-axis label, y-axis label, and colored in red
hist(subsetdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save Plot 1 to a PNG file named "plot1.png" which has a width of 480 pixels and a height of 480 pixels
dev.copy(png, file='plot1.png', height=480, width=480)
dev.off
