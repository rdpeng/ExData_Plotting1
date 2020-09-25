infile="household_power_consumption.txt"
outfile2="plot2.png"

alldata<-read.table(infile, sep=";", header=TRUE)
# transform dates into day-month-year form
alldata$Date<-as.Date(as.character(alldata$Date),"%d/%m/%Y")
# subset only entries recorded on 2007-02-01 and 2007-02-02
mydata<-alldata[(alldata$Date=="2007-02-01" | alldata$Date=="2007-02-02"),]

mydate<-as.character(mydata$Date)
mytime<-as.character(mydata$Time)
mydata$date.time<-paste(mydate,mytime,sep=" ")
timetoplot<-strptime(mydata$date.time, format = "%Y-%m-%d %H:%M:%S")

# transform factor into numeric vector
mydata$Global_active_power<-as.numeric(as.character(unlist(mydata$Global_active_power)))

png(outfile2, width=480, height=480)
plot(timetoplot, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()