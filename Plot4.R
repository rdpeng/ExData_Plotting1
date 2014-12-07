#Set working directory to /Desktop/CoureraR (default setting)

#Load a subset of the dataset and specify variables and date, time format

data <- read.csv("household_power_consumption.txt", skip=66637, nrows=2880, na.strings = "?", header=F, sep=";")
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#Open the png device

png(filename="Plot4.png", width=480, height=480)

#Create the 4 plots in a 2x2 configuration

par(mfcol=c(2,2))

#plot 1
plot(data$DateTime, data$Global_active_power, type="l", col="black", xlab="",
 ylab="Global Active Power (kilowatts)", main="")
 
#plot 2

plot(data$DateTime, data$Sub_metering_1, type="l", col="black", xlab="",
 ylab="Energy sub metering", main="")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", lwd=1, lty=1, col = c("black", "red", "blue"),
 legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 
 #plot 3
 
plot(data$DateTime, data$Voltage, type="l", col="black",
 xlab="datetime", ylab="Voltage", main="")

#plot 4

plot(data$DateTime, data$Global_reactive_power, type="l", col="black",
 xlab="datetime", ylab="Global_reactive_power", main="")

#Sign out

dev.off()
