source("loaddata.R")
png(filename = "plot2.png",
width = 480, height = 480,
units = "px", bg = "transparent")
plot(data$Global_active_power~data$DateTime, type="l",
ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
