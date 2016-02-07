data <- "household_power_consumption.txt"
alldata <- read.table(data, header=TRUE, sep=";", dec = ".")
df <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png(filename = "plot3.png", width = 480, height = 480)
plot(datetime, as.numeric(df$Sub_metering_1),col = "black", type="l",xlab = "", ylab = "Energy Sub Metering")
lines(datetime, as.numeric(df$Sub_metering_2), col="red", type = "l")
lines(datetime, as.numeric(df$Sub_metering_3), col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))  
dev.off()
