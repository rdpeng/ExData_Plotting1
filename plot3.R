# Course Project 1
# plot3.R

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

# Plot the line charts
png("plot3.png")
with(feb_usage, {
         plot(Datetime, Sub_metering_1, type="l",
              ylab = "Energy sub metering", xlab = "")
         lines(Datetime, Sub_metering_2, col = "red")
         lines(Datetime, Sub_metering_3, col = "blue")
         legend("topright", col = c("black", "red", "blue"), lwd = 2,
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                text.width = 43000)
    }
)
dev.off()
