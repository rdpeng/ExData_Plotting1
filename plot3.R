 setwd("~/Desktop/coursera /ExData_Plotting1")
rm(list=ls())## remove files for clarity
summary("household_power_consumption.txt")

hpc <- read.csv("household_power_consumption.txt",
                sep=";",
                dec=".",
                stringsAsFactors= FALSE,
                na.strings = "?",
                colClasses=c("character", "character", "numeric", "numeric", "numeric", 
                "numeric", "numeric", "numeric", "numeric")) ## sets column classes
summary(hpc)

subSet_hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]## subsets dates used in plots
summary(subSet_hpc)

datetime <- strptime(paste(subSet_hpc$Date, subSet_hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
## converts date and time from character to object

## as.numeric converts data to a more workable form
GlobalActivePower <- as.numeric(subSet_hpc$Global_active_power)
subMetering1 <- as.numeric(subSet_hpc$Sub_metering_1)
subMetering2 <- as.numeric(subSet_hpc$Sub_metering_2)
subMetering3 <- as.numeric(subSet_hpc$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()## save plot to R
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
                legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
                , lty=1, lwd=2.5, col=c("black", "red", "blue"))
##puts plot in device after saving, need to remember to turn off device
