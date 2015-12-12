alldata <- read.table("/Users/yuanbo/Desktop/coursera/Exploratory_Data_Analysis/project1/household_power_consumption.txt", stringsAsFactors=FALSE, sep = ";", header=TRUE, na.strings = "?")
alldataDate <- as.Date(alldata$Date, "%d/%m/%Y")
alldataWeekday <- weekdays(alldataDate)
alldata$Date <- alldataDate
alldata$Weekdays <- alldataWeekday
par(mar = c(4,4,2,2))
png("/Users/yuanbo/Desktop/coursera/Exploratory_Data_Analysis/project1/plot1.png")
with(subset(alldata, alldata$Date == "2007-02-01" | alldata$Date == "2007-02-02"), hist(Global_active_power, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col="red"))