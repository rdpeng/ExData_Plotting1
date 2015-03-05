plot1 <- function() {

## Read in data and name columns    
    data <- read.table("household_power_consumption.txt", header = T, sep = ";", skip = 66636, nrows = 2880)
    colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Create device    
    png(file = "plot1.png", width = 480, height = 480)

## Create plot
    hist(data$Global_active_power, freq = T, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Close device
    dev.off()
}
