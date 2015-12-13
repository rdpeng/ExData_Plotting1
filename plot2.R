setwd("~/Desktop/BigData_Cousera")
library(graphics)
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
##subsetting the data
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subData$Global_active_power)
##convert dates
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##plot2
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
##saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
