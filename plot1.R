#plot 1
PowerConsumption <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
head(PowerConsumption)
dim(PowerConsumption)
class(PowerConsumption)

#Plot 1 - using data from the dates 02-01-2007 and 02-02-2007
PowerConsumption$Date=strptime(PowerConsumption$Date, format="%d/%m/%Y")
PowerConsumption$Global_active_power=as.numeric(PowerConsumption$Global_active_power)
PowerConsumption$Global_intensity=as.numeric(PowerConsumption$Global_intensity)
PowerConsumption$Global_reactive_power=as.numeric(PowerConsumption$Global_reactive_power)
PowerConsumption$Sub_metering_1=as.numeric(PowerConsumption$Sub_metering_1)
PowerConsumption$Sub_metering_2=as.numeric(PowerConsumption$Sub_metering_2)
PowerConsumption$Sub_metering_3=as.numeric(PowerConsumption$Sub_metering_3)
PowerConsumption$Voltage=as.numeric(PowerConsumption$Voltage)

PowerConsumption=subset(PowerConsumption,PowerConsumption$Date>as.POSIXlt("2007-01-31") & PowerConsumption$Date<as.POSIXlt("2007-02-03"))

png(file="plot1.png",width=480,height=480)
hist(PowerConsumption$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
