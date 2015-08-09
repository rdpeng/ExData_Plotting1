# rm(list=ls())
# setwd('C:/Users/mohanbhatia/Desktop/ds/ds4/wk1')

# Read in file
hpc <- "household_power_consumption.txt"
dff <- read.table(hpc, sep=";", header=TRUE, na.strings="?")
dff <- dff[dff$Date %in% c("1/2/2007", "2/2/2007"), ]
dff$Date <- as.Date(strptime(dff$Date, "%d/%m/%Y"))


# Create plot
hist(dff$Global_active_power,
     col = "orangered",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.copy(png,
         file = "plot1.png",
         width = 480,
         height = 480,
         units = "px")
dev.off()