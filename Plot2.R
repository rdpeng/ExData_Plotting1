  ## Reading text file data into data frame 'd'
  d = read.table(file = "household_power_consumption.txt", header = T, sep = ";", na.strings = "?", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  
  d1 <- subset(d, Date == "1/2/2007") ##Susetting the 1st Feb 2007 data into d1 data frame
  
  d2 <- subset(d, Date == "2/2/2007") ##Susetting the 2nd Feb 2007 data into d2 data frame
  
  newdf <-rbind(d1,d2) ## Combining both the sub data frames into 'newdf'
  
  
  newdf$Date <-as.character(newdf$Date) ##Converting the "Date" variable from Factor to Character format
  newdf$Time <- as.character(newdf$Time) ##Converting the "Time" variable from Factor to Character format
  
  newdf$Date <-as.Date(newdf$Date, format = "%d/%m/%Y") ##Converting the "Date" variable from character to Date format
  
  newdf$datetime <-paste(newdf$Date, newdf$Time) ##Pasting Date & Time variables into a single column for applying strptime function
  
  newdf$datetime <- strptime(newdf$datetime, format = "%Y-%m-%d %H:%M:%S") ## Applying strptime() function
  
  par(mfrow = c(1,1)) ## Setting the plot area back to normal, in case it was changed
  
  with(newdf, plot(datetime, Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (Kilowatts)"))
  
  dev.copy(png, file = "plot2.png") ##copping the plot graph to a PNG file
  
  dev.off() ## Closing the PNG file
  
  ##Thanks for reviewing this code
  
