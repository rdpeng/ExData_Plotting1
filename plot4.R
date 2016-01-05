rm(list=ls())
data <- read.table("household_power_consumption.txt",header= TRUE, sep =';', colClasses = "character", na.strings = "?")
df <- subset(data, as.Date(data$Date, "%d/%m/%Y") >= '2007-02-01' & as.Date(data$Date, "%d/%m/%Y") <= '2007-02-02')
rm(data)
datetime <- paste(as.Date(df$Date, "%d/%m/%Y"), df$Time)
df$Datetime <- as.POSIXct(datetime)
cols = c(3:9)
df[, cols] <- apply(df[,cols], 2, function(x) as.numeric(as.character(x)))
png(file="plot4.png",width=600,height=600, units= 'px')
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(df$Global_active_power ~ df$Datetime, type = "l",ylab = "GAP (KW)", xlab = "")
plot(df$Voltage ~ df$Datetime, type = "l",ylab = "Voltage", xlab = "")
plot(df$Sub_metering_1 ~ df$Datetime, type = "l",ylab = "Energy sub metering", xlab = "")
lines(df$Sub_metering_2 ~ df$Datetime, col= "red")
lines(df$Sub_metering_3 ~ df$Datetime, col= "blue")
legend("topright", legend = c("SM_1", "SM_2", "SM_3"),
       col = c("black", "red", "blue"),horiz = TRUE ,lty = 1, cex = .45)
plot(df$Global_reactive_power ~ df$Datetime, type = "l",ylab = "GRP (KW)", xlab = "")
dev.off()



