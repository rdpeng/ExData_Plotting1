setwd("C:/Users/Rebecca/Desktop/GitHub/Course Project 1")
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Data$datetime <- strptime(paste(Data$Date, Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Data$Sub_metering_1=as.numeric(Data$Sub_metering_1)
Data$Sub_metering_2=as.numeric(Data$Sub_metering_2)
Data$Sub_metering_3=as.numeric(Data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(Data$datetime,Data$Sub_metering_1,type="l", xlab=" " ,ylab="Energy sub metering")
lines(Data$datetime,Data$Sub_metering_2,type="l", col="red" )
lines(Data$datetime,Data$Sub_metering_3,type="l" , col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1, 1,1), col=c("black", "red", "blue"))
dev.off()