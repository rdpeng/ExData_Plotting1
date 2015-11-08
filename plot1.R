curdir <-setwd("D:/coursera/ExploratoryData/Wk1-Lectures/")
file.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(file.url,destfile=paste(curdir,'/exdata-data-household_power_consumption.zip',sep=""))
unzip(paste(curdir,'/exdata-data-household_power_consumption.zip',sep=""),exdir=paste(curdir,sep=""),overwrite=TRUE)
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
graphics.off()
