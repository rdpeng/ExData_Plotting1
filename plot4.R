setwd("C:/Users/aless/Documents/data science/Exploring data/Week 1 - plotting exercise")
# importing data into a file which is in that workding directory
dataset <- read.table("household_power_consumption.txt",header= TRUE, sep = ";", na.strings="?")
# converting Dates respectively
dataset$Date <- as.Date(dataset$Date, format= "%d/%m/%Y")
# subseting the data to limit to those with selected dates
data_touse <- subset(dataset, Date >= "2007-02-01" & Date <= "2007-02-02")
# convert Time in time format
data_touse$Time <- strptime(data_touse$Time,format= "%H:%M:%S")
par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_touse, plot(Time, Global_active_power, type="l", ylab="Global Active Power", xlab =""))
with(data_touse, plot(Time,Voltage, type="l",ylab="Voltage",xlab=""))
plot(data_touse$Time,data_touse$Sub_metering_1, type="l", ylab="Energy sub-metering", xlab="")
lines(data_touse$Time,data_touse$Sub_metering_2, col="red")
lines(data_touse$Time,data_touse$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(data_touse, plot(Time, Global_reactive_power, type="l", ylab="Global Reactive Power", xlab =""))
dev.copy(png, file="plot4.png", width=720, height=720)
dev.off()