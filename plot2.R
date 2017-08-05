activity_url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
temp <- tempfile()
download.file(activity_url, temp)
unzip(temp, "household_power_consumption.txt")

# Subsetting from the whole data
data <- subset(read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE), Date == "1/2/2007" | Date == "2/2/2007")
unlink(temp)

# PLOT 2

data$Datetime <- paste(data$Date, data$Time) # includes column in data frame
data$Datetime <- strptime(data$Datetime, "%d/%m/%Y %H:%M:%S")

plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )
#save and close device
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()