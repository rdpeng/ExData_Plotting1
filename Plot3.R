#load the file into R
data<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#convert date
data$Date<- strptime(data$Date, "%d/%m/%Y")

#subset data
subdata<-data[data$Date>="2007-02-01" & data$Date<= "2007-02-02",]

#Convert date in subset data
subdata$datetime <- paste(subdata$Date, subdata$Time, sep = " ") 
subdata$datetime<-as.POSIXlt(subdata$datetime)

#Plot and save graph
png(filename="plot3.png", width=480, height=480, units="px")
plot(x=subdata$datetime, y=subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x=subdata$datetime,y=subdata$Sub_metering_2,type="l",col="red")
lines(x=subdata$datetime,y=subdata$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off ()
