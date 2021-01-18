#read csv
HPC<-read.table("household_power_consumption.txt",sep=";",header=T)

#convert Date and Time into Dime/Time class
HPC$Date<-as.Date(HPC$Date,format="%d/%m/%Y")
HPC_Feb<-HPC[(HPC$Date=="2007-02-01"|HPC$Date=="2007-02-02"),]

HPC_Feb$Global_active_power<-as.numeric(HPC_Feb$Global_active_power)

#save as png file
png(filename = "Plot1.png",
    width = 480, height = 480, units = "px")
hist(HPC_Feb$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="frequency",main="Global Active Power")

dev.off()