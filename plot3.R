e<-read.csv2("household_power_consumption.txt",dec=".")
be <- e[(e$Date =="2/2/2007" | e$Date =="1/2/2007"),]
s1 <-be$Sub_metering_1
s1<- as.numeric((as.character(s1)))

s2 <-be$Sub_metering_2
s2<- as.numeric((as.character(s2)))
s3 <-be$Sub_metering_3
s3<- as.numeric((as.character(s3)))

t <- be$time


par(mar=c(3,4,2,2))
par(mfrow=c(1,1))

par(xaxt="n")

plot(s1,t,type="n",ylab="Energy Sub Metering")
lines(s1,t,col="black")
lines(s2,t,col="red")
lines(s3,t,col="blue")
legend("topright",lty=1, cex=0.7, col=c("black","red","blue"),legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))



par(xaxt="s")

axis(1,0,"Thu")
axis(1,1440,"Fri")
axis(1,2881,"Sat")



dev.copy(png,file="plot3.png")
dev.off()
