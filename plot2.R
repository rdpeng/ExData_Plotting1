setwd("C:/Users/Rebecca/Desktop/GitHub/Course Project 1")
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
Data$Global_active_power=as.numeric(Data$Global_active_power)

Data$datetime <- strptime(paste(Data$Date, Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(Data$datetime, Data$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
dev.off()