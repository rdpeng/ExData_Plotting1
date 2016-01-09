library(data.table)
library(datasets)

mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
mydata$Date<-as.Date(strptime(mydata$Date,"%d/%m/%Y"))
data<-subset(mydata,Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))

with(data,plot(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),Global_active_power,ylab = "Global Active Power(kilowatts)",xlab = "",type ="l"))
     
dev.copy(png, file = "plot2.png")
dev.off()
