dat <- subset(read.delim(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.txt"),header=TRUE,sep=";"),Date=="1/2/2007"|Date=="2/2/2007")
Date <- as.Date(dat$Date,format="%d/%m/%Y")
DateTime <- as.POSIXlt(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S")
dat[,3:9]<-lapply(dat[,3:9],as.numeric)
Global_active_power<-dat$Global_active_power/500
png(filename = "Plot2.png")
plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()