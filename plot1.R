## Download the file and unzip it
setwd('/home/mascc2/R Projects/Coursera/ExploratoryDataAnalysis/program1/')
download.file('http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip','power.zip')
unzip('power.zip')
## load the data
housedata<-read.table('household_power_consumption.txt',header=TRUE, sep=';',dec = '.',na.strings = '?') 
housedata$Dateformated<-as.Date(housedata$Date,'%d/%m/%Y')
housedata$Dateweekdays<-weekdays((housedata$Dateformated))x
dtbegin<-as.Date('2007-02-01')
dtend<-as.Date('2007-02-02')
subset<-housedata[housedata$Dateformated>=dtbegin & housedata$Dateformated<=dtend,]
subset$datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
## build plot 1
png('plot1.png',width=480, height=480)
hist(subset$Global_active_power,col='red',xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.off()