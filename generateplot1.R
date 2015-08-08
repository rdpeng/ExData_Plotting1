datAnalysis<-read.table("household_power_2days.txt",sep=" ");
GlobalActivePower=datAnalysis[,3];
hist(GlobalActivePower,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red");
dev.copy(png,'plot1.png');
dev.off();