#read the data with a specific number of rows to the variable data. And subset the data that is needed.
data <- read.table("household_power_consumption.txt", nrows = 69517, header = TRUE, sep = ";", colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?", fill=TRUE)
data2 <- data[66637:69517,]

#Paste date and time vector together and make a date vector "x".
y <- paste(data2[,1],data2[,2])
x <- strptime(y,format="%d/%m/%Y %H:%M:%S")

#Saves the graphs to png and puts 4 graphs in one png
png("plot4.png",480,480)
par(mfcol = c(2,2))

#The next functions are the functions for plotting the four graphs
plot(x, data2[,3], type="l", ylab="", xlab="", xaxt="n",yaxt="n",axes=FALSE)
axis.POSIXct(1,at=c(x[1],x[1440],x[2881]),format="%a",labels=c("Thu","Fri","Sat"))
axis(2,at=seq(0,6, by=2))
box(lwd=1)
title(ylab="Global Active Power", )

plot(x, data2[,7], type="l", ylab="", xlab="", xaxt="n",yaxt="n")
points(x, data2[,8], type="l", ylab="", xlab="", xaxt="n",yaxt="n", col="red")
points(x, data2[,9], type="l", ylab="", xlab="", xaxt="n",yaxt="n", col="blue")
axis.POSIXct(1,at=c(x[1],x[1440],x[2881]),format="%a",labels=c("Thu","Fri","Sat"))
axis(2,at=seq(0,30, by=10))
title(ylab="Energy sub metering", )
legend("topright", pch=c(NA,NA,NA), lty=c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),bty="n")

plot(x, data2[,5], type="l", ylab="", xlab="", xaxt="n",yaxt="n")
axis.POSIXct(1,at=c(x[1],x[1440],x[2881]),format="%a",labels=c("Thu","Fri","Sat"))
axis(2,at=seq(234,246, by=2))
title(ylab="Voltage", xlab="datetime" )

plot(x, data2[,4], type="l", ylab="", xlab="", xaxt="n",yaxt="n")
axis.POSIXct(1,at=c(x[1],x[1440],x[2881]),format="%a",labels=c("Thu","Fri","Sat"))
axis(2,at=seq(0,0.5, by=0.1))
title(ylab="Global_reactive_power", xlab="datetime" )
dev.off()