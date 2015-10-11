setwd("C://Users//AnujGoyal//Desktop//R//Course4")

electricdata<-read.table("./household_power_consumption.txt",colClasses = "character",sep = ";",header = TRUE, na.strings = "?")

electricdata$Date<-as.Date(electricdata$Date, format="%d/%m/%Y")

electric<-electricdata[(electricdata$Date=="2007-02-01") | (electricdata$Date=="2007-02-02"),]

datetime<-paste(electric$Date,electric$Time)

a<-strptime(datetime,"%Y-%m-%d %H:%M:%S")

electric$datetime<-a

plot(electric$datetime,electric$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", type="l")

dev.copy(png,file="plot2.png", width = 480, height=480)

dev.off()
