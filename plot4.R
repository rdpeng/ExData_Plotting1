#set the working directory and unzip the data file.
file<-"./household_power_consumption.txt"
data<-read.table(file,sep = ";",na.strings = "?",skip = 66637,nrows = 2880)
df<-data.frame(data)
colnames(df)<-c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2",
                "Sub_metering_3")

#my PC´s symtem language is Spanish by default, that's why the xlabels are in Spanish
df$timestamp <- with(df, as.POSIXct(paste(Date, Time), format="%d/%m/%Y%H:%M:%S"))

png("plot4.png",bg="transparent",type = "cairo")
par(mfrow = c(2, 2), cex=0.8)
with(df, {
  #plot 1,1
  plot(timestamp,Global_active_power, type="l",ylab = "Global Active Power", xlab = "")
  #plot 1,2
  plot(timestamp,Voltage, type="l", ylab="Voltage", xlab="datetime")
  #plot 2,1
  with(df,plot(timestamp,Sub_metering_1, col="black", type = "l", ylab = "Energy sub metering", xlab = ""))
  with(df,lines(timestamp,Sub_metering_2,col="red"))
  with(df,lines(timestamp,Sub_metering_3,col="blue"))
  legend("topright",lty = 1,bty = "n", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #plot 2,2
  plot(timestamp, Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")
})
dev.off()