##load data
dat<-read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = "character")

##extract more tidy data 
dat2 <- dat[dat$Date == as.Date("20070202","%Y%m%d") | dat$Date == as.Date("20070201","%Y%m%d"),]

##integrate date & time
dt <- strptime(paste(dat2$Date,dat2$Time), "%Y-%m-%d %X")

##open a png device
png(filename = "plot3.png", width = 480, height = 480)

##plot n type for no points
plot(dt,as.numeric(dat2$Sub_metering_1), type = "n", xlab="", ylab = "Energy sub metering" )

##draw lines
lines(dt,as.numeric(dat2$Sub_metering_1))
lines(dt,as.numeric(dat2$Sub_metering_2), col = "red")
lines(dt,as.numeric(dat2$Sub_metering_3), col = "blue")

##make legends
legend("topright",legend=names(dat2[7:9]), lwd = 1, col = c("black","red","blue"))

##close the device
dev.off()