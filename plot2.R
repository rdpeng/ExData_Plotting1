## Examine how household energy usage varies over a 2-day period in February, 2007.
## This function creates a graph of Global Active Power usage over two day period
## for the dates 1/2/2007 and 2/2/2007
plot2 <- function(){
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
    
  # check if there is any invalid data
  gap <- febData$Global_active_power
  invalid <- is.na(gap)
  gapValid <- gap[!invalid]
  
  febDataValid <- febData[!invalid,]
  datetime = paste(febDataValid$Date, febDataValid$Time)
  datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
  
  ## Construct the plot and save it to a PNG file with a width of 480 pixels 
  ## and a height of 480 pixels.
  png(filename = "plot2.png", width=480, height=480)
  plot(datetime, as.numeric(gapValid), type='l', xlab="", ylab="Global Active Power (kilowatts)")
  
  #dev.copy(png, file="plot2.png")
  dev.off()
 
}