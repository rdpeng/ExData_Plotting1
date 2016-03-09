electric <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
electric$Date2 <- as.POSIXct(paste(electric$Date,electric$Time), format="%d/%m/%Y %H:%M:%S")
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")
electric$Global_active_power <- as.numeric(electric$Global_active_power)
electric <- subset(electric, Date == "2007-02-01"|Date == "2007-02-02")
# graph the histogram 
png("plot1.png", width = 480, height = 480)
  hist(electric$Global_active_power, xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", col = "red")
dev.off()