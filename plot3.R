#read.table("household_power_consumption.txt",skip= ,nrows= )
powerData <-read.table("household_power_consumption.txt",nrows= 2880, sep=";", skip=66637)
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
colnames(powerData) <- unlist(header)

powerData[,1] <- as.Date(powerData[,1], format="%d/%m/%Y")

powerData[,2] <- paste(powerData[,1], powerData[,2])
powerData[[2]] <- strptime(powerData[[2]], format="%Y-%m-%d %H:%M:%S")

png('plot3.png')
#par(mar=c(2,6,2,2), mfrow=c(2, 2))
plot(powerData$Time, powerData$Sub_metering_1, type='n', xlab = "",ylab = "Global Active Power (kilowatts)")
legend("topright", legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c("black", "red", "blue")
       ,  lty=1, cex=0.8)

lines(powerData$Time, powerData$Sub_metering_1, type="l")
lines(powerData$Time, powerData$Sub_metering_2, col='red', type="l")
lines(powerData$Time, powerData$Sub_metering_3, col='blue', type="l")

dev.off()
