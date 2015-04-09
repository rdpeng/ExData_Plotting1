plot1<-function(fil="household_power_consumption.txt"){

data<-read.table(fil,sep=";",na.strings="?",header=TRUE)
data$Date<-as.Date(data$Date,"%d/%m/%Y")
prb<-c("01/02/2007","02/02/2007")
prb<-as.Date(prb,"%d/%m/%Y")
prb<-as.numeric(as.POSIXct(prb))
data$Date<-as.numeric(as.POSIXct(data$Date))
data<-subset(data,data$Date>=prb[1])
data<-subset(data,data$Date<=prb[2])
x<-data$Global_active_power
png(file = "Plot1.png", bg = "transparent",width=480,height=480)
hist(x,xlab="Global Active Energy (kilowatts)",ylab="Frequency",main="Global Active Energy",col="red")
dev.off()
}
