setwd("~/Downloads")
dat = read.table("household_power_consumption.txt", sep=";", header=TRUE)
summary(dat)
head(dat)

as.Date(dat$Date)

newdat = subset(dat, Date=="1/2/2007" | Date=="2/2/2007")

newdat$Global_active_power=as.numeric(newdat$Global_active_power)/500
hist(newdat$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", breaks=20, ylim=c(0,1200))


