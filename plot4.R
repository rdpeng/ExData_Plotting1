mydata <- read.csv("~/R/DataVizCourse/exdata_data_household_power_consumption/filtered_data.csv",header=TRUE)
names(mydata)[names(mydata)=="ï..Date"] <- "Date"
mydata$DateTime <- strptime(paste(mydata$Date,mydata$Time),format="%d/%m/%Y %H:%M:%S")
rm(mydata)

#Plot4 in R
par(mfcol=c(2,2))
with(mydata, plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
with(mydata, {
  plot(DateTime,Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
  lines(DateTime,Sub_metering_2,type="l",col="red")
  lines(DateTime,Sub_metering_3,type="l",col="blue")
  legend("topright",lwd=1,bty="n",col=(c("black","red","blue")),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
with(mydata, plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))
with(mydata, plot(DateTime,Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power"))

#Plot4 in PNG
png(file="plot4.png",width=480,height=480,units="px")
par(mfcol=c(2,2))
with(mydata, plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
with(mydata, {
  plot(DateTime,Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
  lines(DateTime,Sub_metering_2,type="l",col="red")
  lines(DateTime,Sub_metering_3,type="l",col="blue")
  legend("topright",lwd=1,bty="n",col=(c("black","red","blue")),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
with(mydata, plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))
with(mydata, plot(DateTime,Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power"))
dev.off()
