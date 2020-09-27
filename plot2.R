#plot 2
library(data.table)
File <- "./household_power_consumption.txt"
Data <- read.table(File, sep = ";", header = TRUE, na.strings = "?", 
                   colclasses = c("character", "character", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric", "numeric", "numeric"))
subdata <- subset(Data, Data$Date == "1/2/2007" | Data$Date == "2/2/2007")
Datadatetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(Datadatetime, subdata$Global_active_power, type="l", 
     xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()