#Plot 1
library(data.table) 
File <- "./household_power_consumption.txt"
Data <- read.table(File, sep = ";", header = TRUE, na.strings = "?", 
                   colclasses = c("character", "character", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric", "numeric", "numeric"))
subdata <- subset(Data, Data$Date == "1/2/2007" | Data$Date == "2/2/2007")

png("plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, col = "firebrick1", 
     xlab = "Global Active Power (KiloWatts)", main = "Global Active Power")
dev.off()