datAnalysis<-read.table("household_power_2days.txt",sep=" ");
datAnalysis[,10]<-paste(datAnalysis[,1],datAnalysis[,2]);
datetime<-strptime(datAnalysis[,10],format="%d/%m/%Y %H:%M:%S");
plot(datetime,datAnalysis[,3],type="l",ylab="Global Active Power (kilowatts)",
     xlab="");
dev.copy(png,"plot2.png");
dev.off();
