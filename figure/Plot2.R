#Plot 2
house <- read.table("household_power_consumption.txt", header=T, sep=";")  
house1 <- subset(house, Date=="1/2/2007" | Date =="2/2/2007")
house1
house1$Global_active_power <- as.numeric(as.character(house1$Global_active_power))
house1$day <- as.POSIXct(strptime(paste(house1$Date,house1$Time), " %d/%m/%Y %H:%M:%S", tz="EST"))
png(filename="Plot2.png",width=480,height=480)
plot(house1$day, house1$Global_active_power, type="l",xlab="", ylab ="Global Active Power (kilowatts)")
dev.off()