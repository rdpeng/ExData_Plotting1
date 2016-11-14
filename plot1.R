#################################################
# type = histogram
# xlab = global active power
#################################################

# open graphic device
if(dev.cur() == 1) dev.new()

# load data
dataFile <- "./household_power_consumption.txt"
dataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)
data <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))


# create histogram
hist(as.numeric(data$Global_active_power), col="red", main="Golbal Active Power", xlab="Global Active Power (kilowatts)")

# copy to png from windows
dev.copy(png, "./plot1.png", width=480, height=480)

# close device
dev.off()

