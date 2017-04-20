plot4 <- function(){
    require(lubridate)
    t <- read.csv("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";")
    t$Date <- dmy(t$Date)
    datecut <- t[which(t$Date >= ymd("2007-02-01") & t$Date <= ymd("2007-02-02")),]
    datecut$Date2 <- ymd_hms(paste(datecut$Date, datecut$Time, sep = " "))
    datecut$Global_active_power <- as.numeric(datecut$Global_active_power)
    datecut$Sub_metering_1 <- as.numeric(datecut$Sub_metering_1)
    datecut$Sub_metering_2 <- as.numeric(datecut$Sub_metering_2)
    datecut$Voltage <- as.numeric(datecut$Voltage)
    datecut$Global_reactive_power <- as.numeric(datecut$Global_reactive_power)
    
    #2 by 2 matrix of graphs
    png("plot4.png", width= 480, height = 480)
    par(mfcol = c(2,2))
    
    #1st graph, plot2
    plot(datecut$Date2, datecut$Global_active_power, type = "l", xlab="", ylab="Global Active Power")
    
    #2nd graph, plot3
    plot(datecut$Date2, datecut$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
    lines(datecut$Date2, datecut$Sub_metering_1, col= "black")
    lines(datecut$Date2, datecut$Sub_metering_2, col = "red")
    lines(datecut$Date2, datecut$Sub_metering_3, col = "blue")
    legend("topright", lwd = c(1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), bty = "n")
    
    #3rd graph
    plot(datecut$Date2, datecut$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

    #4th graph
    plot(datecut$Date2, datecut$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
    
    dev.off()
    
    
}

