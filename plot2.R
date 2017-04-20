plot2 <- function(){
    require(lubridate)
    t <- read.csv("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";")
    t$Date <- dmy(t$Date)
    datecut <- t[which(t$Date >= ymd("2007-02-01") & t$Date <= ymd("2007-02-02")),]
    datecut$Date2 <- ymd_hms(paste(datecut$Date, datecut$Time, sep = " "))
    datecut$Global_active_power <- as.numeric(datecut$Global_active_power)
    png("plot2.png", width= 480, height = 480)
    plot(datecut$Date2, datecut$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
}
    