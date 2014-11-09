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
################
#build plot 3 and save as png file
png(file="plot3.png",width=480,height=480)
plot(newdate,power2$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
#add the second line
points(newdate,power2$Sub_metering_2,type="l",col="red")
#add the third line
points(newdate,power2$Sub_metering_3,type="l",col="Blue")
#add legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=1)
dev.off()
