#read data
dat <- read.delim(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.txt"),header=TRUE,sep=";",na.strings="?")

#transform data
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

#subset data
datsub <- subset(dat,Date=="2007-02-01"|Date=="2007-02-02")

#transform data
datsub[,3:9]<-lapply(datsub[,3:9],as.numeric)

#create DateTime variable
DateTime <- as.POSIXlt(strptime(paste(datsub$Date,datsub$Time),format="%Y-%m-%d %H:%M:%S",tz=""))

par(mfrow=c(2,2))

#plot top left
plot(DateTime,datsub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#plot top right
plot(DateTime,datsub$Voltage,type="l",xlab="datetime",ylab="Voltage")

#plot bottom left
with(datsub,{
    plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
    lines(DateTime,Sub_metering_2,col="red")
    lines(DateTime,Sub_metering_3,col="blue")
    legend('topright', legend=c(names(datsub[,7:9])),col=c('black','red','blue'),lty=1,box.lty =0,x.intersp=2.5,adj=0.2)
    box(which="plot",lty="solid")
    })

#plot bottom right
plot(DateTime,datsub$Global_reactive_power,type="l",xlab="datetime",ylab="Voltage")

#output to png file and close device
dev.copy(png,file="Plot4.png",width=480,height=480)
dev.off()