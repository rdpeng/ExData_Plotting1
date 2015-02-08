
setwd("C:/Users/mrobien/Documents/R/GetCleanData")
HPC <- read.csv2("household_power_consumption.txt",na.strings="?",stringsAsFactors=FALSE)

HPC$Date<-as.Date(HPC$Date,"%d/%m/%Y")
HPC$DateTime <- paste(HPC$Date,HPC$Time)
HPC$OldTime <- HPC$Time
HPC$Time <- strptime(HPC$DateTime,"%Y-%m-%d %H:%M:%S")

HPCsub<- HPC[(HPC$Date=="2007-02-01"|HPC$Date=="2007-02-02"),]
rm(HPC)

HPCsub$Global_active_power <- as.numeric(HPCsub$Global_active_power)
HPCsub$Global_reactive_power <- as.numeric(HPCsub$Global_reactive_power)
HPCsub$Global_intensity <- as.numeric(HPCsub$Global_intensity)
HPCsub$Voltage        <- as.numeric(HPCsub$Voltage)
HPCsub$Sub_metering_1 <- as.numeric(HPCsub$Sub_metering_1)
HPCsub$Sub_metering_2 <- as.numeric(HPCsub$Sub_metering_2)
HPCsub$Sub_metering_3 <- as.numeric(HPCsub$Sub_metering_3)

png("plot4.png")
par(mfcol=c(2,2))
plot(HPCsub$Time , HPCsub$Global_active_power,type="l",
     xlab="",ylab="Global Active Power")

plot(HPCsub$Time , HPCsub$Sub_metering_1,type="l",
     xlab="",ylab="Energy sub metering")
lines(HPCsub$Time, HPCsub$Sub_metering_2,col="red")
lines(HPCsub$Time, HPCsub$Sub_metering_3,col="blue")
legend("topright",lty=1,bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))

plot(HPCsub$Time , HPCsub$Voltage,type="l",
     xlab="datetime",ylab="Voltage")

plot(HPCsub$Time , HPCsub$Global_reactive_power,type="l",
     xlab="datetime",ylab="Global_reactive_power")

dev.off()

