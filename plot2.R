#################################################
# type = plot
# xlab = datetime, ylab = global active power
#################################################


#set locale with english
Sys.setlocale("LC_TIME", "English")

# open grahic device
if(dev.cur() == 1) dev.new()

# load data
dataFile <- "./household_power_consumption.txt"
dataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)
data <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))

data$Global_active_power <- as.numeric(data$Global_active_power)
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# create a plot
with(data, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# copy to png from windows
dev.copy(png, "./plot2.png", width=480, height=480)

# close device
dev.off()