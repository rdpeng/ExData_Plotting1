## plot the hist diagram of Global Active Power
plot1 <- function() {
  ## import the data from data file
  dataset <- read.table('household_power_consumption.txt', sep = ';',
                        colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                        na.strings = c("?"), header=TRUE)
  
  ## subsetting
  e <- subset(dataset, dataset$Date %in% c('1/2/2007', '2/2/2007'))
  
  ## get the graphics device ready
  png("figure/plot1.png", width = 480, height = 480, units = "px")
  hist(e$Global_active_power, xlab="Global Active Power (kilowatts)", 
       ylab = "Frequency", col="red", main="Global Active Power")
  ## close the png file
  dev.off()
}