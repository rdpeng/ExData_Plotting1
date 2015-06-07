setwd("~/Downloads")
dat = read.table("household_power_consumption.txt", sep=";", header=TRUE)
summary(dat)
head(dat)

as.Date(dat$Date)

newdat = subset(dat, Date=="1/2/2007" | Date=="2/2/2007")


newdat = subset(newdat, Sub_metering_1!="?" & Sub_metering_2!="?" & Sub_metering_3!="?")
newdat$Sub_metering_1=as.numeric(newdat$Sub_metering_1)
newdat$Sub_metering_2=as.numeric(newdat$Sub_metering_2)
newdat$Sub_metering_3=as.numeric(newdat$Sub_metering_3)


par(mfrow=c(1,1))
plot(newdat$Sub_metering_1, type="l", ylab="Energy sub metering", col="black", xlab=" ", xaxt="n")
lines(newdat$Sub_metering_2, type="l", ylab="", xlab=" ", col="red", xaxt="n")
lines(newdat$Sub_metering_3, type="l", ylab="", xlab=" ", col="blue", xaxt="n")

legend(1405,36, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue")
       , lty=1, lwd=2, )
     

axis(1, at=c(1, 1440,2880), labels=c("Thu","Fri","Sat"))

