
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

png("plot2.png")
plot(HPCsub$Time , HPCsub$Global_active_power,type="l",
     xlab="",ylab="Gloabl Active Power (kilowatts)")
dev.off()
