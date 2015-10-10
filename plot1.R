setwd("E:/Data Science/EDA")

wholeData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

febData <- subset(wholeData, Date %in% c("1/2/2007","2/2/2007"))

GlobalActivePower <- as.numeric(febData$Global_active_power)

png("plot1.png", width=480, height=480)
hist(GlobalActivePower, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

