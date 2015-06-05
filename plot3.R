powerdat <- read.csv("~/Documents/R/Coursera/household_power_consumption.txt", 
                     sep=";", na.strings = "?", stringsAsFactors = FALSE)
datetime<- paste(powerdat[,1], powerdat[,2],sep = ",")
datetime<- strptime(datetime,"%d/%m/%Y,%T")
powerdat <- cbind(powerdat,datetime)
with(powerdat, {
    plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering") 
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", 
        "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"))
})
dev.copy(device = png, file = "plot2.png") #saves plot from r as a png
dev.off()
