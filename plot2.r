## Exploratory Data Analysis  -  Donald J Reilly
## Course Project 1 - Electric Power Consumption
## Plot 2 - Lines plot w/ weekday x axis lable in b/w
##
setwd("C:/Users/DJR/My Documents/Coursera R/Exploratory Data Analysis/Course Project 1")
column.names <- c("Date", "Time", "GAP", "GRP", "Voltage", "GI", "SM1", "SM2", "SM3")
column.Classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
EPC_DF <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
           col.names=column.names, colClasses=column.Classes, stringsAsFactors=FALSE)
EPC_DF <- subset(EPC_DF, Date == "1/2/2007" | Date == "2/2/2007")
EPC_DF$DTstamp <- as.POSIXct(paste(EPC_DF$Date, EPC_DF$Time), "%d/%m/%Y %H:%M:%S", tz="") 
png(filename="plot2.png", width=480, height=480, units="px")
plot(EPC_DF$DTstamp, EPC_DF$GAP, type="l", ylab="Global Active Power (kilowatts)", xlab=" ")
dev.off()
