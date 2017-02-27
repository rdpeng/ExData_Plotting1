setwd("E:/")
ExDat = read.table("household_power_consumption.txt",sep = ";",header = TRUE )
ExDat$Date<-as.Date(as.character(ExDat$Date), "%d/%m/%Y")

ElectricPC<-subset(ExDat,ExDat$Date=="2007-02-01"|ExDat$Date=="2007-02-02")
ElectricPC$datetime<-strptime(paste(ElectricPC$Date,ElectricPC$Time),"%Y-%m-%d %H:%M:%S")

ElectricPC$Global_active_power<-as.numeric(as.character(ElectricPC$Global_active_power))
ElectricPC$Sub_metering_1<-as.numeric(as.character(ElectricPC$Sub_metering_1))
ElectricPC$Sub_metering_2<-as.numeric(as.character(ElectricPC$Sub_metering_2))
ElectricPC$Voltage<-as.numeric(as.character(ElectricPC$Voltage))
ElectricPC$Global_reactive_power<-as.numeric(as.character(ElectricPC$Global_reactive_power))


par(mfcol=c(2,2), mar=c(4,4,2,1))
with( ElectricPC,{
  plot(datetime,Global_active_power, type = "l")
  {
    plot(datetime,Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = ""
    )
    lines(datetime,Sub_metering_2,col="red")
    lines(datetime,Sub_metering_3, col="blue")
    legend("topright",lwd = 2,col = c("black","red","blue"), 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = .5)}
  
  plot(datetime,Voltage,type = "l")
  plot(datetime,Global_reactive_power,type="l")
})
dev.copy(png,'plot4.png',width=480,height=480)
dev.off()
par(mfcol=c(1,1))