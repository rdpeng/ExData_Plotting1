data<-read.table("household_power_consumption.txt",nrows=150000, header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings="?")
mydata<-strptime((paste(data$Date, data$Time, sep=" ")), "%d/%m/%Y %H:%M:%S")
mydata1<-cbind(mydata,data)
colnames(mydata1)[1]<-"Date2"
mydata2<-subset(mydata1, Date=="1/2/2007" | Date=="2/2/2007")
plot(mydata2$Date2, mydata2$Global_active_power, xlab="", type="l", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="Plot2.png")
dev.off()
