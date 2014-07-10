data <- read.table(file="household_power_consumption.txt", sep=";", skip=66637, nrows=2880, header=FALSE, stringsAsFactors=FALSE)
png(filename="plot1.png", width=480, height=480, antialias="cleartype")
hist(data[,3], main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
