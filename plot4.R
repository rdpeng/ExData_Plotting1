
rm(list = ls())

#pull in data

data <- read.table("household_power_consumption.txt",sep=";", na.strings="?", nrow=2075259, stringsAsFactors=F, header=T)

#subset for desired dates

data.S <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
rm(data)

#create timestamp variable

data.S$timestamp <- as.POSIXct(paste(as.Date(data.S$Date, format="%d/%m/%Y"), data.S$Time, sep=" "))

#Plot 4

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2, 2))

with(data.S, plot(Global_active_power ~ timestamp, 
	type = "l", xlab = "", 
	ylab = "Global Active Power"))

with(data.S, plot(Voltage ~ timestamp, 
	type = "l", xlab = "datetime", 
	ylab = "Voltage"))
	
with(data.S, plot(Sub_metering_1 ~ timestamp, type = "l", ylab = "Energy sub metering", xlab = ""))
with(data.S, lines(Sub_metering_2 ~ timestamp, col = "red"))
with(data.S, lines(Sub_metering_3 ~ timestamp, col = "blue"))
legend("topright", names(data.S)[7:9], lty = 1, col=c("black", "red", "blue"), bty="n")

with(data.S, plot(Global_reactive_power~timestamp, 
	type="l", xlab="datetime", 
	ylab="Global_reactive_power"))	

dev.off()