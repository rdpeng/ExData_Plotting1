infile="household_power_consumption.txt"
outfile3="plot3.png"

alldata<-read.table(infile, sep=";", header=TRUE, stringsAsFactors=FALSE)
# transform dates into day-month-year form
alldata$Date<-as.Date(as.character(alldata$Date),"%d/%m/%Y")
# subset only entries recorded on 2007-02-01 and 2007-02-02
mydata<-alldata[(alldata$Date=="2007-02-01" | alldata$Date=="2007-02-02"),]

mydate<-as.character(mydata$Date)
mytime<-as.character(mydata$Time)
mydata$date.time<-paste(mydate,mytime,sep=" ")
timetoplot<-strptime(mydata$date.time, format = "%Y-%m-%d %H:%M:%S")

png(outfile3, width=480, height=480)
plot(timetoplot, mydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", yaxt="n")
lines(timetoplot, mydata$Sub_metering_2, col="red")
lines(timetoplot, mydata$Sub_metering_3, col="blue")
axis(side=2, at=seq(0,30,10), labels=seq(0,30,10))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
dev.off()