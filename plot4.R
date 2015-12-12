alldata <- read.table("/Users/Yuan/Desktop/coursera/Exploratory_Data_Analysis/project1/household_power_consumption.txt", stringsAsFactors=FALSE, sep = ";", header=TRUE, na.strings = "?")
alldataDate <- as.Date(alldata$Date, "%d/%m/%Y")
alldataWeekday <- weekdays(alldataDate)
alldata$Date <- alldataDate
alldata$Weekdays <- alldataWeekday
DataUse <- subset(alldata, alldata$Date == "2007-02-01" | alldata$Date == "2007-02-02")
DataUse$Timepoints <- 1:2880

png("/Users/Yuan/Desktop/coursera/Exploratory_Data_Analysis/project1/plot4.png")
par(mfrow = c(2, 2))


plot(DataUse$Timepoints, DataUse$Global_active_power, type = "l",xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(DataUse$Timepoints, DataUse$Voltage, type = "l",xaxt = "n", ylab = "Voltage", xlab = "datetime")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

plot(DataUse$Timepoints, DataUse$Sub_metering_1, type = "l",xaxt = "n", ylab = "Energy sub metering", xlab = "")
points(DataUse$Timepoints, DataUse$Sub_metering_2, type = "l", col = "red")
points(DataUse$Timepoints, DataUse$Sub_metering_3, type = "l", col = "blue")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
legend("topright",lty=c(1,1),bty = "n", col = c("black", "red","blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(DataUse$Timepoints, DataUse$Global_reactive_power, type = "l",xaxt = "n", ylab = "Global_reactive_power", xlab = "datetime")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

dev.off()