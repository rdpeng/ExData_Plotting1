x<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
a<-x[x[,1]=="2/2/2007"]
b<-x[x[,1]=="1/2/2007",]
c<-rbind(b,a)
c[,3]<-as.numeric(as.character(c[,3]))
t<-paste(c[,1],c[,2])
newdt<-strptime(t,'%d/%m/%Y %H:%M:%S')
plot(newdt,c[,3],lwd=1,xlab="",ylab="Global Active Power(kilowatts)",main="",type="l",lty=1)
dev.copy(png,file="plot2.png")
dev.off()