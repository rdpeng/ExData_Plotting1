# Course Project 1
# plot2.R

# Read the data
setwd("/Users/garygsw/Coursera/Exploratory Data Analysis")
usage <- read.table("./data/household_power_consumption.txt", sep = ";",
                    header = TRUE, na.strings = "?",
                    colClasses = c("character", "character", "numeric", "numeric",
                                   "numeric", "numeric", "numeric", "numeric"))

# Subset the data to a 2-day period in February
feb_usage <- subset(usage, Date == "1/2/2007" | Date == "2/2/2007")

# Create a new column for Datetime
feb_usage$Datetime <- as.POSIXlt(paste(feb_usage$Date, feb_usage$Time),
                                 format = "%d/%m/%Y %H:%M:%S")

# Plot the line chart
png("plot2.png")
with(feb_usage, plot(Datetime, Global_active_power, type = "l",
                     ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
