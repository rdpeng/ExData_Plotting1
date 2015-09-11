power_all <- read.delim("C:\\Users\\rcorak\\Documents\\MyRStuff\\ProgrammingAssignment2\\household_power_consumption.txt",header = TRUE,sep = ";") ##, colClasses = "character")
power_all$Date <- as.Date(power_all$Date, format="%d/%m/%Y")
power_sub <- power_all[(power_all$Date == "2007-02-01") | (power_all$Date == "2007-02-02"),]

power_sub$Global_active_power <- as.numeric(as.character(power_sub$Global_active_power))
power_sub <- transform(power_sub, timestamp=as.POSIXct(paste(Date, Time)), "%d-%m-%Y %H:%M:%S")
plot(power_sub$timestamp, power_sub$Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")

dev.copy(png,filename="plot2.png")
dev.off ()