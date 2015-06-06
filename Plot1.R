#####Course Project

mydata2 <- read.csv("C:/Users/vchan/Desktop/Exploratory Data Analysis/household_power_consumption.txt", header = T, sep=";", na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#combo <- paste(mydata2$Dates, mydata2$Time)
#combotime <-strptime(combo, "%m/%d/%Y %H:%M:%S")
#mydata2$Time <-strptime(combo, "%m/%d/%Y %H:%M:%S")

mydata2$Date <- as.Date(mydata2$Date, format="%d/%m/%Y")
datetime <- paste(mydata2$Date, mydata2$Time)
mydata2$Time <- as.POSIXct(datetime)
Data <- subset(mydata2,Date >= "2007-02-01" & Date <= "2007-02-02")

#################PLOT 1#####################

#Creating hist plot
hist(Data$Global_active_power, main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

#Saving files in png
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()
