
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y") # Date column is converted into date type

mysubset <- subset(mydata, Date>="2007-2-1" & Date <="2007-2-2") #subset for the specific period

mysubset$datatime <- paste(mysubset$Date,mysubset$Time)

mysubset$datatime <- strptime(mysubset$datatime, "%Y-%m-%d %H:%M:%S")

# Printing to PNG file

png(filename="plot3.png",height = 480,width = 480)

plot(mysubset$datatime,mysubset$Sub_metering_1,type="l", main="", xlab="",ylab="Energy sub-metering")
lines(mysubset$datatime,mysubset$Sub_metering_2,col="red")
lines(mysubset$datatime,mysubset$Sub_metering_3,col="blue")


legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()