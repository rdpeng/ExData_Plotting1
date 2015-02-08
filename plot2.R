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

make.global.active.power.plot <- function()
{
  plot(x = powerConsumptionData$Time, 
       y = powerConsumptionData$Global_active_power, 
       type = "l",
       xlab = "",
       ylab = "Global Active Power (kilowatts)")
}

makePlot.2 <- function(filename = "plot2.png")
{
  make.global.active.power.plot()
  dev.copy2png(filename)
}

makePlot.2()

