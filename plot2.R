consumption <- read.table("C:\\Users\\Saikiran Reddy\\Desktop\\household_power_consumption.txt", header=T, sep=";")  
power2 <- subset(consumption, Date=="1/2/2007" | Date =="2/2/2007")

power3<-transform(power2,Global_active_power=as.numeric(Global_active_power))
power3$day <- as.POSIXct(strptime(paste(power3$Date,power3$Time), " %d/%m/%Y %H:%M:%S", tz="EST"))
png(filename="Plot2.png",width=480,height=480)
plot(power3$day, power3$Global_active_power, type="l",xlab="", ylab ="Global Active Power (kilowatts)")
dev.off() 
