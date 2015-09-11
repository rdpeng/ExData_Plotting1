#setwd("R/Course4/")
## read all table from file
fileurl <- "household_power_consumption.txt"
DT <- read.table(file = fileurl, header = TRUE, quote = "", sep = ";",  na.strings = "?")

SubDT <- DT[DT$Date %in% c("1/2/2007","2/2/2007"),]     #read 2 dates
SubDT$Time<- paste(SubDT$Date, SubDT$Time)              #change class for time
SubDT$Time<- strptime(SubDT$Time, "%d/%m/%Y %H:%M:%S")  #change class for time
SubDT$Date <- as.Date(SubDT$Date, "%d/%m/%Y") #change class for date

## create the file for output
png("plot3.png", width=480, height=480,  type = c("windows", "cairo", "cairo-png")) 

## create the plot, lines and label
plot(SubDT$Time, SubDT$Sub_metering_1, pch = 20, type = "l", 
     ylab = "Energy sub metering", xlab ="") 
lines(SubDT$Time, SubDT$Sub_metering_2, col= "red")
lines(SubDT$Time, SubDT$Sub_metering_3, col= "blue")
legend("topright", col = c("black", "red", "blue"),cex=1, pt.cex =1.4, legend = 
    c("Sub_metering_1",  "Sub_metering_2", "Sub_metering_3"), 
    lty = 1, bty ="n",border ="white")


## Don't forget to close the PNG device!
dev.off()