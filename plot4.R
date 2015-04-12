## Examine how household energy usage varies over a 2-day period in February, 2007.
## This function creates graphs of Global Active Power, Voltage, Sub meter Power usage and Global reactive power over two day period
## for the dates 1/2/2007 and 2/2/2007
plot4 <- function(){
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
  png(filename = "plot4.png", width=480, height=480)
  par(mfrow = c(2, 2))
  with(febData, {
    plot(datetime, as.numeric(febData$Global_active_power), col= "black", type='l', xlab="", ylab="Global Active Power")    
    plot(datetime, as.numeric(febData$Voltage), col= "black", type='l', xlab="datetime", ylab="Voltage")    
    plot(datetime, as.numeric(febData$Sub_metering_1), col= "black", type='l', xlab="", ylab="Energy sub metering")
      lines(datetime, as.numeric(febData$Sub_metering_2), col= "red", type='l')
      lines(datetime, as.numeric(febData$Sub_metering_3), col= "blue", type='l')
      legend("topright", pch=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex = 0.7)
    plot(datetime, as.numeric(febData$Global_reactive_power), col= "black", type='l', xlab="datetime", ylab="Global_reactive_power")
  } )
  dev.off()
 
}
