#read the data with a specific number of rows to the variable data. And subset the data that is needed.
data <- read.table("household_power_consumption.txt", nrows = 69517, header = TRUE, sep = ";", colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?", fill=TRUE)
data2 <- data[66637:69517,]

#Paste date and time vector together and make a date vector "x".
y <- paste(data2[,1],data2[,2])
x <- strptime(y,format="%d/%m/%Y %H:%M:%S")

#This function makes a plot and saves it as a png.
png("plot2.png",480,480)
plot(x, data2[,3], type="l", ylab="", xlab="", xaxt="n",yaxt="n",axes=FALSE)
axis.POSIXct(1,at=c(x[1],x[1440],x[2881]),format="%a",labels=c("Thu","Fri","Sat"))
axis(2,at=seq(0,6, by=2))
box(lwd=1)
title(ylab="Global Active Power (kilowatts)", )
dev.off()
