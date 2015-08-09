# rm(list=ls())
# setwd('C:/Users/mohanbhatia/Desktop/ds/ds4/wk1')

# Read in file
hpc <- "household_power_consumption.txt"
dff <- read.table(hpc, sep=";", header=TRUE, na.strings="?")
dff <- dff[dff$Date %in% c("1/2/2007", "2/2/2007"), ]
dff$timestamp <- 
  strptime(paste(dff$Date, " ", dff$Time),
           format="%d/%m/%Y %H:%M:%S")

# Create plot
plot(dff$timestamp,
     dff$Global_active_power,
     type = "l",
     ann = F)
title(xlab = NULL,
      ylab = "Global Active Power (killowatts)")
dev.copy(png,
         file = "plot2.png",
         width = 480,
         height = 480,
         units = "px")
dev.off()