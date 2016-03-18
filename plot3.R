
rm(list = ls())

#pull in data

data <- read.table("household_power_consumption.txt",sep=";", na.strings="?", nrow=2075259, stringsAsFactors=F, header=T)

#subset for desired dates

data.S <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
rm(data)

#create timestamp variable

data.S$timestamp <- as.POSIXct(paste(as.Date(data.S$Date, format="%d/%m/%Y"), data.S$Time, sep=" "))

#Plot 3

png("plot3.png", width = 480, height = 480)
	
with(data.S, plot(Sub_metering_1 ~ timestamp, type = "l", ylab = "Energy sub metering", xlab = ""))
with(data.S, lines(Sub_metering_2 ~ timestamp, col = "red"))
with(data.S, lines(Sub_metering_3 ~ timestamp, col = "blue"))
legend("topright", names(data.S)[7:9], lty = 1, col=c("black", "red", "blue"))

dev.off()
