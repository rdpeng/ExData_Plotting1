myDataFile <- "./data/household_power_consumption.txt"
myData <- read.table(myDataFile,header = TRUE,sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")
mySubsetData <- subset (myData, Date %in% c("1/2/2007", "2/2/2007"))
mySubsetData$Date <- as.Date(mySubsetData$Date, format="%d/%m/%Y")
hist(mySubsetData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.copy(png, file="plot1.png", height=480, width=600)
dev.off()
