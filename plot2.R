fpath <- "household_power_consumption.txt"
df <- read.table(fpath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
twodays <- data[df$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(twodays$Date, twodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(twodays$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()