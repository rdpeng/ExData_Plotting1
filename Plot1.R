dat <- subset(read.delim(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.txt"),header=TRUE,sep=";"),Date=="1/2/2007"|Date=="2/2/2007")
dat[,3:9]<-lapply(dat[,3:9],as.numeric)
png(filename = "Plot1.png")
Global_active_power<-dat$Global_active_power/500
hist(Global_active_power,col="Red",breaks=14,main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()