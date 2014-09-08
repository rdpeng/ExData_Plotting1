mydata <- read.csv("data2.csv")

hist(mydata[,3],labels=FALSE,col="red", main = "Global Active Power", xlab ="Global Active Power (killowatts)", ylab = "Frequency")

date <- as.character(mydata[,1])
time <- as.character(mydata[,2])
x2 <- paste(date,time, sep=" ", collapse=NULL)
x <- strptime(x2,format=("%d/%m/%Y %H:%M:%S"))
plot(x,y, type ="l",main="An extra day is good for you!",ylab="Global Active Power (kilowatts)",xlab="Day")

plot(x,y, ylab = "Energy Submetering", xlab="Day", type="n")
lines(x,y2,col="blue",lty=1)
lines(x,y3,col="red",lty=2)
lines(x,y4,col="black",lty=3)
legend("topright","(x,y)",c("Submetering 1", "Submetering 2","Submetering 3"),bg="white", lty = 1:3, col=c("blue","red","black"))

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
