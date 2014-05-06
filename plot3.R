# Read the data into R
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";") 

# Strip down to only the data on 1/2/2007 and 2/2/2007
data <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# extract the dates and times and put them into plottable format
x <- as.POSIXct(strptime(paste(data$Date,data$Time,sep=" "), format="%d/%m/%Y %H:%M:%S"))

# extract y axis numbers
y1 <- as.numeric(as.character(data$Sub_metering_1))
y2 <- as.numeric(as.character(data$Sub_metering_2))
y3 <- as.numeric(as.character(data$Sub_metering_3))

# save the plot
png(filename="plot3.png",width=480,height=480,units="px")

# create line plot
plot(x,y1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=3, col=c("black","blue","red"))
dev.off()