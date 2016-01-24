# Read data in and format date
housepower <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep=";", na.strings = "?")
housepower$Date <- as.Date(housepower$Date, format="%d/%m/%Y")

# Subset the data to desired dates
housepower <- subset(housepower, Date == "2007-02-01" | Date == "2007-02-02")

# Create datetime value
datetime <- paste(as.Date(housepower$Date), housepower$Time)
housepower$datetime <- as.POSIXct(datetime)

# Create Plot
mypath <- file.path(getwd() ,"plot2.png")
png(file=mypath, width = 480, height = 480)
plot(housepower$datetime, housepower$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
