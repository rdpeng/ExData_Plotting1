
data = read.table("household_power_consumption.txt",header=T, sep=";")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
sub <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02" ) # using data from the dates 2007-02-01 and 2007-02-02


energy1 <- as.numeric(as.character(sub$Sub_metering_1)) # convert factor to numeric
energy2 <- as.numeric(as.character(sub$Sub_metering_2)) # convert factor to numeric
energy3 <- as.numeric(as.character(sub$Sub_metering_3)) # convert factor to numeric


times <- as.character(sub$Time)
x <- paste(sub$Date, times)
x1 <- strptime(x, "%Y-%m-%d %H:%M:%S")
one <- data.frame(x1, energy1,energy2,energy3)

png("plot3.png", width = 480, height = 480, units = "px")
plot(x1,energy1,type="l",ylab="Energy sub metering",xlab='',col = "black")
lines(x1,energy2,col = "red")
lines(x1,energy3,col = "blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
dev.off()

