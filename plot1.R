activity_url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
temp <- tempfile()
download.file(activity_url, temp)
unzip(temp, "household_power_consumption.txt")

# Subsetting from the whole data
data <- subset(read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE), Date == "1/2/2007" | Date == "2/2/2007")
unlink(temp)

# alternatively#
# setwd("~/coursera/exploratory-data-analysis") # from file saved in directory
# data <- subset(read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE), Date == "1/2/2007" | Date == "2/2/2007")

str(data)

# PLOT 1

png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()