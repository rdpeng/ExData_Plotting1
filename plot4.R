pwr <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
pwr$Date <- as.Date(pwr$Date,"%d/%m/%Y")
#pwr$Time <- NULL
days <- subset(pwr,pwr$Date >= "2007-02-01" & pwr$Date <= "2007-02-02")
days$Time <- as.POSIXct(strptime(paste(days$Date, days$Time), "%Y-%m-%d %H:%M:%S"))
row.names(days) <- NULL

colors <- c("black","red","blue")

par(mfrow=c(2,2), cex=0.6)
#top left
with(days, plot(Time,Global_active_power,type="l", xlab="", ylab="Global Active Power"))
#top right
with(days, plot(Time,Voltage,type="l", xlab="", ylab="Voltage"))
#bottom left
with(days, plot(Time,Sub_metering_1,type="l", xlab="", ylab="Energy sub metering"))
with(days,(lines(Time,Sub_metering_2,col="red")))
with(days,(lines(Time,Sub_metering_3,col="blue")))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = colors, lty=1, xjust=1, bty="n")
#bottom right
with(days, plot(Time,Global_reactive_power,type="l", xlab=""))

## Copy plot to a PNG file
dev.copy(png, file = "plot4.png")
dev.off()