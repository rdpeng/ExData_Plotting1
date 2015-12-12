alldata <- read.table("/Users/Yuan/Desktop/coursera/Exploratory_Data_Analysis/project1/household_power_consumption.txt", stringsAsFactors=FALSE, sep = ";", header=TRUE, na.strings = "?")
alldataDate <- as.Date(alldata$Date, "%d/%m/%Y")
alldataWeekday <- weekdays(alldataDate)
alldata$Date <- alldataDate
alldata$Weekdays <- alldataWeekday
DataUse <- subset(alldata, alldata$Date == "2007-02-01" | alldata$Date == "2007-02-02")
DataUse$Timepoints <- 1:2880
par(mar = c(4,4,2,2))
png("/Users/Yuan/Desktop/coursera/Exploratory_Data_Analysis/project1/plot2.png")
plot(DataUse$Timepoints, DataUse$Global_active_power, type = "l",xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
dev.off()