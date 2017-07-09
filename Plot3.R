#import data
hpc <- read.table("household_power_consumption.txt",sep=";",header=TRUE,
                  na.strings = "?",stringsAsFactors=TRUE)
hpc$datetime <-  strptime(paste(hpc$Date,hpc$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
hpc_subset <- subset(hpc,as.Date(datetime)=="2007-02-01"|as.Date(datetime)=="2007-02-02")

#plot3
plot(hpc_subset$datetime,hpc_subset$Sub_metering_1,xlab="",
     ylab="Energy sub metering",type="n")
lines(hpc_subset$datetime,hpc_subset$Sub_metering_1)
lines(hpc_subset$datetime,hpc_subset$Sub_metering_2,col="red")
lines(hpc_subset$datetime,hpc_subset$Sub_metering_3,col="blue")
legend("topright",col = c("black","red","blue") ,lwd=2, lty = 1, 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png",height=480,width=480)
dev.off()