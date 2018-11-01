#Plot4 4 graphs
plot.new()
if(!dir.exists("figure"))
{
        dir.create("figure")
}

png("figure/plot4.png", width = 480,height =480)

par(mfcol=c(2,2))
#Plot 1
plot(data_piece$Time,data_piece$Global_active_power,type="l",xlab = " ",ylab = "Global Active Power (kilowatts)")
#Plot 2
plot(data_piece$Time,data_piece$Sub_metering_1,type = "n",ylab = "Energy Sub metering",xlab = " ")
points(data_piece$Time,data_piece$Sub_metering_1,type = "l")
points(data_piece$Time,data_piece$Sub_metering_2,type = "l",col="red")
points(data_piece$Time,data_piece$Sub_metering_3,type = "l",col="blue")
legend("topright",legend =  paste("Sub_metering_",1:3),col = c("black","red","blue"),lty = 1)
# paste("Sub_metering_",1:3),col = c("black","red","blue"),lty = 1,bty = "o")
#Plot3
plot(data_piece$Time,data_piece$Voltage,type="l",ylab = "Voltage",xlab = "datetime")
#Plot 4 
plot(data_piece$Time,data_piece$Global_reactive_power,type="l",ylab = "Global_Reactive_Power",xlab = "datetime")


dev.off() # close png
