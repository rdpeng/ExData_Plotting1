plot3<-function(fil="household_power_consumption.txt"){

data<-read.table(fil,sep=";",na.strings="?",header=TRUE)
#
x<-paste(data$Date, data$Time)
data$x<-strptime(x,"%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Date2<-data$Date
prb<-c("01/02/2007","02/02/2007")
prb<-as.Date(prb,"%d/%m/%Y")
prb<-as.numeric(as.POSIXct(prb))
data$Date<-as.numeric(as.POSIXct(data$Date))
data<-subset(data,data$Date>=prb[1])
data<-subset(data,data$Date<=prb[2])
y<-data$Sub_metering_1
png(file = "Plot3.png", bg = "transparent",width=480,height=480)
plot(data$x, y, type="l", ylab="Energy sub metering")
with(data, points(data$x, data$Sub_metering_2,type="l", col="red"))
with(data, points(data$x, data$Sub_metering_3, type="l", col="blue"))
lgndcol<-c("black","red","blue")
lgndprm<-c("sub_metering_1","sub_metering_2","sub_metering_3")
legend("topright", lty=c(1,1,1), col=lgndcol, legend=lgndprm)
dev.off()
}
