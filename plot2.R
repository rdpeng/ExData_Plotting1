png(file="plot2.png");
tempData = read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';');
tempData$Date <- as.Date(tempData$Date,format="%d/%m/%Y");
tempData$Time <- as.character(tempData$Time);
dateTime <- as.POSIXct(paste(tempData$Date,tempData$Time));
plot(dateTime,tempData$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="");
dev.off();
