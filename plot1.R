### Plot 1 ###
# download source data
zipURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(zipURL, "./data.zip", method="auto")
unzip("./data.zip")
file.remove("./data.zip")

# read data into R
SrcFile <- "./household_power_consumption.txt"
SrcData <- read.table(SrcFile, header=TRUE, sep=";", , as.is = TRUE)

# Sebset data for analysis
SrcData["Date"] <- as.Date(SrcData$Date,"%d/%m/%Y")
Data <- subset(SrcData, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# plot png graphic & output
png("./plot1.png", width=480, height=480)
hist(as.numeric(Data$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
