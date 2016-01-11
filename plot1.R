library(datasets)
alldata <- "./data/household_power_consumption.txt"
data <- read.table(alldata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerconsump2daysdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

global_actpower <- as.numeric(powerconsump2daysdata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_actpower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()