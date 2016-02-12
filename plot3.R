getwd()
data1<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",sep=";")
good1<-data1[1]=="1/2/2007"
good2<-data1[1]=="2/2/2007"

data31<-as.numeric(as.character(data1[good1,][,7]))
data32<-as.numeric(as.character(data1[good2,][,7]))
data41<-as.numeric(as.character(data1[good1,][,8]))
data42<-as.numeric(as.character(data1[good2,][,8]))
data51<-as.numeric(as.character(data1[good1,][,9]))
data52<-as.numeric(as.character(data1[good2,][,9]))

cb1<-t(cbind(t(data31),t(data32)))
cb2<-t(cbind(t(data41),t(data42)))
cb3<-t(cbind(t(data51),t(data52)))

x<-seq(1:length(cb1))
plot(x,cb1,type="l",col="1",xaxt="n",xlab="datetime",ylab="Energy sub metering")
lines(x,cb2,type="l",col="2")
lines(x,cb3,type="l",col="4")
axis(side=1,at=c(0,length(cb1)/2,length(cb1)),labels=c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c('black','red','blue'))
