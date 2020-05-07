fpath <- "household_power_consumption.txt"
df <- read.table(fpath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
twodays <- data[df$Date %in% c("1/2/2007","2/2/2007") ,]
gap <- as.numeric(twodays$Global_active_power)
png("plot1.png", width=480, height=480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()