
##Set the working directory to the location where input data file exists

power_data <- read.table("household_power_consumption.txt",header=T,sep=";")
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

# subsetting for the required 2 dates
power <- subset(power_data,Date == "2007-02-01"| Date=="2007-02-02")

power$Time <- as.character(power$Time)
power$datetime <- paste(power$Date,power$Time)
power$datetime <- as.POSIXlt(power$datetime,format="%Y-%m-%d %H:%M:%S")
power <- power[order(power$datetime),]

png(filename="plot3.png",width=480,height=480,units="px",bg="white")
plot(as.numeric(power$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering",xaxt="n",yaxt="n")
points(as.numeric(power$Sub_metering_2)/5,type="l",xaxt="n",col="red")
points(as.numeric(power$Sub_metering_3),type="l",xaxt="n",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="___",col=c("black","red","blue"))
axis(1,at=c("0","1500","2900"),labels=c("Thu","Fri","Sat"))
axis(2,at=c("10","20","30"),labels=c("10","20","30"))
dev.off()
