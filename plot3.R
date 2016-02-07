## Download the file and unzip it
setwd('/home/mascc2/R Projects/Coursera/ExploratoryDataAnalysis/program1/')
download.file('http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip','power.zip')
unzip('power.zip')

## load the data
housedata<-read.table('household_power_consumption.txt',header=TRUE, sep=';',dec = '.',na.strings = '?') 
housedata$Dateformated<-as.Date(housedata$Date,'%d/%m/%Y')
housedata$Dateweekdays<-weekdays((housedata$Dateformated))
dtbegin<-as.Date('2007-02-01')
dtend<-as.Date('2007-02-02')
subset<-housedata[housedata$Dateformated>=dtbegin & housedata$Dateformated<=dtend,]
subset$datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
## build plot 3
png('plot3.png',width=480, height=480)
plot (subset$datetime,subset$Sub_metering_1,type='l',col='black',ylab='Global Active Power (kilowatts)',xlab='')
lines(subset$datetime,subset$Sub_metering_2,col='blue',xlab='')
lines(subset$datetime,subset$Sub_metering_3,col='red',xlab='')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

