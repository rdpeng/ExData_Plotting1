my_data <- read.table(file="household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#date <- my_data$Date
#time <- my_data$Time
x <- paste(my_data$Date,my_data$Time)
x1 <- strptime(x,"%d/%m/%Y %H:%M:%S")

x1 <- as.POSIXct(x1)

xmin <- as.POSIXct("2007-01-31 23:59:59")
xmax <- as.POSIXct("2007-02-03 00:00:00")
my_new <- cbind(x1,my_data)
z <- subset(my_new,x1>xmin & x1<xmax,select=c( "x1","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

png("plot3.png",width=8, height=8, units="in", res=300)
par(mfrow=c(1,1))
plot(z$x1,z$Sub_metering_1,type="l",col = "black", xlab="",ylab="Energy sub metering")
lines(z$x1,z$Sub_metering_2,type="l",col = "red", xlab="",ylab="")
lines(z$x1,z$Sub_metering_3,type="l",col = "blue", xlab="",ylab="")
legend("topright",lwd=1,col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
