if(!file.exists("exdata-data-household_power_consumption.zip")) {
  temp <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  a <- unzip(temp)
  unlink(temp)
}
a <- read.table(a, header=T, sep=";", na.strings = "?")

x<-a
#x$Time<-strptime(x$Time,"%H:%M:%S")
x$Date<- as.Date(x$Date, format="%d/%m/%Y")

y <- x[(x$Date=="2007-02-01") | (x$Date=="2007-02-02"),]
#y$Time<-format(y$Time, format="%H:%M:%S")

#plot4
par(mfrow=c(2,2))

##PLOT 1
plot(as.POSIXct(paste(y$Date,y$Time)),y$Global_active_power, type="l", xlab="", ylab="Global Active Power")
##PLOT 2
plot(as.POSIXct(paste(y$Date,y$Time)),y$Voltage, type="l", xlab="datetime", ylab="Voltage")

##PLOT 3
plot(as.POSIXct(paste(y$Date,y$Time)),y$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(as.POSIXct(paste(y$Date,y$Time)),y$Sub_metering_2,col="red")
lines(as.POSIXct(paste(y$Date,y$Time)),y$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)

#PLOT 4
plot(as.POSIXct(paste(y$Date,y$Time)),y$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", width=480, height=480)
getwd()


