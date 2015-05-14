
data = read.table("household_power_consumption.txt",header=T, sep=";")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
sub <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02" ) # using data from the dates 2007-02-01 and 2007-02-02
png("plot4.png", width = 480, height = 480, units = "px")
par(mfcol=c(2,2))


## figure 1
power <- as.numeric(as.character(sub$Global_active_power)) # convert factor to numeric
times <- as.character(sub$Time)
x <- paste(sub$Date, times)
x1 <- strptime(x, "%Y-%m-%d %H:%M:%S")
one <- data.frame(x1,power)
with(one,plot(x1,power,type="l",ylab="Global Active Power",xlab=''))


## figure 2

energy1 <- as.numeric(as.character(sub$Sub_metering_1)) # convert factor to numeric
energy2 <- as.numeric(as.character(sub$Sub_metering_2)) # convert factor to numeric
energy3 <- as.numeric(as.character(sub$Sub_metering_3)) # convert factor to numeric

times <- as.character(sub$Time)
x <- paste(sub$Date, times)
x1 <- strptime(x, "%Y-%m-%d %H:%M:%S")
one <- data.frame(x1, energy1,energy2,energy3)

plot(x1,energy1,type="l",ylab="Energy sub metering",xlab='',col = "black")
lines(x1,energy2,col = "red")
lines(x1,energy3,col = "blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

## figure 3

voltage <- as.numeric(as.character(sub$Voltage))
three <- data.frame(x1,voltage)
with(three,plot(x1,voltage,type="l",ylab="Voltage",xlab='datetime'))


## figure 4

re_power <- as.numeric(as.character(sub$Global_reactive_power))
four <- data.frame(x1,re_power)
with(four,plot(x1,re_power,type="l",ylab="Global_reactive_power",xlab='datetime',ylim=c(0.0,0.51)))
dev.off()
