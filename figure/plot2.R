setwd("~/Downloads")
dat = read.table("household_power_consumption.txt", sep=";", header=TRUE)
summary(dat)
head(dat)

as.Date(dat$Date)

newdat = subset(dat, Date=="1/2/2007" | Date=="2/2/2007")

newdat$Global_active_power=as.numeric(newdat$Global_active_power)/500
plot(newdat$Global_active_power, type="l", main="Global Active Power", 
     ylab="Global Active Power (kilowatts)", xlab=" ", xaxt="n")
axis(1, at=c(1, 1440,2880), labels=c("Thu","Fri","Sat"))

