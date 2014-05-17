

## an script for loading and creating .png figure for figure 4

# loading the data
data_<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# subsetting the data
data_sel<-data_[data_$Date == "1/2/2007" | data_$Date ==  "2/2/2007",]
dandt_<-paste(data_sel$Date,data_sel$Time)
dandt_<-strptime(dandt_,"%d/%m/%Y %T")

# making the plots
png(filename="./plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))

# first subplot
plot(dandt_,data_sel$Global_active_power,ylab="Global Active Power",xlab="",type="n")
lines(dandt_,data_sel$Global_active_power)

# second subplot
plot(dandt_,data_sel$Voltage,ylab="Voltage",xlab="datetime",type="n")
lines(dandt_,data_sel$Voltage)

# third subplot
plot(dandt_,data_sel$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n")
lines(dandt_,data_sel$Sub_metering_1)
lines(dandt_,data_sel$Sub_metering_2,col="red")
lines(dandt_,data_sel$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,bty="n")

# fourth subplot
plot(dandt_,data_sel$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="n")
lines(dandt_,data_sel$Global_reactive_power)

dev.off()

