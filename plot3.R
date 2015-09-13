#3rd plot
mydata = read.csv("household_power_consumption_feb1and2.csv") # load in csv
png('plot3.png')


plot(mydata$Sub_metering_1, type="l", col="black", ann=FALSE, xaxt="n")
lines(mydata$Sub_metering_2, type="l", col="red", ann=FALSE, xaxt="n")
lines(mydata$Sub_metering_3, type="l", col="blue", ann=FALSE, xaxt="n")
title(ylab="Energy sub metering")
axis(1,label="Thu", at = 50)
axis(1, label = "Fri", at = 1450)
axis(1, label = "Sat", at = 2900)

legend("topright",'groups',c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
	,lty = c(1,1,1),col=c('black','red','blue'))
dev.off()
