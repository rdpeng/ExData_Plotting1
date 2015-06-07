zipFile <- "exdata-data-household_power_consumption.zip"
zipFile <- "exdata-data-household_power_consumption.zip"
textFile <- "household_power_consumption.txt"
colClasses <- c("character", "character", rep("numeric",7))
data <- read.csv(unz(zipFile, textFile), header = TRUE, sep = ";", na.strings = "?", colClasses= colClasses)
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date >= as.Date("2007/02/01") & data$Date <= ("2007/02/02"),]


title = "Global Active Power"
x_axis = "Global Active Power (kilowatts)"
y_axis = "Frequency"
hist(data$Global_active_power, freq=TRUE,col = "red", main=title, xlab = x_axis, ylab = y_axis)


dev.copy(png,"figure/plot1.png",width=480,height=480)
dev.off()
