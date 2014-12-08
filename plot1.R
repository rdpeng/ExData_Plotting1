##read in the data, and subset it just for the dates needed
full_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") ,]

## make plot1, a histogram with red bars
globalActivePower <- as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
