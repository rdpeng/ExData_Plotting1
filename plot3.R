getwd()
 # Read the file
 dataFile <- "./household_power_consumption.txt"  
 data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")  
 # subset it or filter it 
 subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]  
   
 # Keep only numeric data
 dateformat <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
 
 globalActivePower <- as.numeric(subSetData$Global_active_power)  
 subMetering1 <- as.numeric(subSetData$Sub_metering_1)  
 subMetering2 <- as.numeric(subSetData$Sub_metering_2)  
 subMetering3 <- as.numeric(subSetData$Sub_metering_3)  
 

#Plot and Export to PNG format
 png("plot3.png", width=480, height=480)  
 plot(dateformat, subMetering1, type="l", ylab="Energy Submetering", xlab="")  
 lines(dateformat, subMetering2, type="l", col="red")  
 lines(dateformat, subMetering3, type="l", col="blue")  
 legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))  
  dev.off() 
