source("loaddata.R")
png(filename = "plot3.png",
width = 480, height = 480,
units = "px", bg = "transparent")
with(data, {
plot(Sub_metering_1~DateTime, type="l",
ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~DateTime,col='Red')
lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
