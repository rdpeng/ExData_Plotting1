setwd("~/Downloads")
dat = read.table("household_power_consumption.txt", sep=";", header=TRUE)
summary(dat)
head(dat)

as.Date(dat$Date)

newdat = subset(dat, Date=="1/2/2007" | Date=="2/2/2007")


newdat = subset(newdat, Sub_metering_1!="?" & Sub_metering_2!="?" & Sub_metering_3!="?"
                & Voltage!="?" & Global_reactive_power!="?")
newdat$Sub_metering_1=as.numeric(newdat$Sub_metering_1)
newdat$Sub_metering_2=as.numeric(newdat$Sub_metering_2)
newdat$Sub_metering_3=as.numeric(newdat$Sub_metering_3)
newdat$Voltage=as.numeric(newdat$Voltage)
newdat$Global_reactive_power=as.numeric(newdat$Global_reactive_power)

par(mfrow=c(2,2))
#1
newdat$Global_active_power=as.numeric(newdat$Global_active_power)/500
plot(newdat$Global_active_power, type="l", 
     ylab="Global Active Power", xlab=" ", xaxt="n")
axis(1, at=c(1, 1440,2880), labels=c("Thu","Fri","Sat"))


#2
plot(newdat$Voltage, type="l", xlab="datetime", ylab="Voltage", xaxt="n")
axis(1, at=c(1, 1440,2880), labels=c("Thu","Fri","Sat"))



#3
plot(newdat$Sub_metering_1, type="l", ylab="Energy sub metering", col="black", xlab=" ", xaxt="n")
lines(newdat$Sub_metering_2, type="l", ylab="", xlab=" ", col="red", xaxt="n")
lines(newdat$Sub_metering_3, type="l", ylab="", xlab=" ", col="blue", xaxt="n")

legend(1305,36, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue")
       , lty=1, lwd=2, bty="n", cex=0.5)
axis(1, at=c(1, 1440,2880), labels=c("Thu","Fri","Sat"))

#4
plot(newdat$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power", xaxt="n")
axis(1, at=c(1, 1440,2880), labels=c("Thu","Fri","Sat"))

