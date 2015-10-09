##plot3 three variables by time in one graph##

##read data##
sample_data<-read.table("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";",header=TRUE, nrow=5)
classes<-sapply(sample_data,class)
mydata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, na.strings=c("?"), sep=";", header =TRUE,colClasses =classes)

##convert first two column types##
mydata1<-transform(mydata, Date=as.Date(Date,"%d/%m/%Y"),Time=strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))

##subset data##
mydata2<-subset(mydata1,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

##plot##
png("plot3.png",height=480, width=480)
with(mydata2,plot(Time,Sub_metering_1,type="l", xlab="", ylab="", col="black"))

par(new=TRUE)
with(mydata2,plot(Time,Sub_metering_2,type="l", col="red", xlab="", ylab="", ylim=c(0,max(Sub_metering_1))))
par(new=TRUE)
with(mydata2,plot(Time,Sub_metering_3,type="l", col="blue", xlab="", ylab="Energy sub metering",ylim=c(0,max(Sub_metering_1))))

#legend#
legend("topright",lty=c(1,1), col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()