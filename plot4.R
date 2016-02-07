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
par(mfrow=c(2,2))
plot(data$Global_active_power~Date.Time, type="l", ylab="Global Active Power (killowatts)", xlab="")
plot(data$Voltage~Date.Time, type="l", ylab="Voltage", xlab="datetime")
plot(data$Sub_metering_1~Date.Time, type="l", ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~Date.Time, type="l", col="red")
lines(data$Sub_metering_3~Date.Time, type="l", col="blue")
legend("topright", col=c("black","red","blue"), lty=1, lwd=2,
legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data$Global_reactive_power~Date.Time, type="l", ylab="Global_reactive_power", xlab="datetime")
#make a copy
dev.copy(png, file="plot4.png",height=480, width=480)
dev.off()