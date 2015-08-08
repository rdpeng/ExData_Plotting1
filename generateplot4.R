datAnalysis<-read.table("household_power_2days.txt",sep=" ");
datAnalysis[,10]<-paste(datAnalysis[,1],datAnalysis[,2]);
datetime<-strptime(datAnalysis[,10],format="%d/%m/%Y %H:%M:%S");
datAnalysis[,4]<-as.numeric(datAnalysis[,4]);
datAnalysis[,5]<-as.numeric(datAnalysis[,5]);
datAnalysis[,7]<-as.numeric(datAnalysis[,7]);
datAnalysis[,8]<-as.numeric(datAnalysis[,8]);
datAnalysis[,9]<-as.numeric(datAnalysis[,9]);

png("plot4.png")
par(mfrow=c(2,2));
##create the first plot
plot(datetime,datAnalysis[,3],type="l",ylab="Global Active Power (kilowatts)",
     xlab="");
##create the second plot
plot(datetime,datAnalysis[,5],type="l",ylab="Voltage");

##create the third plot
plot(datetime,datAnalysis[,7],type="l",col="black",ylab="Engergy sub metering",
     xlab="");
lines(datetime,datAnalysis[,8],type="l",col="red");
lines(datetime,datAnalysis[,9],type="l",col="blue");
legend(x="topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),
       lwd=2,col=c("black","red","blue"),text.col=c("black","red","blue"),
       xjust=1,text.font=7,bty="n");

##create the forth plot
plot(datetime,datAnalysis[,4],type="l",ylab="Global Reactive Power",);
dev.off();