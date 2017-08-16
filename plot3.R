x<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
a<-x[x[,1]=="2/2/2007"]
b<-x[x[,1]=="1/2/2007",]
c<-rbind(b,a)
c[,3]<-as.numeric(as.character(c[,3]))
t<-paste(c[,1],c[,2])
newdt<-strptime(t,'%d/%m/%Y %H:%M:%S')
plot(newdt,as.numeric(as.character(c[,7])),lwd=1,xlab="",ylab="Energy sub metering",main="",type="l",lty=1)
lines(newdt,as.numeric(as.character(c[,8])),col="red",lwd=1,xlab="",ylab="Energy sub metering",main="",type="l",lty=1)
lines(newdt,as.numeric(as.character(c[,9])),col="blue",lwd=1,xlab="",ylab="Energy sub metering",main="",type="l",lty=1)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.copy(png,file="plot3.png")
dev.off()
