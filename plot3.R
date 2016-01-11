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
plot(datetime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
#drawing more data
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
#drawing information
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#copy graph to PNG file
dev.copy(device = png, file="plot3.png", height=480, width=480)
dev.off()


