## plot the Global Active Power against the date time
plot2 <- function() {
  ## import the data from data file
  dataset <- read.table('household_power_consumption.txt', sep = ';',
                        colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                        na.strings = c("?"), header=TRUE)
  
  ## subsetting
  e <- subset(dataset, dataset$Date %in% c('1/2/2007', '2/2/2007'))
  ## combining date and time
  e$datetime<-strptime(paste(e$Date, e$Time), "%d/%m/%Y %H:%M:%S")
  
  ## get the graphics device ready
  png("plot2.png", width = 480, height = 480, units = "px")
  ## plotting
  plot(e$datetime,e$Global_active_power, xlab ="", 
       ylab = "Global Active Power (kilowatts)", type ="l")
  ## close the png file
  dev.off()
}