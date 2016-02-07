#import data, drop ? missing values
data <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE, stringsAsFactors=FALSE)
#converting to calendar date
data$Date<- as.Date(data$Date, format="%d/%m/%Y")
#subset only 2007-02-01, 2007-02-02 data
data <- subset(data, Date>="2007-02-01"&Date<="2007-02-02")
#converge date and time
DateTime <- paste(as.Date(data$Date), data$Time)
Date.Time <- as.POSIXct(DateTime)
#plotting
plot(data$Sub_metering_1~Date.Time, type="l", ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~Date.Time, type="l", col="red")
lines(data$Sub_metering_3~Date.Time, type="l", col="blue")
legend("topright", col=c("black","red","blue"), lty=1, lwd=2,
legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#make a copy
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()