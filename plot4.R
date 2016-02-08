# Course Project 1
# plot4.R

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

# Plot the charts
png("plot4.png")
par(mfrow = c(2,2))
with(feb_usage, {
        # Plot the top left chart
        plot(Datetime, Global_active_power, type = "l",
             ylab = "Global Active Power", xlab = "")
        
        # Plot the top right chart
        plot(Datetime, Voltage, type = "l", xlab = "datetime")
        
        # Plot the bottom left chart
         plot(Datetime, Sub_metering_1, type="l",
              ylab = "Energy sub metering", xlab = "")
         lines(Datetime, Sub_metering_2, col = "red")
         lines(Datetime, Sub_metering_3, col = "blue")
         legend("topright", col = c("black", "red", "blue"), lwd = 2,
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                text.width = 80000, bty = "n")
         
         # Plot the bottom right chart
         plot(Datetime, Global_reactive_power, type = "l", xlab = "datetime")
    }
)
dev.off()
