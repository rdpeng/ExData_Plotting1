
setwd("C:/Users/user/Documents/work")
file <- "household_power_consumption.txt"
cp1_data <- read.table(file, header = FALSE, sep = ";", skip = 1, colClasses = c(rep("character",2), rep("numeric", 7)), na.strings = "?")
cnames <- readLines(file, 1)
cnames <- strsplit(cnames, ";", fixed = TRUE)
names(cp1_data) <- cnames[[1]]
cp1_data <- cp1_data[cp1_data$Date %in% c("1/2/2007", "2/2/2007"), 
                                 ]
head(cp1_data)


cp1_data$Date_Time <- paste(cp1_data$Date, cp1_data$Time)
cp1_data$Date_Time <- strptime(cp1_data$Date_Time, "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480, units = "px", bg = "white")
plot(x = cp1_data$Date_Time, y = cp1_data$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub metering")
lines(x = cp1_data$Date_Time, y = cp1_data$Sub_metering_1)
lines(x = cp1_data$Date_Time, y = cp1_data$Sub_metering_2, col = "red")
lines(x = cp1_data$Date_Time, y = cp1_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, col = c("black", "red", "blue"))

dev.off()
