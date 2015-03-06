#read the data with a specific number of rows to the variable data. And subset the data that is needed.
data <- read.table("household_power_consumption.txt", nrows = 69517, header = TRUE, sep = ";", colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?", fill=TRUE)
data2 <- data[66637:69517,]

#Paste date and time vector together and make a date vector "x".
y <- paste(data2[,1],data2[,2])
x <- strptime(y,format="%d/%m/%Y %H:%M:%S")

#This function makes the plot, x and y axis, legend and png.
png("plot3.png",480,480)
plot(x, data2[,7], type="l", ylab="", xlab="", xaxt="n",yaxt="n")
points(x, data2[,8], type="l", ylab="", xlab="", xaxt="n",yaxt="n", col="red")
points(x, data2[,9], type="l", ylab="", xlab="", xaxt="n",yaxt="n", col="blue")
axis.POSIXct(1,at=c(x[1],x[1440],x[2881]),format="%a",labels=c("Thu","Fri","Sat"))
axis(2,at=seq(0,30, by=10))
title(ylab="Energy sub metering", )
legend("topright", pch=c(NA,NA,NA), lty=c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))
dev.off()