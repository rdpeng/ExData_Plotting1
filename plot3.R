alldata <- read.table("/Users/Yuan/Desktop/coursera/Exploratory_Data_Analysis/project1/household_power_consumption.txt", stringsAsFactors=FALSE, sep = ";", header=TRUE, na.strings = "?")
alldataDate <- as.Date(alldata$Date, "%d/%m/%Y")
alldataWeekday <- weekdays(alldataDate)
alldata$Date <- alldataDate
alldata$Weekdays <- alldataWeekday
DataUse <- subset(alldata, alldata$Date == "2007-02-01" | alldata$Date == "2007-02-02")
DataUse$Timepoints <- 1:2880
par(mar = c(4,4,2,2))
png("/Users/Yuan/Desktop/coursera/Exploratory_Data_Analysis/project1/plot3.png")
plot(DataUse$Timepoints, DataUse$Sub_metering_1, type = "l",xaxt = "n", ylab = "Energy sub metering", xlab = "")
points(DataUse$Timepoints, DataUse$Sub_metering_2, type = "l", col = "red")
points(DataUse$Timepoints, DataUse$Sub_metering_3, type = "l", col = "blue")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
legend("topright", lty=c(1,1), col = c("black", "red","blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()