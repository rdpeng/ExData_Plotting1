png(file="plot1.png");
tempData = read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';');
hist(tempData$Global_active_power,main="Global Active Power", col="red");
dev.off();
