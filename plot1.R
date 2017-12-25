  ## Reading text file data into data frame 'd'
  d = read.table(file = "household_power_consumption.txt", header = T, sep = ";", na.strings = "?", col.names = c("Date", 
                "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  
  d1 <- subset(d, Date == "1/2/2007") ##Susetting the 1st Feb 2007 data into d1 data frame
  
  d2 <- subset(d, Date == "2/2/2007") ##Susetting the 2nd Feb 2007 data into d2 data frame
  
  newdf <-rbind(d1,d2) ## Combining both the sub data frames into 'newdf'
  
  par(mfrow = c(1,1)) ## Setting the plot area back to normal, in case it was changed
  
  with(newdf, hist(newdf$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")) ## Plotting an Histogram using 'newdf' data frame
  
  dev.copy(png, file = "plot1.png") ##copping the histogram to a PNG file
  
  dev.off() ## Closing the PNG file
  
  ##Thanks for reviewing this code