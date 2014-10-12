e<-read.csv2("household_power_consumption.txt",dec=".")
be <- e[(e$Date =="2/2/2007" | e$Date =="1/2/2007"),]
a <-be$Global_active_power
a <- as.numeric((as.character(a)))
s1 <-be$Sub_metering_1
s1<- as.numeric((as.character(s1)))

s2 <-be$Sub_metering_2
s2<- as.numeric((as.character(s2)))
s3 <-be$Sub_metering_3
s3<- as.numeric((as.character(s3)))
v<-be$Voltage
v<-as.numeric((as.character(v)))
r<- be$Global_reactive_power
r<- as.numeric((as.character(r)))


t <- be$time

par(mfcol=c(2,2))

par(mar=c(3,4,2,2))

# graph 1 
par(xaxt="n")
plot(a,t, type="l",ylab="Global Active Power (Kilowatts)")

par(xaxt="s")

axis(1,0,"Thu")
axis(1,1440,"Fri")
axis(1,2881,"Sat")


#graph 2 
par(xaxt="n")

plot(s1,t,type="n",ylab="Energy Sub Metering")
lines(s1,t,col="black")
lines(s2,t,col="red")
lines(s3,t,col="blue")
legend("topright",lty=1, border="white",cex=0.5,col=c("black","red","blue"),legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))
par(xaxt="s")

axis(1,0,"Thu")
axis(1,1440,"Fri")
axis(1,2881,"Sat")

par(xaxt="n")

plot(v,t,type="l",ylab="Voltage",xlab="Datetime")
par(xaxt="s")
mtext("DateTime",side=1, line=3, outer=TRUE)
axis(1,0,"Thu")
axis(1,1440,"Fri")
axis(1,2881,"Sat")


par(xaxt="n")

plot(r,t,type="l",ylab="Global Reactive Power",xlab="Datetime")
par(xaxt="s")
mtext("DateTime",side=1, line=3, outer=TRUE)
axis(1,0,"Thu")
axis(1,1440,"Fri")
axis(1,2881,"Sat")


dev.copy(png,file="plot4.png")
dev.off()
