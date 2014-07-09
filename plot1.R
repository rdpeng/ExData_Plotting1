options(stringsAsFactors = FALSE)
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data <- data[as.Date(as.character(data$Date), format = "%d/%m/%Y") %in% c(as.Date("2007-2-1"):as.Date("2007-2-2")),]
png(width = 480, height = 480, file = "plot1.png")
hist(as.numeric(data[,3]), main = "Global Active Power", xlab = "Global active power (kilowatts)", col = "red")
dev.off()
