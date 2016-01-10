#Downloading file from URL
download.file(url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',destfile='localfile.zip', method='auto')
Unzipping
unzip ("localfile.zip", exdir = ".")
list.files(".")
data<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE, dec=".")
#Verifying the data
str(data)
summary(data)
#Subsetting
filter=subset(data,Date=="1/2/2007"|Date=="2/2/2007")
filter$Global_active_power=as.numeric(filter$Global_active_power)

#Plot3
datetime <- strptime(paste(filter$Date, filter$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
filter$Sub_metering_1 <- as.numeric(filter$Sub_metering_1)
filter$Sub_metering_2 <- as.numeric(filter$Sub_metering_2)
filter$Sub_metering_3 <- as.numeric(filter$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, filter$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, filter$Sub_metering_2, type="l", col="red")
lines(datetime, filter$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() 
