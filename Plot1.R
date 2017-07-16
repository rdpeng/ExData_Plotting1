#read data
dat <- read.delim(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.txt"),header=TRUE,sep=";",na.strings="?")

#transform data
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

#subset data
datsub <- subset(dat,Date=="2007-02-01"|Date=="2007-02-02")

#transform data
datsub[,3:9]<-lapply(datsub[,3:9],as.numeric)

#plot histogram
hist(datsub$Global_active_power,col="Red",breaks=14,main="Global Active Power",xlab="Global Active Power (kilowatts)")

#output to png file and close device
dev.copy(png,file="Plot1.png",width=480,height=480)
dev.off()