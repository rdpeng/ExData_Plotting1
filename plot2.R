bigData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data2use <- bigData[bigData$Date %in% c("1/2/2007","2/2/2007"),]
rm(bigData)
datetime <- strptime(paste(data2use$Date, data2use$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime,as.numeric(data2use$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()