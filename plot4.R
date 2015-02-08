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
         bty = "n")  
}

make.global.active.power.plot <- function()
{
  plot(x = powerConsumptionData$Time, 
       y = powerConsumptionData$Global_active_power, 
       type = "l",
       xlab = "",
       ylab = "Global Active Power")
}

make.voltage.plot <- function()
{
  plot(x = powerConsumptionData$Time,
       y = powerConsumptionData$Voltage,
       type = "l",
       xlab = "datetime",
       ylab = "Voltage")
}

make.global.reactive.power.plot <- function()
{
  plot(x = powerConsumptionData$Time,
       y = powerConsumptionData$Global_reactive_power,
       type = "l",
       xlab = "datetime",
       ylab = "Global_reactive_power")  
}

makePlot.4 <- function(filename = "plot4.png")
{
  # arrange the following plots in a 2x2 matrix,
  # to be filled in row-wise
  par(mfrow = c(2,2))
  
  # row 1, col 1: active power plot
  make.global.active.power.plot()
  
  # row 1, col 2: voltage
  make.voltage.plot()
  
  # row 2, col 1: energy submetering
  make.submetering.plot()
  
  # row 2, col 2: global reactive power
  make.global.reactive.power.plot()
  
  # now copy the plot to a png file
  dev.copy2png(filename)
}

makePlot.4()

