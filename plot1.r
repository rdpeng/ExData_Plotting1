png(filename = "plot1.png",width = 480,height = 480,bg="transparent")
with(data,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()