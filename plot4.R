#reading the data
power.data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec=".",na.strings="?")
#exploring the data that has been read to determine how to proceed with plots
str(power.data)
#transforming Date and Time fields to select the records necessary for the plots #saving the original records before making changes
power.data$Date<-as.Date(power.data$Date,"%d/%m/%Y")
#checking structure of the data uploaded
str(power.data) 
#transforming the DATE field
power.data$DateTime<-paste(power.data$Date, power.data$Time)
power.data$DateTime<-strptime(power.data$DateTime, "%Y-%m-%d %H:%M:%S")
#checking the transformed data is correct
str(power.data)
#selection of subset for plots creating new object power.data.ss
date1<-strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")
date2<-strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S")
myperiod<-function(x,y){power.data[power.data$DateTime >= x & power.data$DateTime <= y,]}
power.data.ss<-myperiod(date1,date2)
#checking the resulting subset makes sense in terms of format and number of records selected
str(power.data.ss)
#contents of power.data.ss 3120 observations including 9 variables each - OK
#
#creating temporary variables to reduce the length of the commands that have to be written
x1<-power.data.ss$DateTime
y1<-power.data.ss$Sub_metering_1
x2<-power.data.ss$DateTime
y2<-power.data.ss$Sub_metering_2
x3<-power.data.ss$DateTime
y3<-power.data.ss$Sub_metering_3

#as the plots are initialy visualized on the screen proceed to transform the display dividing it in four sections
par(mfrow = c(2, 2))
plot(power.data.ss$DateTime,power.data.ss$Global_active_power,type = "l",col = "black", lwd = 1, ylab = "Global Active Power",xlab=" ")
plot(power.data.ss$DateTime,power.data.ss$Voltage,type="l",col="black",lwd=1,ylab="Voltage",xlab="datetime")
#have not included legend because did not manage to scale it in the correct manner
plot(power.data.ss$DateTime,power.data.ss$Sub_metering_1,type="l",col="black",lwd=1,ylab="Energy sub-metering",xlab=" ")
lines(x2,y2,col="red")
lines(x3,y3,col="blue")
plot(power.data.ss$DateTime,power.data.ss$Global_reactive_power,type="l",col="black",lwd=1,ylab="Global_reactive_power",xlab="datetime")
dev.print(png, file = "plot4.png", width = 480, height = 480)