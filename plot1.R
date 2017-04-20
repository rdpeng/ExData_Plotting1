plot1 <- function(){
    require(lubridate)
    t <- read.csv("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";")
    t$Date <- dmy(t$Date)
    datecut <- t[which(t$Date >= ymd("2007-02-01") & t$Date <= ymd("2007-02-02")),]
    datecut$Global_active_power <- as.numeric(datecut$Global_active_power)
    png("plot1.png",width = 480, height = 480)
    hist(datecut$Global_active_power, breaks=12, col="red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
    dev.off()
}

