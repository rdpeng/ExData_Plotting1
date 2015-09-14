# PGK1_4
setwd("C:/Users/Takis/Documents/GitHub/ExData_Plotting1")
#read data
datafilen <- "household_power_consumption.txt"
AllData <- read.table(datafilen, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
AllData$Time <- strptime(paste(AllData$Date, AllData$Time), "%d/%m/%Y %H:%M:%S")
AllData$Date <- as.Date(AllData$Date, "%d/%m/%Y")
ndates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
AllData <- subset(AllData, Date %in% ndates)
#plot
#
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))	
plot(AllData$Time, AllData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(AllData$Time, AllData$Voltage, type = "l", xlab = "datetime", ylab = "Global Active Power")
plot(AllData$Time, AllData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(AllData$Time, AllData$Sub_metering_2, type="l", col="red")
lines(AllData$Time, AllData$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
plot(AllData$Time, AllData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Active Power")
#
dev.off()
