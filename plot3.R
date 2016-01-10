mydata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c(rep("character",2), rep("numeric",7)),na="?")
mydata$Time <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata <- subset(mydata, Date %in% as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"))



png("plot3.png")

plot(mydata$Time, mydata$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(mydata$Time, mydata$Sub_metering_2, col="red")
lines(mydata$Time, mydata$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)

dev.off()
