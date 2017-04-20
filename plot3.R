plot3 <- function(){
    require(lubridate)
    t <- read.csv("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";")
    t$Date <- dmy(t$Date)
    datecut <- t[which(t$Date >= ymd("2007-02-01") & t$Date <= ymd("2007-02-02")),]
    datecut$Date2 <- ymd_hms(paste(datecut$Date, datecut$Time, sep = " "))
    datecut$Sub_metering_1 <- as.numeric(datecut$Sub_metering_1)
    datecut$Sub_metering_2 <- as.numeric(datecut$Sub_metering_2)
    png("plot3.png", width= 480, height = 480)
    plot(datecut$Date2, datecut$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
    lines(datecut$Date2, datecut$Sub_metering_1, col= "black")
    lines(datecut$Date2, datecut$Sub_metering_2, col = "red")
    lines(datecut$Date2, datecut$Sub_metering_3, col = "blue")
    legend("topright", lwd = c(1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
    dev.off()
}
