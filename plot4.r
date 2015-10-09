##plot4 four plots##

##read data##
sample_data<-read.table("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";",header=TRUE, nrow=5)
classes<-sapply(sample_data,class)
mydata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, na.strings=c("?"), sep=";", header =TRUE,colClasses =classes)

##convert first two column types##
mydata1<-transform(mydata, Date=as.Date(Date,"%d/%m/%Y"),Time=strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))

##subset data##
mydata2<-subset(mydata1,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

##2*2 plots##
png("plot4.png",height=480, width=480)
par(mfrow=c(2,2),cex.lab=1.3,cex=0.7)

##top left plot##
with(mydata2,plot(Time,Global_active_power,type="l", xlab="",ylab="Global Active Power"))

##top right plot##
with(mydata2,plot(Time,Voltage,type="l", xlab="datetime", ylab="voltage", col="black"))

##bottom left plot##
with(mydata2,plot(Time,Sub_metering_1,type="l", xlab="", ylab="Energy sub metering", col="black"))

with(mydata2,lines(Time,Sub_metering_2,type="l", col="red"))

with(mydata2,lines(Time,Sub_metering_3,type="l", col="blue"))

#add legend#
legend("topright",lty=c(1,1), col=c("black","red","blue"),bty='n',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##bottom right plot##
with(mydata2,plot(Time,Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power", col="black"))

dev.off()