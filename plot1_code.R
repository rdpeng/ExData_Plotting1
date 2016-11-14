
infile <- "household_power_consumption.txt"
plots <- read.table(infile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot1 <- plots[plots$Date %in% c("1/2/2007", "2/2/2007"),]
GAP <- as.numeric(plot1$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GAP, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()    
