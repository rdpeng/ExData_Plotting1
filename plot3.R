household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")
household_power_consumption$Date=as.Date(household_power_consumption$Date,"%d/%m/%Y")
res=household_power_consumption[household_power_consumption$Date > as.Date("2007/01/31"),]
res=res[res$Date<as.Date("2007/02/03"),]

## Plot3

png("Plot4.png", width=480, height=480, units="px")

par(mar = c(2,2,2,1))

plot(1:2880, as.numeric(as.vector(res$Sub_metering_1)), type = "l", xaxt = "n", xlab="", ylab = "Energy sub metering")

points(1:2880, as.numeric(as.vector(res$Sub_metering_3)), type = "l", xaxt = "n", xlab="", ylab = "Energy sub metering",
       col="blue")

points(1:2880, as.numeric(as.vector(res$Sub_metering_2)), type = "l", xaxt = "n", xlab="", ylab = "Energy sub metering",
       col="red")

axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

legend("topright" ,c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
dev.off()

