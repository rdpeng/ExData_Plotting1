dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)
sub$Global_active_power <- as.numeric(sub$Global_active_power)
png("plot1.png",width = 480,height = 480)
with(sub,hist(x =sub$Global_active_power,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col="red"))
dev.off()



