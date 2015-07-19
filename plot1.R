library(data.table)

# load only data from rows starting with 1/2/2007 or 2/2/2007
cols <- colnames(fread("data/household_power_consumption.txt", nrows = 0))
data <- fread("grep ^[12]/2/2007 data/household_power_consumption.txt")
setnames(data, cols)

# make plot 1
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
