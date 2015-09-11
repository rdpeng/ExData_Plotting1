setwd("R/Course4/")
## read all table from file
fileurl <- "household_power_consumption.txt"
DT <- read.table(file = fileurl, header = TRUE, quote = "", sep = ";",  na.strings = "?")

SubDT <- DT[DT$Date %in% c("1/2/2007","2/2/2007"),]     #read 2 dates
SubDT$Time<- paste(SubDT$Date, SubDT$Time)              #change class for time
SubDT$Time<- strptime(SubDT$Time, "%d/%m/%Y %H:%M:%S")  #change class for time
SubDT$Date <- as.Date(SubDT$Date, "%d/%m/%Y") #change class for date


## create the plot
plot(SubDT$Time, SubDT$Global_active_power, pch = 20, type = "l", 
     ylab = "Global active power", xlab ="") 

dev.copy(png, file = "plot2.png")
## Don't forget to close the PNG device!
dev.off()