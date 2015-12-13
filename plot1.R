setwd("~/Desktop/BigData_Cousera")
library(graphics)
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
##subsetting the data
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subData$Global_active_power)
##plot1
par(pin=c(5, 5))
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
##saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
