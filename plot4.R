library(dplyr)
header <- read.table("household_power_consumption.txt", nrows = 1, header = TRUE, sep =';', stringsAsFactors = FALSE)
data<-read.table("household_power_consumption.txt",skip=66637,nrows = 2880,sep=";")
colnames( data ) <- names(header)
data<-mutate(data,Hour=as.POSIXct(paste(data$Date, data$Time), tz="GMT", format = "%d/%m/%Y %H:%M:%S"))
Sys.setlocale("LC_TIME", "English")
par(mfrow = c(2,2))
with(data,{
  plot(Hour,Global_active_power,ylab="Global Active Power",type="l",xlab ="")
  plot(Hour,Voltage,ylab="Voltage",type="l",xlab ="")
  plot(Hour,Sub_metering_1,
       ylab="Energy sub metering",
       xlab ="",type="l")
  lines(data$Hour,data$Sub_metering_2,col="red")
  lines(data$Hour,data$Sub_metering_3,col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),lty=1,
         cex = 0.5, xpd = TRUE,x.intersp=2,inset=0.01,adj=0.1,bty = "n")

  plot(Hour,Global_reactive_power,ylab="Global_reactive_power",type="l",xlab ="")
})
dev.copy(png,file="plot4.png")
dev.off()