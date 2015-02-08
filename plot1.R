
setwd("C:/Users/mrobien/Documents/R/GetCleanData")
HPC <- read.csv2("household_power_consumption.txt",na.strings="?",stringsAsFactors=FALSE)

HPC$Date<-as.Date(HPC$Date,"%d/%m/%Y")
HPC$DateTime <- paste(HPC$Date,HPC$Time)
HPC$OldTime <- HPC$Time
HPC$Time <- strptime(HPC$DateTime,"%Y-%m-%d %H:%M:%S")

HPCsub<- HPC[(HPC$Date=="2007-02-01"|HPC$Date=="2007-02-02"),]
rm(HPC)

png("plot1.png")
hist(as.numeric(HPCsub$Global_active_power),main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red")
dev.off()
