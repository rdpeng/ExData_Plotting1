## Examine how household energy usage varies over a 2-day period in February, 2007.
## This function creates a histogram of Global Active Power versus frequency.
## for the dates 1/2/2007 and 2/2/2007
plot1 <- function(){
  #dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  ## Read the data
  #download.file(dataUrl, ".\\household_power_consumption.zip", mode="wb")
  
  ## Extract compressed file
  #unzip(".\\household_power_consumption.zip")
  
  ## Read Data   
  data <- read.table(".\\household_power_consumption.txt", sep=";", header=TRUE, colClasses="character", na.strings="?")

  # Filter the data of interest
  #
  useflags <- data$Date == "1/2/2007"
  part1 <- data[useflags,]
  
  useflags <- data$Date == "2/2/2007"
  part2 <- data[useflags,]
  
  gap1 <- part1$Global_active_power
  
  gap2 <- part2$Global_active_power
  
  gap <- append(gap1,gap2)
  
  # check if there is any invalid data
  invalidData <- is.na(gap)
  gapValid <- gap[!invalidData]
  
  ## Construct the plot and save it to a PNG file with a width of 480 pixels 
  ## and a height of 480 pixels.
  
  hist(as.numeric(gapValid), main="Global Active Power", xlab="Global Active Power", col="chocolate")
  dev.copy(png, file="plot1.png")
  dev.off()
  
  
}