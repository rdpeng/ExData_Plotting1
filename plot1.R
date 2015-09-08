###Read the txt file###

data <- read.table("household_power_consumption.txt", sep = ';')

##Create and assign data names from first row##

column <- c("Date", "Time", "Global_active_power", 
            "Global_reactive_power", "Voltage", "Global_intensity", 
            "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

colnames(data) <- column
data <- data[-1,]

#Transform and filter date / time variables for 1 - 2 Feb 2007 #

data$Date = paste(data$Date, data$Time, sep = " ")
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")
data <- data[,-c(2)]

days <- data$Date >= as.POSIXct("2007-02-01") & data$Date <= as.POSIXct("2007-02-03")
data <- data[days,]

#Convert remaining columns from factor -> char -> numeric for plots#

data[,2] <- as.numeric(as.character(data[,2]))
data[,3] <- as.numeric(as.character(data[,3]))
data[,4] <- as.numeric(as.character(data[,4]))
data[,5] <- as.numeric(as.character(data[,5]))
data[,6] <- as.numeric(as.character(data[,6]))
data[,7] <- as.numeric(as.character(data[,7]))
data[,8] <- as.numeric(as.character(data[,8]))

#Create and export Plot 1#
hist(data[,2], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()