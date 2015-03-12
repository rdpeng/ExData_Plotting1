## plot the Energy sub metering against the date time
plot3 <- function() {
  ## import the data from data file
  dataset <- read.table('household_power_consumption.txt', sep = ';',
                        colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                        na.strings = c("?"), header=TRUE)
  
  ## subsetting
  e <- subset(dataset, dataset$Date %in% c('1/2/2007', '2/2/2007'))
  ## combining date and time
  e$datetime<-strptime(paste(e$Date, e$Time), "%d/%m/%Y %H:%M:%S")
  
  ## get the graphics device ready
  png("plot3.png", width = 480, height = 480, units = "px")
  ## plotting
  plot(e$datetime, e$Sub_metering_1, xlab = "", 
       ylab = "Energy sub metering", col = "black", type = "l")
  lines(e$datetime, e$Sub_metering_2, col = "red")
  lines(e$datetime, e$Sub_metering_3, col = "blue")
  ## legend
  legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col = c('black','red','blue'), lty = 1)
  
  ## close the png file
  dev.off()
}