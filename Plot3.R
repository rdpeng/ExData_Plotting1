#####Course Project

mydata2 <- read.csv("C:/Users/vchan/Desktop/Exploratory Data Analysis/household_power_consumption.txt", header = T, sep=";", na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#combo <- paste(mydata2$Dates, mydata2$Time)
#combotime <-strptime(combo, "%m/%d/%Y %H:%M:%S")
#mydata2$Time <-strptime(combo, "%m/%d/%Y %H:%M:%S")

mydata2$Date <- as.Date(mydata2$Date, format="%d/%m/%Y")
datetime <- paste(mydata2$Date, mydata2$Time)
mydata2$Time <- as.POSIXct(datetime)
Data <- subset(mydata2,Date >= "2007-02-01" & Date <= "2007-02-02")

#####PLOT3
plot(Data$Time, Data$Sub_metering_1,type="l",col="black",ylab ="Energy sub metering",xlab="")
lines(Data$Time, Data$Sub_metering_2,col="red")
lines(Data$Time, Data$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()
