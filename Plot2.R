# This code produces the plot 2
# Please ensure household_power_consumption.txt is in the working directory

# Code for reading the data
hd <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hd[,1]<- as.Date(hd[,1], format="%d/%m/%Y")
d <- subset(hd, Date=="2007-02-01"|Date=="2007-02-02")
d$Time <- strptime(paste(as.character(d$Date), as.character(d$Time), sep=' '),format="%Y-%m-%d %H:%M:%S")

# Code for generating png file
png("Plot2.png", width=480, height=480)
plot(d$Time, d$Global_active_power, ylab="Global active power (kilowatts)", xlab="", type="n")
lines(d$Time, d$Global_active_power)
dev.off()

