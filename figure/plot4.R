household_table<-read.delim("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
household_table_feb<-subset(household_table,Date=="1/2/2007"|Date=="2/2/2007")
household_table_feb$DateTime = strptime(paste(as.character(household_table_feb$Date), as.character(household_table_feb$Time)), "%d/%m/%Y %H:%M:%S")
par(mar=c(4,4,1,1),mfrow=c(2,2))
    
op <- par(cex=.8)

with(household_table_feb,plot(DateTime,Global_active_power,type="l",xlab="",ylab = "Global Active Power"))

with(household_table_feb,plot(DateTime,Voltage,type="l",ylab = "Voltage"))

op <- par(cex=.6)

plot(household_table_feb$DateTime,household_table_feb$Sub_metering_1, type = "l",ylab="Energy sub metering",xlab="")
lines(household_table_feb$DateTime,household_table_feb$Sub_metering_2, type = "l", col = "red")
lines(household_table_feb$DateTime,household_table_feb$Sub_metering_3, type = "l", col = "blue")
with(household_table_feb,legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'),lty=c(1,1)))

par(op)

op <- par(cex=.8)

with(household_table_feb,plot(DateTime,Global_reactive_power,type="l",ylab = "Global Reactive Power"))

par(op)

dev.copy(png,'plot4.png', width = 480, height = 480)
dev.off()

