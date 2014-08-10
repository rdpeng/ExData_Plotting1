household_power_consumption <- read.csv("C:/Users/Joanna/Desktop/grafiki R/as 1/household_power_consumption.txt", na.strings = "?", sep=";")
dane<-household_power_consumption[household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007" ,]

par(mfrow=c(1,1))


plot(as.numeric(dane$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)", labels = FALSE, tick = FALSE)
axis(side = 2, at =c(0,2,4,6), labels=c(0,2,4,6))
axis(side = 1, at =c(1,length(dane$Global_active_power)/2,length(dane$Global_active_power)),  labels = c("Thu", "Fri", "Sat"))

dev.copy(png, file = "plot2.png") 
dev.off() 
