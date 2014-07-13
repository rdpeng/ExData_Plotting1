options(stringsAsFactors = FALSE)
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data <- data[as.Date(as.character(data$Date), format = "%d/%m/%Y") %in% c(as.Date("2007-2-1"):as.Date("2007-2-2")),]
data$x <- strptime(paste(as.Date(data[,1], format = "%d/%m/%Y"), data[,2]), "%Y-%m-%d %H:%M:%S")
png(width = 480, height = 480, file = "plot2.png")
plot(data[,10], as.numeric(data[,3]), type = "l", xlab = NA, ylab = "Global active power (kilowatts)")
dev.off()