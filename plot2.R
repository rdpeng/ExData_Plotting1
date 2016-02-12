getwd()
data1<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",sep=";")
good1<-data1[1]=="1/2/2007"
good2<-data1[1]=="2/2/2007"

data21<-as.numeric(as.character(data1[good1,][,3]))
data22<-as.numeric(as.character(data1[good2,][,3]))

cb<-t(cbind(t(data21),t(data22)))
x<-seq(1:length(cb))
plot(x,cb,type="l",xaxt="n",xlab="datetime",ylab="Global Active Power (kilowatts)")

axis(side=1,at=c(0,length(cb)/2,length(cb)),labels=c("Thu","Fri","Sat"))