#import data
hpc <- read.table("household_power_consumption.txt",sep=";",header=TRUE,
                  na.strings = "?",stringsAsFactors=TRUE)
hpc$datetime <-  strptime(paste(hpc$Date,hpc$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
hpc_subset <- subset(hpc,as.Date(datetime)=="2007-02-01"|as.Date(datetime)=="2007-02-02")

#plot4
par(mfrow=c(2,2))
plot(hpc_subset$datetime,hpc_subset$Global_active_power,xlab="",ylab="Global Active Power",type="l")
plot(hpc_subset$datetime,hpc_subset$Voltage,xlab="datetime",ylab="Voltage",type="l")
plot(hpc_subset$datetime,hpc_subset$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(hpc_subset$datetime,hpc_subset$Sub_metering_1)
lines(hpc_subset$datetime,hpc_subset$Sub_metering_2,col="red")
lines(hpc_subset$datetime,hpc_subset$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue") ,cex=1,lty =1 ,lwd=1, bty = "n",y.intersp=0.2)
plot(hpc_subset$datetime,hpc_subset$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.copy(png, file="plot4.png",height=480,width=480)
dev.off()