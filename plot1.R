#data reads in a single variable unless I set the colClasses
#I read the first row in, then calculated
mydata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c(rep("character",2), rep("numeric",7)),skip= 66636 , nrows = 2*60*24, na="?")
#not really sure why the colnames messed up, but oh well...

colnames(mydata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
# I found this here: http://www.inside-r.org/r-doc/base/strftime
x <- paste(mydata$Date, mydata$Time)
mydata$Time <- strptime(x, "%d/%m/%y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
png("plot1.png")

hist(mydata$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")

dev.off()
