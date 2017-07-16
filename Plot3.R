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

#plot line chart
with(datsub,{
    plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
    lines(DateTime,Sub_metering_2,col="red")
    lines(DateTime,Sub_metering_3,col="blue")
    legend('topright', legend=c(names(datsub[,7:9])),col=c('black','red','blue'),lty=1,x.intersp=3,adj=0.2)
    })

#output to png file and close device
dev.copy(png,file="Plot3.png",width=480,height=480)
dev.off()