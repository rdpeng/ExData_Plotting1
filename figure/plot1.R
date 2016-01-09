library(data.table)
library(datasets)

mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
mydata$Date<-as.Date(strptime(mydata$Date,"%d/%m/%Y"))
data<-subset(mydata,Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))

hist(data$Global_active_power,main="Global Active Power", xlab="Global Active Power", col="red")

dev.copy(png, file = "plot1.png")
dev.off()


