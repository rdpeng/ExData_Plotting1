# Read data in and format date
housepower <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep=";", na.strings = "?")
housepower$Date <- as.Date(housepower$Date, format="%d/%m/%Y")

# Subset the data to desired dates
housepower <- subset(housepower, Date == "2007-02-01" | Date == "2007-02-02")

# Create datetime value
datetime <- paste(as.Date(housepower$Date), housepower$Time)
housepower$datetime <- as.POSIXct(datetime)




# Create Plot
mypath <- file.path(getwd() ,"plot3.png")
png(file=mypath, width = 480, height = 480)
with(housepower, plot(datetime, Sub_metering_1, type = "l", xlab="",ylab = "Energy sub metering"))
with(housepower, lines(datetime, Sub_metering_2, col = "red"))
with(housepower, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
dev.off()