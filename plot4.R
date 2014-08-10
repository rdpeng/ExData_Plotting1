household_power_consumption <- read.csv("household_power_consumption.txt", na.strings = "?", sep=";")
dane<-household_power_consumption[household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007" ,]


par(mfrow=c(2,2))

plot(as.numeric(dane$Global_active_power), type="l", xlab="", ylab="Global Active Power", labels = FALSE, tick = FALSE)
axis(side = 2, at =c(0,2,4,6), labels=c(0,2,4,6))
axis(side = 1, at =c(1,length(dane$Global_active_power)/2,length(dane$Global_active_power)),  labels = c("Thu", "Fri", "Sat"))
plot(as.numeric(dane$Voltage), type="l", xlab="datatime", ylab="Voltage", labels = FALSE, tick = FALSE)
axis(side = 2, at =c(234,238,242,246), labels=c(234,238,242,246))
axis(side = 1, at =c(1,length(dane$Global_active_power)/2,length(dane$Global_active_power)),  labels = c("Thu", "Fri", "Sat"))

plot(as.numeric(dane$Sub_metering_1),labels = FALSE, tick = FALSE, type="l", col="grey", ylim=c(0,40), xlab="", ylab="Energy sub metering")

axis(side = 1, at =c(1,length(dane$Global_active_power)/2,length(dane$Global_active_power)),  labels = c("Thu", "Fri", "Sat"))
axis(side = 2, at =c(0,10,20,30), labels=c(0,10,20,30))

lines(as.numeric(dane$Sub_metering_2), col="red") #
lines(as.numeric(dane$Sub_metering_3), col="blue")

legend("topright",  border = c(NA, NA, "black", NA), y.intersp=1,lty = 1, col = c("grey", "red", "blue"),cex = 0.45, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(as.numeric(dane$Global_reactive_power), xlab="datatime",labels = FALSE, tick = FALSE, type="l", ylab="Global_reactive_power")
axis(side = 1, at =c(1,length(dane$Global_active_power)/2,length(dane$Global_active_power)),  labels = c("Thu", "Fri", "Sat"))
axis(side = 2, at =c(0.0,0.1,0.2,0.3,0.4,0.5), labels=c(0.0,0.1,0.2,0.3,0.4,0.5))

dev.copy(png, file = "plot4.png") 
dev.off() 
