# Plot 2: Line chart of Global Active Power vs. Thu / Fri / Sat from "household_power_consumption.txt" dataset
setwd("C:/Users/Michelle/dataScience/ExploratoryData")

# Read the text file and handle missing dataset values which are coded as "?" 
mydata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert between character representations and objects of class "Date" representing calendar dates
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

# Subset dates to analyze:  2007-02-01 and 2007-02-02
subsetdata <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$datetime <- as.POSIXct(datetime)

# Plot 2: no title, x-axis label, y-axis label 
plot(subsetdata$Global_active_power~subsetdata$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Save Plot 2 to a PNG file named "plot2.png" which has a width of 480 pixels and a height of 480 pixels
dev.copy(png, file='plot2.png', height=480, width=480)
dev.off()

