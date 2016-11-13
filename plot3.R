#################################################
# type = plot with 3 lines
# xlab = datetime, ylab = sub metering 1, 2, 3
#################################################

#set locale with english
Sys.setlocale("LC_TIME", "English")

# open grahic device
if(dev.cur() == 1) dev.new()


# load data
dataFile <- "./household_power_consumption.txt"
dataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)
data <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# create a plot
with(data, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(DateTime, Sub_metering_2, type="l", col="red"))
with(data, lines(DateTime, Sub_metering_3, type="l", col="blue"))

legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1)

# copy to png from windows
dev.copy(png, "./plot3.png", width=480, height=480)

# close device
dev.off()