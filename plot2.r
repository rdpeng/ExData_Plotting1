png(filename = "plot2.png",width = 480,height = 480)
with(data,plot(data$DateTime,Global_active_power,pch=NA_integer_, ylab = "Global Active Power (kilowatts)",xlab=""))
lines(data$DateTime,data$Global_active_power)
dev.off()
