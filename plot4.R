consumption <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub_set <- subset(consumption,consumption$Date=="1/2/2007" | consumption$Date =="2/2/2007")

#assignment
sub_set$Date <- as.Date(sub_set$Date, format="%d/%m/%Y")
sub_set$Time <- strptime(sub_set$Time, format="%H:%M:%S")
sub_set[1:1440,"Time"] <- format(sub_set[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub_set[1441:2880,"Time"] <- format(sub_set[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#composite plot
par(mfrow=c(2,2))

with(sub_set,{
        plot(sub_set$Time,as.numeric(as.character(sub_set$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
        plot(sub_set$Time,as.numeric(as.character(sub_set$Voltage)), type="l",xlab="datetime",ylab="Voltage")
        plot(sub_set$Time,sub_set$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        with(sub_set,lines(Time,as.numeric(as.character(Sub_metering_1))))
        with(sub_set,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
        with(sub_set,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
        legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
        plot(sub_set$Time,as.numeric(as.character(sub_set$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})