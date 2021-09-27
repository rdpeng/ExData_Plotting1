dat<-read.csv("household_power_consumption.txt", sep=";", header = TRUE)

times<-strptime(paste(dat$Date,dat$Time), format = "%d/%m/%Y %H:%M:%S")

date=data.frame(as.Date(dat$Date, "%d/%m/%Y"))

dat$Date=as.Date(dat$Date, "%d/%m/%Y")

dat$newtimes=times

dat2<-dat[dat$Date>= "2007-02-01",]

dat3<-dat2[dat2$Date <= "2007-02-02",]

par(mfrow=c(2,2))
plot(dat3$newtimes,dat3$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")
plot(dat3$newtimes,dat3$Voltage, type="l", ylab = "Voltage", xlab = "")
plot(dat3$newtimes,dat3$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
points(dat3$newtimes,dat3$Sub_metering_2, type = "l", col = "red")
points(dat3$newtimes,dat3$Sub_metering_3, type="l", col = "blue")
legend(x ="top", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", col = c("black", "red", "blue"), lty = 1, lwd=2)
plot(dat3$newtimes,dat3$Global_reactive_power, type="l", ylab = "Global Reactive Power", xlab = "")
dev.copy(png,'plot4.png')
dev.off()