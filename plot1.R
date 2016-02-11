getwd()
data1<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",sep=";")
good1<-data1[1]=="1/2/2007"
good2<-data1[1]=="2/2/2007"

data21<-as.numeric(as.character(data1[good1,][,3]))
data22<-as.numeric(as.character(data1[good2,][,3]))

cb<-t(cbind(t(data21),t(data22)))

hist(cb,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")