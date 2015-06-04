data_set <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
mini_data_set <- data_set[data_set$Date %in% c("1/2/2007","2/2/2007") ,]

date_time <- strptime(paste(mini_data_set$Date, mini_data_set$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_Metering_1 <- as.numeric(mini_data_set$Sub_metering_1)
sub_Metering_2 <- as.numeric(mini_data_set$Sub_metering_2)
sub_Metering_3 <- as.numeric(mini_data_set$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(date_time, sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_Metering_2, type="l", col="red")
lines(date_time, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
