plot1 <- function() {
	
	mydata=read.csv("household_power_consumption.txt",sep=";")
	scopedata<-mydata[as.Date(mydata$Date,"%d/%m/%Y") > as.Date("31/01/2007","%d/%m/%Y"),]
    png("plot1.png",width=480,height=480)
	hist(as.numeric(scopedata$Global_active_power),col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
	dev.off()
	
}