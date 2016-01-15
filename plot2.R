file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)

datime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActive <- as.numeric(sub$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datime, globalActive, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
