# Read data in and format date
housepower <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep=";", na.strings = "?")
housepower$Date <- as.Date(housepower$Date, format="%d/%m/%Y")

# Subset the data to desired dates
housepower <- subset(housepower, Date == "2007-02-01" | Date == "2007-02-02")

# Create Plot
mypath <- file.path(getwd() ,"plot1.png")
png(file=mypath, width = 480, height = 480)
with(housepower, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()
