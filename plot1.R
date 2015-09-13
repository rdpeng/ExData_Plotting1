Enter file contents heregetwd()
 # Read the file
 dataFile <- "./household_power_consumption.txt"  
 data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")  
 # subset it or filter it 
 subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]  
   
 # Keep only numeric data
 globalActivePower <- as.numeric(subSetData$Global_active_power)  
 #Plot and Exprot to PNG format
 png("plot1.png", width=480, height=480)  
 hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
 dev.off() 
