#plot 2
PowerConsumption=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
DateTimeFunction=function(x,y) {paste(x,y,sep=" ")}

PowerConsumption$Date_Time1=mapply(DateTimeFunction,PowerConsumption$Date,PowerConsumption$Time)
PowerConsumption$Date_Time=strptime(PowerConsumption$Date_Time1,format="%d/%m/%Y %H:%M:%S")
PowerConsumption$Date=strptime(PowerConsumption$Date, format="%d/%m/%Y")
PowerConsumption$Global_active_power=as.numeric(PowerConsumption$Global_active_power)
PowerConsumption$Global_intensity=as.numeric(PowerConsumption$Global_intensity)
PowerConsumption$Global_reactive_power=as.numeric(PowerConsumption$Global_reactive_power)
PowerConsumption$Sub_metering_1=as.numeric(PowerConsumption$Sub_metering_1)
PowerConsumption$Sub_metering_2=as.numeric(PowerConsumption$Sub_metering_2)
PowerConsumption$Sub_metering_3=as.numeric(PowerConsumption$Sub_metering_3)
PowerConsumption$Voltage=as.numeric(PowerConsumption$Voltage)

PowerConsumption=subset(PowerConsumption,PowerConsumption$Date>as.POSIXlt("2007-01-31") & PowerConsumption$Date<as.POSIXlt("2007-02-03"))

png(file="plot2.png",width=480,height=480)
plot(PowerConsumption$Date_Time,PowerConsumption$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
