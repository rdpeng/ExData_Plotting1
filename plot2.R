dat<-read.csv("household_power_consumption.txt", sep=";", header = TRUE)

times<-strptime(paste(dat$Date,dat$Time), format = "%d/%m/%Y %H:%M:%S")

date=data.frame(as.Date(dat$Date, "%d/%m/%Y"))

dat$Date=as.Date(dat$Date, "%d/%m/%Y")

dat$newtimes=times

dat2<-dat[dat$Date>= "2007-02-01",]

dat3<-dat2[dat2$Date <= "2007-02-02",]

plot(dat3$newtimes,dat3$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)")
dev.copy(png,'plot2.png')
dev.off()