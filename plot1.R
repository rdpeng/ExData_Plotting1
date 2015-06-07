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

##convert to numeric data
dat2$Global_active_power <- as.numeric(dat2$Global_active_power)

##open a png device
png(filename = "plot1.png", width = 480, height = 480)

##draw histogram, breaks follows Sturges algorithm, nclass.Sturges
hist(dat2$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power", col = "red")

##close the device
dev.off()