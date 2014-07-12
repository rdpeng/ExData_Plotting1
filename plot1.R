plot1 <- function(){
        data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
        data <- as.data.table(data)
        good <- (data$"Date" == "1/2/2007") | (data$"Date" == "2/2/2007")
        data <- data[good]
        png(file = "plot1.png")
        par(bg = "transparent")
        hist(as.numeric(data$Global_active_power), col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
        dev.off()
}
