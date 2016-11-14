#################################################
# type = multi plot( 2 x 2 plot)
# 1 plot
# xlab = datetime, ylab = global active power
# 2 plot
# xlab = datetime, ylab = voltage
# 3 plot
# xlab = datetime, ylab = sub metering 1, 2, 3
# 4 plot
# xlab = datetime, ylab = global reactive power
#################################################

#set locale with english
Sys.setlocale("LC_TIME", "English")

# open grahic device
if(dev.cur() == 1) dev.new()

# create 2x2 plot
par(mfrow=c(2,2))


# load data
dataFile <- "./household_power_consumption.txt"
dataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)
data <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# create first plot
with(data, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

# create second plot
with(data, plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

# create third plot
with(data, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(DateTime, Sub_metering_2, type="l", col="red"))
with(data, lines(DateTime, Sub_metering_3, type="l", col="blue"))

legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n")

# create last plot
with(data, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

# copy to png from windows
dev.copy(png, "./plot4.png", width=480, height=480)

# close device
dev.off()