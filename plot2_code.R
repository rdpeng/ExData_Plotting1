infile <- "household_power_consumption.txt"
plots <- read.table(infile, header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
plot2 <- plots[plots$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(plot2$Date, plot2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(plot2$Global_active_power)
png("plot2.png", width= 480, height= 480)
plot(datetime, GAP, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()