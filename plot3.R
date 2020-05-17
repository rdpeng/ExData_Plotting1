setwd("C:/Users/aless/Documents/data science/Exploring data/Week 1 - plotting exercise")
# importing data into a file which is in that workding directory
dataset <- read.table("household_power_consumption.txt",header= TRUE, sep = ";", na.strings="?")
# converting Dates respectively
dataset$Date <- as.Date(dataset$Date, format= "%d/%m/%Y")
# subseting the data to limit to those with selected dates
data_touse <- subset(dataset, Date >= "2007-02-01" & Date <= "2007-02-02")
# convert Time in time format
data_touse$Time <- strptime(data_touse$Time,format= "%H:%M:%S")
png(file ="plot3.png", width=480, height=480)
plot(data_touse$Time,data_touse$Sub_metering_1, type="l", ylab="Energy sub-metering", xlab="")
lines(data_touse$Time,data_touse$Sub_metering_2, col="red")
lines(data_touse$Time,data_touse$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()