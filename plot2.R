## Only Read Data File for 1st and 2nd of Feb 2007. 
DF <- read.table("household_power_consumption.txt",sep=";",na.strings="?",skip=grep("1/2/2007", readLines("household_power_consumption.txt"))-1,nrows=2880)
colnames(DF) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Prepare DateTime Field for plotting

DF$datetime <- strptime(paste(DF$Date, DF$Time), format = "%d/%m/%Y %H:%M:%S")

## 2 - Second Plot, Plot Global Acitve Power against time and date
##     and output to png file plot2.png

png(filename = "plot2.png",width = 480, height = 480)
plot(DF$datetime, DF$Global_active_power,xlab="",ylab="Global Active Power (Kilowatts)", type = "l")
dev.off()
