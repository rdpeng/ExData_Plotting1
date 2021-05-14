#read table into R and filter out unneeded dates
hhpc <- read.table("./household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
hhpc <- hhpc[hhpc$Date == "1/2/2007" | hhpc$Date == "2/2/2007",]
#convert to POSIXCT
datetime <- paste(hhpc$Date, hhpc$Time)
DateTime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
hhpc <- cbind('DateTime' = DateTime, hhpc)
#create plot
png(filename = "plot1.png")
hist(hhpc$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()