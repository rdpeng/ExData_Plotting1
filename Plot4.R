#####Course Project

mydata2 <- read.csv("C:/Users/vchan/Desktop/Exploratory Data Analysis/household_power_consumption.txt", header = T, sep=";", na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#combo <- paste(mydata2$Dates, mydata2$Time)
#combotime <-strptime(combo, "%m/%d/%Y %H:%M:%S")
#mydata2$Time <-strptime(combo, "%m/%d/%Y %H:%M:%S")

mydata2$Date <- as.Date(mydata2$Date, format="%d/%m/%Y")
datetime <- paste(mydata2$Date, mydata2$Time)
mydata2$Time <- as.POSIXct(datetime)
Data <- subset(mydata2,Date >= "2007-02-01" & Date <= "2007-02-02")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(Data$Global_active_power~Data$Time,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(Data$Voltage~Data$Time,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(Data$Time, Data$Sub_metering_1,type="l",col="black",ylab ="Energy sub metering",xlab="")
lines(Data$Time, Data$Sub_metering_2,col="red")
lines(Data$Time, Data$Sub_metering_3,col="blue")
legend("topright",bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(Data$Global_reactive_power~Data$Time,type="l",ylab="Global Active Power (kilowatts)",xlab="")


dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()
