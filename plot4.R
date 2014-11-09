#set working directory
setwd("C:/Users/Administrator/Desktop/R/data cleaning")
#read data from txt file, set";"as a indicator, "?"means missing variable
power<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#change the class of "Date" into Date
power$Date<-as.Date(power$Date, "%d/%m/%Y") 
#Change it from factor into numeric
power$Global_active_power<-as.numeric(as.character(power$Global_active_power))
#subset 2007-2-1 & 2007-2-2 data
power2<-subset(power,Date=="2007-2-1" | Date=="2007-2-2")
#Generate a new variable to include the Date and Time
newdate<-strptime(paste(power2$Date,power2$Time),"%Y-%m-%d %H:%M:%OS")
##################
#build plot 4 and save as png file
png(file="plot4.png",width=480,height=480)
#set 2*2 graph
par(mfrow=c(2,2))
#add the first graph
plot(newdate,power2$Global_active_power,type="l",ylab="Global Active Power",xlab="")
#add the second one
plot(newdate,power2$Voltage,type="l",xlab="datetime",ylab="Voltage")
#add the third one
plot(newdate,power2$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(newdate,power2$Sub_metering_2,type="l",col="red")
points(newdate,power2$Sub_metering_3,type="l",col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=0.8,x.intersp=1,bty="n",xpd=F)
#add the forth one
plot(newdate,power2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
