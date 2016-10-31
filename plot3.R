### Plot 3 ###
# read data into R
SrcFile <- "./household_power_consumption.txt"
SrcData <- read.table(SrcFile, header=TRUE, sep=";", , as.is = TRUE)

# Sebset data for analysis
SrcData["Date"] <- as.Date(SrcData$Date,"%d/%m/%Y")
Data <- subset(SrcData, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
DT <- strptime(paste(Data$Date, Data$Time),"%Y-%m-%d %H:%M:%S")

# plot png graphic & output
png("./plot3.png", width=480, height=480)
plot(DT, as.numeric(Data$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(DT, as.numeric(Data$Sub_metering_2), type="l", col="red")
lines(DT, as.numeric(Data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()