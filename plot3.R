## Examine how household energy usage varies over a 2-day period in February, 2007.
## This function creates a graph of Sub meter Power usage over two day period
## for the dates 1/2/2007 and 2/2/2007
plot3 <- function(){
  dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  ## Read the data
  download.file(dataUrl, ".\\household_power_consumption.zip", mode="wb")
  
  ## Extract compressed file
  unzip(".\\household_power_consumption.zip")
  
  ## Read Data   
  data <- read.table(".\\household_power_consumption.txt", sep=";", header=TRUE, colClasses="character", na.strings="?")

  # Filter the data of interest
  #
  useflags <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
  febData <- data[useflags,]

  datetime = paste(febData$Date, febData$Time)
  datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
  
  ## Construct the plot and save it to a PNG file with a width of 480 pixels 
  ## and a height of 480 pixels.
  png(filename = "plot3.png", width=480, height=480)
  with(febData, plot(datetime, as.numeric(febData$Sub_metering_1), col= "black", type='l', xlab="", ylab="Energy sub metering"))
  with(febData, lines(datetime, as.numeric(febData$Sub_metering_2), col= "red"), type='l')
  with(febData, lines(datetime, as.numeric(febData$Sub_metering_3), col= "blue"), type='l')
  legend("topright", pch=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex = 0.7)
  #dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
 
}