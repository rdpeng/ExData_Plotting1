library(grDevices)

powerConsumptionData <- read.csv("CourseProject1.csv", sep = ";", na.strings = "?")

dev.copy2png <- function(filename, ...)
{
  dev.copy(png, filename = filename, ...)
  dev.off()
}

makePlot.1 <- function(filename = "plot1.png")
{
  hist(powerConsumptionData$Global_active_power, 
       breaks = 12,
       xlab = "Global Active Power (kilowatts)", 
       main = "Global Active Power",
       col = "red")
  dev.copy2png(filename)
}

makePlot.1()

