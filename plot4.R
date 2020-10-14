## Import file
data<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=F, na.strings="?")
## Create new datetime field which concatenates the date and time fields
datetime=strptime(paste(data$Date,data$Time),format="%e/%m/%Y %H:%M:%S")
##add new field to original data table
data<-cbind(data,datetime)
##Convert date field to data type of Date
data$Date<-as.Date(data$Date, format ="%e/%m/%Y")
##Filter data table by dates between 1/2/2007 and 2/2/2007
data2<-subset(data,Date >= as.Date("01/02/2007", format ="%e/%m/%Y") & Date <= as.Date("02/02/2007", format ="%e/%m/%Y") )


#plot4
par(mfrow=c(2,2))
plot(data2$Global_active_power ~ data2$datetime,type="l",xlab="",ylab="Global Active Power")
plot(data2$Voltage ~ data2$datetime,type="l",xlab="datetime",ylab="Voltage")

with(data2,plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
points(data2$datetime,data2$Sub_metering_1,col="black",type="l")
points(data2$datetime,data2$Sub_metering_2,col="red",type="l")
points(data2$datetime,data2$Sub_metering_3,col="blue",type="l")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_Metering_3"),col=c("black","red", "blue"),lty=1)

plot(data2$Global_reactive_power ~ data2$datetime,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,"plot4.png",width=480,height=480)
dev.off()
