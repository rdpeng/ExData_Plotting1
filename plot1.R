bigData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data2use <- bigData[bigData$Date %in% c("1/2/2007","2/2/2007"),]
rm(bigData)
png("plot1.png", width=480, height=480)
hist(as.numeric(data2use$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()