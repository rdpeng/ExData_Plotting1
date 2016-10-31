### Plot 2 ###
# read data into R
SrcFile <- "./household_power_consumption.txt"
SrcData <- read.table(SrcFile, header=TRUE, sep=";", , as.is = TRUE)

# Sebset data for analysis
SrcData["Date"] <- as.Date(SrcData$Date,"%d/%m/%Y")
Data <- subset(SrcData, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
DT <- strptime(paste(Data$Date, Data$Time),"%Y-%m-%d %H:%M:%S")

# plot png graphic & output
png("./plot2.png", width=480, height=480)
plot(DT, Data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
