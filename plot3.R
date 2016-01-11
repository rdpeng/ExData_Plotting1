library(datasets)
alldata <- "./data/household_power_consumption.txt"
data <- read.table(alldata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerconsump2daysdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


date_time <- strptime(paste(powerconsump2daysdata$Date, powerconsump2daysdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(powerconsump2daysdata$Sub_metering_1)
subMetering2 <- as.numeric(powerconsump2daysdata$Sub_metering_2)
subMetering3 <- as.numeric(powerconsump2daysdata$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(date_time, subMetering1, type="l" , xlab=" ", ylab="Energy sub metering", col="black")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2)

dev.off()

