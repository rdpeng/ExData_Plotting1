# Course Project 1
# plot1.R

# Read the data
setwd("/Users/garygsw/Coursera/Exploratory Data Analysis")
usage <- read.table("./data/household_power_consumption.txt", sep = ";",
                    header = TRUE, na.strings = "?",
                    colClasses = c("character", "character", "numeric", "numeric",
                                   "numeric", "numeric", "numeric", "numeric"))

# Subset the data to a 2-day period in February
feb_usage <- subset(usage, Date == "1/2/2007" | Date == "2/2/2007")

# Plot the histogram
hist(feb_usage$Global_active_power, main = "Global Active Power", col = "red",
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
