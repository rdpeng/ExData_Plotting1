##plot1
data<-read.csv("household_power_consumption.txt", sep = ";",stringsAsFactors=FALSE,na.strings = "?")##read all data
newdata <- data[which(data$Date=="1/2/2007"| data$Date =="2/2/2007"), ]##subest data by date
png(filename = "plot1.png",width = 480, height = 480)
hist(newdata$Global_active_power, col="red", ylim = c(0,1200),xlab="Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power")
dev.off()
