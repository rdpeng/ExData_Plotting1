data<-read.table("household_power_consumption.txt",nrows=150000, header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings="?")
mydata<-strptime((paste(data$Date, data$Time, sep=" ")), "%d/%m/%Y %H:%M:%S")
mydata1<-cbind(mydata,data)
colnames(mydata1)[1]<-"Date2"
mydata2<-subset(mydata1, Date=="1/2/2007" | Date=="2/2/2007")

par(mfrow = c(2,2),cex=0.7)
with(mydata2,{
plot(Date2,Global_active_power, xlab="", type="l", ylab="Global Active Power")

plot(Date2, Voltage, xlab="datetime", ylab="Voltage", type="l")

plot(Date2, Sub_metering_1, xlab="", type="l", ylab="Energy sub metering")
lines(Date2, Sub_metering_2,col="red")
lines(Date2, Sub_metering_3,col="blue")
legend("topright",bty="n", col = c("black","red","blue"), lty = c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(Date2,Global_reactive_power, type="l", xlab="datetime")
})
dev.copy(png, file="Plot4.png")
dev.off()
