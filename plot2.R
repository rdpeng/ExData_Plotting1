plot2 <- function(){
        data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
        data <- as.data.table(data)
        good <- (data$"Date" == "1/2/2007") | (data$"Date" == "2/2/2007")
        data <- data[good]
        png(file = "plot2.png")
        par(bg = "transparent")
        plot(data$Global_active_power, type = "s", ylab = "Global Active Power (Kilowatts)", xlab = "")
        dev.off()
}
