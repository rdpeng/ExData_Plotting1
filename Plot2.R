#Plot 2 for Coursea Project
#Data setup
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data$Time <- paste(data$Date, data$Time,sep = " ")


data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

x <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))

#plot 2
png("plot2.png", width=480, height=480)


with(x,   plot(Time, Global_active_power, type="l", xlab="",
       ylab="Global Active Power (kilowatts)"))


dev.off()