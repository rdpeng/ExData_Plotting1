library(data.table)

setwd("/Users/earthkwaque/Projects/rdata/coursera/data/")

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(fileurl, destfile = "household_power_consumption.zip", method="curl")
# unzip("household_power_consumption.zip", overwrite = TRUE)
file <- "household_power_consumption.txt"

ALL <- suppressWarnings(fread(file, na.strings="?"))
setkey(ALL, Date)

DT <- ALL[c("1/2/2007","2/2/2007"),]

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma= c(0, 0, 2, 0))
with(DT, {
        plot(DT$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "", cex.axis= 0.6, cex.lab = 0.6, axes=FALSE)
                axis(1, at=c(1,2880/2,2880), lab=c("Thu", "Fri", "Sat"), cex.axis=0.7)
                axis(2, cex.axis=0.8, ylab = "Global Active Power (kilowatts)")
                box()
        
        plot(DT$Voltage, type="l", axes=F, xlab="datetime", ylab = "Voltage", cex.lab=0.6)
                axis(1, at=c(1,2880/2,2880), lab=c("Thu", "Fri", "Sat"), cex.axis=0.7)
                axis(2, cex.axis=0.6)
                box()
        
        plot(DT$Sub_metering_1, type="l", axes=F, xlab="", ylab="Energy sub metering", cex.lab=0.6)
        lines(DT$Sub_metering_2, col="red")
        lines(DT$Sub_metering_3, col="blue")
                axis(1, at=c(1,2880/2,2880), lab=c("Thu", "Fri", "Sat"), cex.axis=0.7)
                axis(2, cex.axis=0.7)
                box()
                legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
                       cex=0.5, col=c("black", "red","blue"), lty=1, bty="n")
        
        plot(DT$Global_reactive_power, type="l", axes=F, xlab="datetime", ylab = "Global_reactive_power", cex.lab=0.6)
                axis(1, at=c(1,2880/2,2880), lab=c("Thu", "Fri", "Sat"), cex.axis=0.7)
                axis(2, cex.axis=0.6)
                box()       
})

dev.copy(png, file = "plot4.png")
dev.off()
par(mfrow=c(1,1))