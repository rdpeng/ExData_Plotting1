par(mfrow=c(1,1))
hist(dataday$Global_active_power,breaks=20,col="red",ylim=c(0,1500),main = "Global Active Power")
dev.copy(png,'plot1.png',  width = 480, height = 480)
dev.off()
