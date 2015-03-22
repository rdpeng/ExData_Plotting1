hpc<-read.csv("~/DataScience/exdata_data_household_power_consumption/household_power_consumption.txt", 
                 header=T, 
                 sep=";", 
                 na.strings="?", 
                 stringsAsFactors=F, 
                 nrow=10)

hpc<-read.table("~/DataScience/exdata_data_household_power_consumption/household_power_consumption.txt",
                header=T,na.strings="?",sep=";")

names(hpc)
hpc_s<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]
hpc_s$DateTime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
par("mar")
par(mar=c(3,2,1,2))
hist(hpc_s$Global_active_power, xlab="GlobalAP", col="red", main="Global Active Power")
plot(hpc_s$DateTime, hpc_s$Global_active_power,xlab="",ylab="GAP",type="l")

plot(hpc_s$DateTime, hpc_s$Sub_metering_1,type="l", col="purple")
lines(hpc_s$DateTime, hpc_s$Sub_metering_2,type="l", col="red")
lines(hpc_s$DateTime, hpc_s$Sub_metering_3,type="l", col="yellow")
legend(2,10,hpc_s$Sub_metering_1,col="purple")

plot(hpc_s$DateTime, hpc_s$Global_reactive_power,xlab="",ylab="re_GAP",type="l")
plot(hpc_s$DateTime, hpc_s$Voltage,xlab="",ylab="voltage",type="l")
png(filename="plot3.png", width=480, height=480)

dev.copy(png, file = "plot4.png",units = "px")
dev.off