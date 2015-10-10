hhpc <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";",
                   stringsAsFactors=FALSE, na.strings="?")
headings <- unlist(strsplit(readLines("household_power_consumption.txt", 1), ";"))
colnames(hhpc) <- headings
rm(headings)
hhpc$DateTime <- as.POSIXct(paste(hhpc$Date, hhpc$Time), tz="US/Pacific",
                            format="%d/%m/%Y %H:%M:%S")
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(hhpc$DateTime, hhpc$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")
plot(hhpc$DateTime, hhpc$Voltage, type="l", xlab="datetime",
     ylab="Voltage")
plot(hhpc$DateTime, hhpc$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(hhpc$DateTime, hhpc$Sub_metering_2, col="red")
lines(hhpc$DateTime, hhpc$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"), bty="n")
plot(hhpc$DateTime, hhpc$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")
dev.off()