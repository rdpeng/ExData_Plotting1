
getwd()
 # Read the file
 dataFile <- "./household_power_consumption.txt"  
 data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")  
 # subset it or filter it 
 subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]  
   
 # Keep only numeric data
 dateformat <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
 globalActivePower <- as.numeric(subSetData$Global_active_power)  
 #Plot and Exprot to PNG format
 png("plot2.png", width=480, height=480)  
 plot(dateformat, globalActivePower ,type= "l", main="Global Active Power",xlab= " " ,ylab ="Global Active Power (kilowatts)") 
 dev.off() 
