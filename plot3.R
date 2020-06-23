#reading the file
hpc<-read.csv2("household_power_consumption.txt",colClasses = "character")

##converting date column as a date variable and subsetting the required dates
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
hp<-hpc[hpc$Date>="2007-02-01" & hpc$Date<="2007-02-02",]

##converting time column as POSIXlt variable by adding the corresponding date
hp$Time<-paste(hp$Date,hp$Time)
hp$Time<-strptime(hp$Time,"%Y-%m-%d %H:%M:%S")

##converting rest of the columns into numeric variables
hp[,3:9]<-sapply(hp[,3:9],as.numeric)

#plotting
plot(hp$Time,hp$Sub_metering_1,xlab="",ylab = "Energy Sub Metering",type="n")
lines(hp$Time,hp$Sub_metering_1)
lines(hp$Time,hp$Sub_metering_2,col="red")
lines(hp$Time,hp$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty=1,inset=.04)

##sending to file device
dev.copy(png,"plot3.png")
dev.off()