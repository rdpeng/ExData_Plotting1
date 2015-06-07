## Col name
## 1 : Date
## 2 : Time
## 3 : Global_active_power
## 4 : Global_reactive_power
## 5 : Voltage
## 6 : Global_intensity
## 7 : Sub_metering_1
## 8 : Sub_metering_2
## 9 : Sub_metering_3

##load data
dat<-read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = "character")

##extract necessary data
dat2 <- dat[dat$Date == as.Date("20070202","%Y%m%d") | dat$Date == as.Date("20070201","%Y%m%d"),]

##integrate date & time
dt <- strptime(paste(dat2$Date,dat2$Time), "%Y-%m-%d %X")

##open a png device
png(filename = "plot4.png", width = 480, height = 480)

##devide area into 4
par(mfrow = c(2,2))

## (1,1)
plot(dt, as.numeric(dat2[[3]]), type = "n", xlab ="", ylab = "Global Active Power")
lines(dt, as.numeric(dat2[[3]]))

## (1,2)
plot(dt, as.numeric(dat2[[5]]), type = "n", xlab = "datetime", ylab = "Voltage")
lines(dt, as.numeric(dat2[[5]]))

## (2,1)
plot(dt,as.numeric(dat2$Sub_metering_1), type = "n", xlab="", ylab = "Energy sub metering" )
lines(dt,as.numeric(dat2$Sub_metering_1))
lines(dt,as.numeric(dat2$Sub_metering_2), col = "red")
lines(dt,as.numeric(dat2$Sub_metering_3), col = "blue")
legend("topright",legend=names(dat2[7:9]), lwd = 1, col = c("black","red","blue"), bty = "n")

## (2,2)
plot(dt, as.numeric(dat2[[4]]), type = "n", xlab="datetime", ylab = names(dat2[4]))
lines(dt, as.numeric(dat2[[4]]))

dev.off()