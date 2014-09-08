par(mfrow= c(2,2))
plot(x,y, type ="l",main="An extra day is good for you!",ylab="Global Active Power (kilowatts)",xlab="Day")
volt = mydata[,5]
plot(x,volt, type ="l",ylab="Voltage",xlab="Day")
plot(x,y, ylab = "Energy Submetering", xlab="Day", type="n")
lines(x,y2,col="blue",lty=1)
lines(x,y3,col="red",lty=2)
lines(x,y4,col="black",lty=3)
legend("topright","(x,y)",c("Submetering 1", "Submetering 2","Submetering 3"),bg="white", lty = 1:3, col=c("blue","red","black"))
grp<-mydata[,4]
plot(x,grp, type ="l",ylab="Global Reactive Power",xlab="Day")
