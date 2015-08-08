datAnalysis<-read.table("household_power_2days.txt",sep=" ");
datAnalysis[,7]<-as.numeric(datAnalysis[,7]);
datAnalysis[,8]<-as.numeric(datAnalysis[,8]);
datAnalysis[,9]<-as.numeric(datAnalysis[,9]);
datAnalysis[,10]<-paste(datAnalysis[,1],datAnalysis[,2]);
datetime<-strptime(datAnalysis[,10],format="%d/%m/%Y %H:%M:%S");
png("plot3.png")
plot(datetime,datAnalysis[,7],type="l",col="black",ylab="Engergy sub metering",
     xlab="");
lines(datetime,datAnalysis[,8],type="l",col="red");
lines(datetime,datAnalysis[,9],type="l",col="blue");
legend(x="topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),
       lwd=2,col=c("black","red","blue"),text.col=c("black","red","blue"),
       xjust=1,text.font=9);
dev.off();
