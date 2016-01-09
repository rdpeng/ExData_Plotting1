with(dataday, plot(Time, Global_active_power, type="l",xlab="",ylab="Global Active Power (in kilowatts)"))
dev.copy(png,file="plot2.png")
dev.off()
