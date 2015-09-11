#setwd("R/Course4/")
## read all table from file
fileurl <- "household_power_consumption.txt"
DT <- read.table(file = fileurl, header = TRUE, quote = "", sep = ";",  na.strings = "?")

SubDT <- DT[DT$Date %in% c("1/2/2007","2/2/2007"),]     #read 2 dates
SubDT$Time<- paste(SubDT$Date, SubDT$Time)              #change class for time
SubDT$Time<- strptime(SubDT$Time, "%d/%m/%Y %H:%M:%S")  #change class for time
SubDT$Date <- as.Date(SubDT$Date, "%d/%m/%Y") #change class for date

## create the file for output
png("plot4.png", width=480, height=480,  type = c("windows", "cairo", "cairo-png"))

## create multiplot sheet
par(mfcol = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# create plot 1
plot(SubDT$Time, SubDT$Global_active_power, pch = 20, type = "l", 
     ylab = "Global active power", xlab ="")

# create plot 2
plot(SubDT$Time, SubDT$Sub_metering_1, pch = 20, type = "l", 
     ylab = "Energy sub metering", xlab ="") #plot 4.2
lines(SubDT$Time, SubDT$Sub_metering_2, col= "red")
lines(SubDT$Time, SubDT$Sub_metering_3, col= "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
     "Sub_metering_2", "Sub_metering_3"), lty = 1, bty ="n",border ="white")

# create plot 3
plot(SubDT$Time, SubDT$Voltage, pch = 20, type = "l", 
     ylab = "Voltage", xlab ="datetime") #plot 4.3

# create plot 4
plot(SubDT$Time, SubDT$Global_reactive_power, pch = 20, type = "l", 
     ylab = "Global reactive power", xlab ="datetime") #plot 4.4


## Don't forget to close the PNG device!
dev.off()