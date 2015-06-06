power <- read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?")
sub<-power[(power$Date=="1/2/2007"|power$Date=="2/2/2007"),]
bins<-seq(0,7.5,by=0.5)
histogram <- hist(sub$Global_active_power,col="red",main="Global Active Power", breaks=bins,xlab="Global Active Power (kilowatts)")