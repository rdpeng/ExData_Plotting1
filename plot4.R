#make 4th plot with 4 charts

mydata = read.csv("household_power_consumption_feb1and2.csv") # load in csv

png('plot4.png')

par(mfrow=c(2,2))

plot(mydata$Global_active_power, type="l", col="black", ann=FALSE, xaxt="n")
title(ylab="Global Active Power")
axis(1,label="Thu", at = 50)
axis(1, label = "Fri", at = 1450)
axis(1, label = "Sat", at = 2900)


plot(mydata$Voltage, type="l", col="black", ann=FALSE, xaxt="n")
title(ylab="Voltage")
title(xlab="datetime")
axis(1,label="Thu", at = 50)
axis(1, label = "Fri", at = 1450)
axis(1, label = "Sat", at = 2900)



plot(mydata$Sub_metering_1, type="l", col="black", ann=FALSE, xaxt="n")
lines(mydata$Sub_metering_2, type="l", col="red", ann=FALSE, xaxt="n")
lines(mydata$Sub_metering_3, type="l", col="blue", ann=FALSE, xaxt="n")
title(ylab="Energy sub metering")
axis(1,label="Thu", at = 50)
axis(1, label = "Fri", at = 1450)
axis(1, label = "Sat", at = 2900)

plot(mydata$Global_reactive_power, type="l", col="black", ann=FALSE, xaxt="n")
title(ylab="Global_reactive_power")
title(xlab="datetime")
axis(1,label="Thu", at = 50)
axis(1, label = "Fri", at = 1450)
axis(1, label = "Sat", at = 2900)

dev.off()
