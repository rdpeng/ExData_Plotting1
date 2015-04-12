library(lubridate)
library(dplyr)

##reading data from working directory
p<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

##reshaping data
p$Date<-dmy(p$Date)
ed<-ydm("2007/02/02")
sd<-ydm("2007/01/02")
p<-filter(p,Date==sd|Date==ed)
p$Global_active_power<-as.numeric(as.character(p$Global_active_power))

#plot1:
hist(p$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power", col="red")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()