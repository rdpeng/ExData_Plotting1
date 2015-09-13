#2nd plot
mydata = read.csv("household_power_consumption_feb1and2.csv") # load in csv
png('plot2.png')
plot(mydata$Global_active_power, type="l", col="black", ann=FALSE, xaxt="n")
title(ylab="Global Active Power (kilowatts)")
axis(1,label="Thu", at = 50)
axis(1, label = "Fri", at = 1450)
axis(1, label = "Sat", at = 2900)
dev.off()
