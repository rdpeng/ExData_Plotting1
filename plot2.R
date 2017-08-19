#Read text document and create a table
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Create correct variables
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
global_active_power <- as.numeric(subSetData$Global_active_power)

#PLOT2
date <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(date, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()