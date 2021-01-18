#read csv
HPC<-read.table("household_power_consumption.txt",sep=";",header=T)

#convert Date and Time into Dime/Time class
HPC$Time<-strptime(paste(HPC$Date,HPC$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
HPC$Date<-as.Date(HPC$Date,format="%d/%m/%Y")

#Extract only Februaly 1 to 2 in 2007
HPC_Feb<-HPC[(HPC$Date>="2007-02-01")&(HPC$Date<"2007-02-03"),]


#save as png file
png(filename = "Plot4.png",
    width = 480, height = 480, units = "px")

#plot 2*2
par(mfrow=c(2,2),mar=c(4,4,4,4),cex=0.7)

#make plot1_Globa_active_power 
    plot(HPC_Feb$Time,HPC_Feb$Global_active_power,type="l",xlab="",ylab="Global Active Power")
#make plot2_Voltage
    HPC_Feb$Voltage<-as.numeric(HPC_Feb$Voltage)
    plot(HPC_Feb$Time,HPC_Feb$Voltage,type="l",xlab="datetime",ylab="Voltage")    
#make plot3    
    #sub_metering_1
    plot(HPC_Feb$Time,HPC_Feb$Sub_metering_1,type="l",xlab="",ylab="Energy Sub metering")
    #sub_metering_2
    lines(HPC_Feb$Time,HPC_Feb$Sub_metering_2, col = "red")
    #sub_metering_#
    lines(HPC_Feb$Time,HPC_Feb$Sub_metering_3, col = "blue")
    #legend
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"),lty=c(1,1,1), box.col ="white",box.lwd = 0,cex = 0.7)
#make plot4_Global_reactive_power
    HPC_Feb$Globa_reactive_power<-as.numeric(HPC_Feb$Global_reactive_power)
    plot(HPC_Feb$Time,HPC_Feb$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
    
dev.off()