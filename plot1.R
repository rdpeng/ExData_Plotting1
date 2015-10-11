setwd("C://Users//AnujGoyal//Desktop//R//Course4")

electricdata<-read.table("./household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?")

electricdata$Date<-as.Date(electricdata$Date, format="%d/%m/%Y")

electric<-electricdata[(electricdata$Date=="2007-02-01") | (electricdata$Date=="2007-02-02"),]

hist(electric$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")

dev.copy(png,file="plot1.png", width = 480, height=480)

dev.off()
