##load data
dat<-read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = "character")

##extract necessary data
dat2 <- dat[dat$Date == as.Date("20070202","%Y%m%d") | dat$Date == as.Date("20070201","%Y%m%d"),]

##convert char. data to numeric
dat2$Global_active_power <- as.numeric(dat2$Global_active_power)

##integrate date & time
dt <- strptime(paste(dat2$Date,dat2$Time), "%Y-%m-%d %X")

##open a device
png(filename = "plot2.png", width = 480, height = 480)

##plot type = "n" for no points
plot(dt,dat2$Global_active_power, type="n", xlab="", ylab = "Global Active Power (kilowatts)" )

##draw lines between points
lines(dt,dat2$Global_active_power)

##close the device
dev.off()