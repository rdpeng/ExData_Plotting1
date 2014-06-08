##1. Read data into the R environment, storing the data into the variable data1
data1<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")

##1a. Selecting the appropriate data within date range 2007-02-01 and 2007-02-02
data2<-data1[data1$Date=="1/2/2007" | data1$Date=="2/2/2007",]
data2$Date<-as.Date(data2$Date,format="%d/%m/%Y")
dateTime<-data.frame(paste(data2$Date,data2$Time,sep=" "))
names(dateTime)<-"dateTime"
data2<-cbind(data2,dateTime)

##Construct the plot and save it to a 480x480 PNG file
png(filename="plot3.png",width=480,height=480)

##3. Plot data
plot(data2$dateTime,data2$Sub_metering_1,ylab="Energy sub metering",type="l",xaxt="n")
lines(data2$dateTime,data2$Sub_metering_1,ylab="Energy sub metering")
lines(data2$Sub_metering_2, type="l", col="red")
lines(data2$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1,at=1:3,lab=c("Thu","Fri","Sat"))
