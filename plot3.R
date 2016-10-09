## Read in the data
epcfull <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")

## Set the dates column to char class to set up the subselection
dt <- as.character(epcfull$Date)
epc <- cbind(dt, epcfull)

## subselect the days we are interested in
epc <- subset(epc,epc$dt =="1/2/2007" | epc$dt == "2/2/2007")

## Create a POSIXct column for easier analysis
epc$Time <- as.character(epc$Time)
epc$dt <- strptime(paste(epc$d, epc$Time, sep =" "),format = "%d/%m/%Y %H:%M:%S")

## make the Sub Metering columns numeric
epc$Sub_metering_1 <- as.numeric(as.character(epc$Sub_metering_1))
epc$Sub_metering_2 <- as.numeric(as.character(epc$Sub_metering_2))
epc$Sub_metering_3 <- as.numeric(as.character(epc$Sub_metering_3))

## Set up file to save PNG in
png('plot3.png, width = 480, height = 480')

## Initiate the Plot
plot(epc$dt, epc$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering", yaxt = "n", ylim = c(0,35))
axis(2,c(0,10,20,30))
lines(epc$dt, epc$Sub_metering_1, col = "cornsilk4")
lines(epc$dt, epc$Sub_metering_2, col = "red")
lines(epc$dt, epc$Sub_metering_3, col = "blue")
legend("topright", c(names(epc)[8:10]), col = c("cornsilk4", "red", "blue"), 
         lty = 1, lwd = 1, y.intersp = .75, cex = 1)

dev.off()