# Read the data
electric <- read.table("data6/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Make from the Date (character) a real Date field and select only the two days we want
electric <- mutate(electric, Date2 = as.Date(Date, "%d/%m/%Y"))
electricFeb <- subset(electric, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))

# Create a DateTime field
electricFeb <- mutate(electricFeb, DateTime = strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))

# Make the histogram for plot1
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(electricFeb$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()