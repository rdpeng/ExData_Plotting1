# Load the Data
setwd("C:/Users/mhack/Documents/R Projects")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# plot1.png
png(file = "plot1.png", width = 480 , height = 480, bg = "transparent")
hist(as.numeric(subdata$Global_active_power)
     ,main = "Global Active Power", col = "red" , xlab = "Global Active Power (kilowatts)")
dev.off()

# plot2.png       
png(file = "plot2.png", width = 480 , height = 480, bg = "transparent")
plot(as.POSIXct(paste(subdata$Date,subdata$Time),format = "%d/%m/%Y %H:%M"),as.numeric(subdata$Global_active_power)
     , type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

# plot3.png
png(file = "plot3.png", width = 480 , height = 480, bg = "transparent")
plot(as.POSIXct(paste(subdata$Date,subdata$Time),format = "%d/%m/%Y %H:%M"), as.numeric(subdata$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(as.POSIXct(paste(subdata$Date,subdata$Time),format = "%d/%m/%Y %H:%M"), as.numeric(subdata$Sub_metering_2), type="l", col="red")
lines(as.POSIXct(paste(subdata$Date,subdata$Time),format = "%d/%m/%Y %H:%M"), subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

# plot4.png
png(file = "plot4.png", width = 480 , height = 480, bg = "transparent")
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(subdata, {
  plot(as.POSIXct(paste(subdata$Date,subdata$Time),format = "%d/%m/%Y %H:%M"),as.numeric(subdata$Global_active_power)
       , type = "l", xlab="", ylab="Global Active Power (kilowatts)")
  plot(as.POSIXct(paste(subdata$Date,subdata$Time),format = "%d/%m/%Y %H:%M"), 
       as.numeric(subdata$Voltage), type = "l",ylab = "Voltage", xlab = "datetime")
  plot(as.POSIXct(paste(subdata$Date,subdata$Time),format = "%d/%m/%Y %H:%M"), as.numeric(subdata$Sub_metering_1)
       , type="l", ylab="Energy sub metering", xlab="")
  lines(as.POSIXct(paste(subdata$Date,subdata$Time),format = "%d/%m/%Y %H:%M"), as.numeric(subdata$Sub_metering_2)
        , type="l", col="red")
  lines(as.POSIXct(paste(subdata$Date,subdata$Time),format = "%d/%m/%Y %H:%M"), subdata$Sub_metering_3
        , type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  plot(as.POSIXct(paste(subdata$Date,subdata$Time),format = "%d/%m/%Y %H:%M"),as.numeric(Global_reactive_power)
       , type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})
dev.off()
