

## Read data

gpa <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header=TRUE, sep=';')

## Subset Data for the Date Range

gpa2 <- subset(gpa, Date=="1/2/2007" | Date=="2/2/2007")

dt <- strptime(paste(gpa2$Date, gpa2$Time), "%d/%m/%Y %H:%M:%S")

with(gpa2, plot(dt, as.numeric(Sub_metering_1), type="l", xlab="", ylab="Energy sub metering"))
with(gpa2, points(dt, as.numeric(Sub_metering_2), type="l", col="Red"))
with(gpa2, points(dt, as.numeric(Sub_metering_3), type="l", col="Blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
