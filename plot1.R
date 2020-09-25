infile="household_power_consumption.txt"
outfile1="plot1.png"

alldata<-read.table(infile, sep=";", header=TRUE)
# transform dates into day-month-year form
alldata$Date<-as.Date(as.character(alldata$Date),"%d/%m/%Y")

# subset only entries recorded on 2007-02-01 and 2007-02-02
mydata<-alldata[(alldata$Date=="2007-02-01" | alldata$Date=="2007-02-02"),]

# transform factor into numeric vector
mydata$Global_active_power<-as.numeric(as.character(unlist(mydata$Global_active_power)))

png(outfile1, width=480, height=480)
hist(mydata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
