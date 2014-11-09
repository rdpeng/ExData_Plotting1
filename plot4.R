## plot the four subplot against the date time
plot4 <- function() {
  ## import the data from data file
  dataset <- read.table('household_power_consumption.txt', sep = ';',
                        colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                        na.strings = c("?"), header=TRUE)
  
  ## subsetting
  e <- subset(dataset, dataset$Date %in% c('1/2/2007', '2/2/2007'))
  ## combining date and time
  e$datetime<-strptime(paste(e$Date, e$Time), "%d/%m/%Y %H:%M:%S")
  
  ## get the graphics device ready
  png("figure/plot4.png", width = 480, height = 480, units = "px")
  
  # multiplot
  par(mfrow = c(2, 2))
  
  # plotting Global Active Power
  plot(e$datetime, e$Global_active_power, xlab = "", 
       ylab = "Global Active Power", type = "l")
  
  # plotting the Voltage
  plot(e$datetime, e$Voltage, xlab = "datetime", ylab = "Voltage", 
       type = "l")
  
  # plotting Energy sub metering
  plot(e$datetime, e$Sub_metering_1, xlab = "", 
       ylab = "Energy sub metering", col = "black", type = "l")
  lines(e$datetime, e$Sub_metering_2, col = "red")
  lines(e$datetime, e$Sub_metering_3, col = "blue")
  ## legend
  legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col = c('black','red','blue'), lty = 1)
  
  # Global Reactive power
  plot(e$datetime, e$Global_reactive_power, xlab = "datetime", 
       ylab = "Global_reactive_power", type ="l")
  
  ## close the png file
  dev.off()
}