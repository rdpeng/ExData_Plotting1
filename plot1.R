data.main <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")
data <- data.main

data$Time <- paste(data$Date, data$Time, sep = " ")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- as.POSIXct(data$Time, format = "%d/%m/%Y %H:%M:%S")

data.new <- subset(data, Date >= "2007-02-01" & Date < "2007-02-03")

windows(6,6)
hist(as.numeric(data.new$Global_active_power), 
     xlab= "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.copy(png, file= "plot1.png", width = 480, height = 480)
dev.off()
graphics.off()
