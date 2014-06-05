setwd("C:/Users/558966/Documents/Coursera")
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses = c("factor", "factor","numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"))

data$date.new <- as.Date(data$Date, format ="%d/%m/%Y")
data.new <- subset(data, data$date.new >= '2007-02-01' & data$date.new <= '2007-02-02')

data.new$datetime<-paste(data.new$date.new,data.new$Time, sep=" ")
data.new$datetime.new<-as.POSIXct(data.new$datetime)

par(mfrow=c(2,2))

plot(data.new$datetime.new, data.new$Global_active_power,type = "l",ylab = "Global Active Power", xlab = "")

plot(data.new$datetime.new, data.new$Voltage,type = "l",ylab = "Voltage", xlab = "datetime")

plot(data.new$datetime.new, data.new$Sub_metering_1,type = "l",ylab = "Energy sub metering", xlab = "")
lines (data.new$datetime.new, data.new$Sub_metering_2, col = 'red')
lines (data.new$datetime.new, data.new$Sub_metering_3, col = 'blue')
legend("topright", lty=c(1,1,1), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"),pt.cex=1,cex=0.5)

plot(data.new$datetime.new, data.new$Global_reactive_power,type = "l",ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png,'plot4.png', width = 480, height = 480)
dev.off()
