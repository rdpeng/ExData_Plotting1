library(grDevices)

# read the data from the .csv file
powerConsumptionData <- read.csv("CourseProject1.csv", sep = ";", na.strings = "?")

# Format the '$Time' column as a date & time
dateAndTime <- paste(powerConsumptionData$Date, powerConsumptionData$Time)
powerConsumptionData$Time <- strptime(dateAndTime, format = "%d/%m/%Y %H:%M:%S")

# Format the '$Date' column as Date only
powerConsumptionData$Date <- as.Date(powerConsumptionData$Date, format = "%d/%m/%Y")

dev.copy2png <- function(filename, ...)
{
  dev.copy(png, filename = filename, ...)
  dev.off()
}

make.submetering.plot <- function()
{
  # base plot including sub-metering-1 by time
  col.sm.1 <- "black"
  plot(x = powerConsumptionData$Time, 
       y = powerConsumptionData$Sub_metering_1, 
       type = "l",
       xlab = "",
       ylab = "Energy sub metering",
       col  = col.sm.1)
  
  # add lines with sub-metering-2 by time
  col.sm.2 <- "red"
  lines(x = powerConsumptionData$Time, 
        y = powerConsumptionData$Sub_metering_2,
        col = col.sm.2)
  
  # add lines with sub-metering-3 by time
  col.sm.3 <- "blue"
  lines(x = powerConsumptionData$Time, 
        y = powerConsumptionData$Sub_metering_3,
        col = col.sm.3)
  
  legend("topright",
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c(col.sm.1, col.sm.2, col.sm.3),
         lwd = 1,
         cex = 0.8)  
}

makePlot.3 <- function(filename = "plot3.png")
{
  make.submetering.plot()
  
  # now copy the plot to a png file
  dev.copy2png(filename)
}

makePlot.3()

