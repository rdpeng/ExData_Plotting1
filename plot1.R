household_power_consumption <- read.csv("household_power_consumption.txt", na.strings = "?", sep=";")

dane<-household_power_consumption[household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007" ,]
#rys1
par(mfrow=c(1,1))
hist(as.numeric(dane$Global_active_power), xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")


dev.copy(png, file = "plot1.png") 
dev.off() 
