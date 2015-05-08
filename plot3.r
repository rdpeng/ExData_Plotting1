##plot3
data<-read.csv("household_power_consumption.txt", sep = ";",stringsAsFactors=FALSE,na.strings = "?")##read all data
newdata <- data[which(data$Date=="1/2/2007" | data$Date =="2/2/2007" | data$Date =="3/2/2007"), ]##subest data by date
newdata$Date<- as.POSIXct(newdata$Date,format='%d/%m/%Y')
newdata$day <- weekdays(newdata$Date,abbreviate = TRUE)
time<-seq(1,2881)
png(filename = "plot3.png",width = 480, height = 480)
plot(time,newdata$Sub_metering_1[time], type = "l",xaxt = "n",xlab = "", ylab = "Energy sub metering")
lines(newdata$Sub_metering_2[time], col = "red")
lines(newdata$Sub_metering_3[time], col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
axis(1, c(1,1441,2881),c(newdata$day[1],newdata$day[1441],newdata$day[2881]))
dev.off()