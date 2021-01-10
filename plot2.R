#dplyr
library(dplyr)
#read csv
HPC<-read.table("household_power_consumption.txt",sep=";",header=T)

#convert Date and Time into Dime/Time class
HPC$Time<-strptime(paste(HPC$Date,HPC$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
HPC$Date<-as.Date(HPC$Date,format="%d/%m/%Y")

#Extract only Februaly 1 to 2 in 2007
HPC_Feb<-HPC[(HPC$Date>="2007-02-01")&(HPC$Date<"2007-02-03"),]
#conver class (from "character" to "numeric")
HPC_Feb$Global_active_power<-as.numeric(HPC_Feb$Global_active_power)

#save as png file
png(filename = "Plot2.png",
    width = 480, height = 480, units = "px")
#make plot2 
plot(HPC_Feb$Time,HPC_Feb$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()