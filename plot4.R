plot4<-function(fil="household_power_consumption.txt"){

data<-read.table(fil,sep=";",na.strings="?",header=TRUE)
#
# combine day and time
#
x<-paste(data$Date, data$Time)
data$x<-strptime(x,"%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Date2<-data$Date
#
#use only those data required for problem
#
prb<-c("01/02/2007","02/02/2007")
prb<-as.Date(prb,"%d/%m/%Y")
prb<-as.numeric(as.POSIXct(prb))
data$Date<-as.numeric(as.POSIXct(data$Date))
data<-subset(data,data$Date>=prb[1])
data<-subset(data,data$Date<=prb[2])
#
#plot data
#
png(file = "Plot4.png", bg = "transparent",width=480,height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data,{
plot(data$x, data$Global_active_power, type="l", xlab="", ylab="Gobal Active Power")
plot(data$x, data$Voltage, type="l", xlab="datetime", ylab="Gobal Active Power")
plot(data$x, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
with(data, points(data$x, data$Sub_metering_2,type="l", col="red"))
with(data, points(data$x, data$Sub_metering_3, type="l", col="blue"))
lgndcol<-c("black","red","blue")
lgndprm<-c("sub_metering_1","sub_metering_2","sub_metering_3")
legend("topright", lty=c(1,1,1), col=lgndcol, legend=lgndprm, bty="n")
plot(data$x, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()
}
