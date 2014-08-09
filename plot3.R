hpc<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = c("?","NA"))
in_date_range<-(hpc$Date=='1/2/2007' | hpc$Date=='2/2/2007')
hpc_to_use<-hpc[in_date_range,]

png("plot3.png", width=480, height=480)
plot(1:length(hpc_to_use$Time),hpc_to_use$Sub_metering_1,"l",xaxt="n",xlab=NA,ylab="Energy sub metering")
lines(1:length(hpc_to_use$Time),hpc_to_use$Sub_metering_2,col="red","l",xaxt="n",xlab=NA,ylab="Energy sub metering")
lines(1:length(hpc_to_use$Time),hpc_to_use$Sub_metering_3,col="blue","l",xaxt="n",xlab=NA,ylab="Energy sub metering")
axis(1,at=c(1,0.5*length(hpc_to_use$Time), length(hpc_to_use$Time)),c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=3,col=c("black","red","blue"))
dev.off()
