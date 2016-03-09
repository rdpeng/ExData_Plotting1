electric <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
electric$Date2 <- as.POSIXct(paste(electric$Date,electric$Time), format="%d/%m/%Y %H:%M:%S")
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")
electric$Global_active_power <- as.numeric(electric$Global_active_power)
electric <- subset(electric, Date == "2007-02-01"|Date == "2007-02-02")
# plotting
png("plot2.png", width = 480, height = 480)
plot(electric$Date2, electric$Global_active_power, xlab ="", ylab = "Global Active Power (Kilowatts)", type = "n")
lines(electric$Date2, electric$Global_active_power)
dev.off()

