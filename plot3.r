data<-read.csv("C:/Users/e99579/Desktop/household_power_consumption.txt",
sep=";",
               colClasses = c('character', 'character', 'numeric', 'numeric',
                              'numeric', 'numeric', 'numeric',
'numeric', 'numeric'),
                               na.strings='?')

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data<-subset(data, as.Date(DateTime)>=as.Date("2007-02-01") &
               as.Date(DateTime)<= ("2007-02-02"))

png("plot3.png", height=480, width=480)

plot(data$DateTime, data$Sub_metering_1, pch=NA, xlab="", ylab="Energy
sub metering")
lines(data$DateTime, data$Sub_metering_1, col = 'black')
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright',  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))
dev.off()
