data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Feb1_2 <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

Feb1_2$Date <- as.Date(Feb1_2$Date, format="%d/%m/%Y")
Feb1_2$Time <- strptime(Feb1_2$Time, format="%H:%M:%S")
Feb1_2[1:1440,"Time"] <- format(Feb1_2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
Feb1_2[1441:2880,"Time"] <- format(Feb1_2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

par(mfrow=c(2,2))


with(Feb1_2,{
  plot(Feb1_2$Time,as.numeric(as.character(Feb1_2$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(Feb1_2$Time,as.numeric(as.character(Feb1_2$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(Feb1_2$Time,Feb1_2$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(Feb1_2,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(Feb1_2,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(Feb1_2,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(Feb1_2$Time,as.numeric(as.character(Feb1_2$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

#copying to png
dev.copy(png, filename="plot4.png")
dev.off()