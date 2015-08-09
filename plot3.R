# rm(list=ls())
# setwd('C:/Users/mohanbhatia/Desktop/ds/ds4/wk1')

# Read in file
hpc <- "household_power_consumption.txt"
dff <- read.table(hpc, sep=";", header=TRUE, na.strings="?")
dff <- dff[dff$Date %in% c("1/2/2007", "2/2/2007"), ]
dff$timestamp <- 
  strptime(paste(dff$Date, " ", dff$Time),
           format = "%d/%m/%Y %H:%M:%S")

# Create plot
plot(dff$timestamp,
     dff$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(dff$timestamp,
      dff$Sub_metering_2,
      type = "l",
      col = "red")
lines(dff$timestamp,
      dff$Sub_metering_3,
      type = "l",
      col = "blue")
legend("topright",
       legend = names(dff[7:9]),
       inset = c(.05,0),
       lty = 1,
       col = c("black","red","blue"),
       bty = "n")
dev.copy(png,
         file = "plot3.png",
         width = 480,
         height = 480,
         units = "px")
dev.off()