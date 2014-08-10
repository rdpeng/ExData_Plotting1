household_power_consumption <- read.csv("C:/Users/Joanna/Desktop/grafiki R/as 1/household_power_consumption.txt", na.strings = "?", sep=";")
dane<-household_power_consumption[household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007" ,]

par(mfrow=c(1,1))


plot(as.numeric(dane$Sub_metering_1), labels = FALSE, tick = FALSE, type="l", col="grey", ylim=c(0,40), xlab="", ylab="Energy sub metering")
# dodaj w dolnej osi dni tygodnia zamiast liczb
#patrz na pionowa os
axis(side = 1, at =c(1,length(dane$Global_active_power)/2,length(dane$Global_active_power)),  labels = c("Thu", "Fri", "Sat"))
axis(side = 2, at =c(0,10,20,30), labels=c(0,10,20,30))

lines(as.numeric(dane$Sub_metering_2), col="red") #tu jakby inne dane... musialam przez 10 podzielic
lines(as.numeric(dane$Sub_metering_3), col="blue")

legend("topright", adj = c(0, 0.6),lty = 1, col = c("grey", "red", "blue"),cex = 0.6, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png") 
dev.off() 
