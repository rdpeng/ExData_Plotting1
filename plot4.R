#Setting workspace
setwd("D://workspaceR/Exploratory Data Analysis/Project 1/")
getwd()

#Change language default
Sys.setenv("LANGUAGE"="En")
Sys.setlocale("LC_ALL", "English")

#Reading days from February 2007
file <- file("household_power_consumption.txt")
df <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec = ".")
data <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

#Erasing full data to free memory
rm(df)

#construct the plot
#adjusting axes scale
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#initial plotting
par(mfrow = c(2, 2))
plot(datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l", cex = 0.2)
plot(datetime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(datetime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
#drawing information
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, lwd=2, bty="n")

plot(datetime, data$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

#copy graph to PNG file
dev.copy(device = png, file="plot4.png", height=480, width=480)
dev.off()


