data<-read.table("household_power_consumption.txt",nrows=150000, header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings="?")
mydata<-as.Date(data$Date,"%d/%m/%Y")
mydata1<-cbind(mydata,data)
colnames(mydata1)[1]<-"Date2"
mydata2<-subset(mydata1,Date2>="2007-02-01" & Date2<="2007-02-02")
hist(mydata2$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.copy(png, file="Plot1.png")
dev.off()
