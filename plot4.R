# Read data, convert dates and subset on two days in February 2007
household_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
household_data$DateTime <- strptime(paste(household_data$Date, household_data$Time), "%d/%m/%Y %H:%M:%S")

household_data <- subset(household_data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))
head(household_data)


### Plot4
png(filename="plot4.png", width=480, height=480, units="px")
op = par(mfrow=c(2, 2))
#1
with(household_data, plot(DateTime, Global_active_power, type='l', ylab="Global Active Power", xlab=""))
#2
with(household_data, plot(DateTime, Voltage, type="l", ylab ="Voltage", xlab="datetime"))
#3
with(household_data, plot(DateTime, Sub_metering_1, type="l", ylab ="Energy sub metering", xlab = ""))
with(household_data, lines(DateTime, Sub_metering_2, col="red"))
with(household_data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),  lty=c(1,1))
#4
with(household_data, plot(DateTime, Global_reactive_power, type="l", ylab ="Global_reactive_power", xlab="datetime"))
dev.off()
par(op)
