# This code produces the plot 4
# Please ensure household_power_consumption.txt is in the working directory
if(!file.exists("household_power_consumption.txt")) {
        Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(Url,destfile="./hd.zip",method="curl")
        unzip(zipfile="./hd.zip")
}
# Code for reading the data
hd <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hd[,1]<- as.Date(hd[,1], format="%d/%m/%Y")
d <- subset(hd, Date=="2007-02-01"|Date=="2007-02-02")
d$Time <- strptime(paste(as.character(d$Date), as.character(d$Time), sep=' '),format="%Y-%m-%d %H:%M:%S")

# Code for generating png file
png("Plot4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(d$Time, d$Global_active_power, ylab="Global active power (kilowatts)", xlab="", type="n")
lines(d$Time, d$Global_active_power)

plot(d$Time, d$Sub_metering_1, xlab="", ylab="Energy sub metering",type="n")
lines(d$Time, d$Sub_metering_1)
lines(d$Time, d$Sub_metering_2, col="red")
lines(d$Time, d$Sub_metering_3, col="blue")
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch=c(NA,NA,NA), lwd=1)

plot(d$Time, d$Voltage, ylab="Voltage", xlab="datetime", type="n")
lines(d$Time, d$Voltage)

plot(d$Time, d$Global_reactive_power, xlab="datetime", type="n")
lines(d$Time, d$Global_reactive_power)
dev.off()