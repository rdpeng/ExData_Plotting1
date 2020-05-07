fpath <- "household_power_consumption.txt"
df <- read.table(fpath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
twodays <- data[df$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(twodays$Date, twodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subm1 <- as.numeric(twodays$Sub_metering_1)
subm2 <- as.numeric(twodays$Sub_metering_2)
subm3 <- as.numeric(twodays$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, subm1, type="l", ylab="Energy subm", xlab="")
lines(datetime, subm2, type="l", col="red")
lines(datetime, subm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()