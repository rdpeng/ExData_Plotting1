# Week 1 Peer Graded Assignment
# Plot 4

# Set working directory
setwd("D:/Data Science/R-Data-Science-Study/Exploratory Analysis/Peer-graded assignment w1")

# Load packages for data cleaning
library(dplyr)
library(lubridate)
library(magrittr)

# Import dataset 128MB
df <- read.delim("household_power_consumption.txt", sep =";")

# summary(df)

# Subset to keep only 2 days
dfsub <- df %>%
      filter(Date %in% c("1/2/2007","2/2/2007")) %>%
      mutate(DateTime = paste(Date, Time, sep=" ")) %>%
      filter(Global_active_power != "?")

# Convert to numeric
# Next review convert using lapply
dfsub$Global_active_power <- as.numeric(dfsub$Global_active_power)
dfsub$Sub_metering_1 <- as.numeric(dfsub$Sub_metering_1)
dfsub$Sub_metering_2 <- as.numeric(dfsub$Sub_metering_2)
dfsub$Sub_metering_3 <- as.numeric(dfsub$Sub_metering_3)

# Clean up Date and Time
dfsub$DateTime <- dmy_hms(dfsub$DateTime)


summary(dfsub)



## Plot 4

png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px")

par(mfrow = c(2, 2))

# Top right
plot(dfsub$DateTime, dfsub$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

# Top left
plot(dfsub$DateTime, dfsub$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

# Bottom right
plot(dfsub$DateTime, dfsub$Sub_metering_1,
     type = "l", ylab = "Energy Submetering", xlab = "")
lines(dfsub$DateTime, dfsub$Sub_metering_2, type = "l", col = "red")
lines(dfsub$DateTime, dfsub$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "o")

# Bottom left
plot(dfsub$DateTime, dfsub$Global_reactive_power,
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()